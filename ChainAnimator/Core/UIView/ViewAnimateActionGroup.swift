//
//  ViewAnimateActionGroup.swift
//  ChainAnimator
//
//  Created by Hobi on 2019/1/25.
//  Copyright © 2019年 Hobi. All rights reserved.
//

import UIKit

typealias ViewAnimationCreatorClosure = () -> Void

class ViewAnimateActionGroup: NSObject, AnimationConfigProtocol {
    
    var delay: TimeInterval = 0
    
    var isAnimating: Bool = false
    
    var animationStopCallBack: AnimationStopCallBackClosure?
    
    var animationStopCallBackToAnimator: AnimationStopCallBackClosure?
    
    var animateCreatorArray: [ViewAnimationCreatorClosure] = [ViewAnimationCreatorClosure]()
    
    private var animateIdx: Int = 0
    
    /// 操作 时长 delay 重复次数
    var animateActionArray: [([ViewAnimationCreatorClosure], TimeInterval, TimeInterval, Int)] = [([ViewAnimationCreatorClosure], TimeInterval, TimeInterval, Int)]()
    
    override init() {
        super.init()
    }
    
    deinit {
        print("release view")
    }
    
    func addAnimationCreator(_ creator: @escaping ViewAnimationCreatorClosure) {
        animateCreatorArray.append(creator)
    }
    
    func configPrevChainLink(duration: TimeInterval, delay: TimeInterval, repeatCount: Int) {
        
        // 保存操作到队列中
        // 拷贝一次数组
        let creatorArray = animateCreatorArray
        animateActionArray.append((creatorArray, duration, delay, repeatCount))
        animateCreatorArray.removeAll()
    }
    
    @objc func innerExcuteAnimationGroup(on view: UIView) {
        
        guard animateIdx < animateActionArray.count else {
            return
        }
        
        let animateConfigTuple = animateActionArray[animateIdx]
        let actionArray = animateConfigTuple.0
        let duration = animateConfigTuple.1
        let delay = animateConfigTuple.2
        let repeatCount = animateConfigTuple.3
        
        UIView.animate(withDuration: duration, delay: delay, options: .allowUserInteraction, animations: {
            UIView.setAnimationRepeatCount(Float(repeatCount))
            for action in actionArray {
                action()
            }
        }) { (flag) in
            
            self.animateIdx = self.animateIdx + 1
            
            if flag {
                // 完成了
                /*
                 继续播放下一个动画
                 如果idx >= count 说明已经播放完了 回调到外面
                 */
                
                if self.animateIdx >= self.animateActionArray.count {
                    // 全部animate之前的动画已经播放完成
                    self.finish(flag)
                } else {
                    // 继续播放
                    self.innerExcuteAnimationGroup(on: view)
                }
            } else {
                // 停止了
                self.finish(flag)
            }
        }
    }
    
    private func finish(_ flag: Bool) {
        // 停止了
        isAnimating = false
        animationStopCallBack?(flag)
        animationStopCallBackToAnimator?(flag)
        animationStopCallBack = nil
        animationStopCallBackToAnimator = nil
        animateCreatorArray.removeAll()
        animateActionArray.removeAll()
    }
    
    func excuteAnimationGroup(on view: UIView) {
        self.cleanDelayExcuting(on: view)
        self.perform(#selector(innerExcuteAnimationGroup(on:)), with: view, afterDelay: delay)
    }
    
    func cleanDelayExcuting(on view: UIView) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(innerExcuteAnimationGroup(on:)), object: view)
    }
}
