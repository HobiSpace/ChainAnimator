//
//  LayerAnimator.swift
//  ChainAnimator
//
//  Created by Hobi on 2019/1/23.
//  Copyright © 2019年 Hobi. All rights reserved.
//

import UIKit

class LayerAnimator {
    
    /// 当前在等待需要执行的group数组
    var animationWaitChain: [LayerAnimateActionGroup]
    
    /// 正在执行的动画group数组
    var animationExcutingChain: [LayerAnimateActionGroup]
    
    /// view 引用
    weak var view: UIView?
    
    init() {
        animationWaitChain = [LayerAnimateActionGroup]()
        animationExcutingChain = [LayerAnimateActionGroup]()
    }
}

// MARK: - 对外基础功能
extension LayerAnimator {
    
    /// 自定义构造Animation，用于完全动画内容自定义
    ///
    /// - Parameter animationCreatorClosure: caAnimation作为返回值的构造closure
    /// - Returns: LayerAnimator
    @discardableResult
    func customAnimation(_ animationCreatorClosure: @escaping LayerAnimationCreatorClosure) -> LayerAnimator {
        currentAnimationGroup().addAnimationCreator(animationCreatorClosure)
        return self
    }
    
    /// 执行动画
    ///
    /// - Parameters:
    ///   - duration: 动画时长
    ///   - repeatCount: 动画重复次数
    ///   - delay: 动画执行延迟
    ///   - finishCallBack: 动画完成回调了
    /// - Returns: LayerAnimator
    @discardableResult
    func animate(duration: TimeInterval, repeatCount: Int = 1, delay: TimeInterval = 0, finishCallBack: LayerAnimationGroupFinishCallBackClosure? = nil) -> LayerAnimator {
        
        /*
         把wait group 移到excuting
         */
        guard let firstGroup = animationWaitChain.first else {
            return self
        }
        firstGroup.duration = duration
        firstGroup.repeatCount = repeatCount
        firstGroup.delay = delay
        firstGroup.groupAnimationFinishCallBack = finishCallBack
        
        // 从等待队列移除，放到执行队列
        animationWaitChain.removeFirst()
        animationExcutingChain.append(firstGroup)
        animationChainContinue()
        return self
    }
    
    @discardableResult
    func pause() -> LayerAnimator {
        guard let view = view else {
            return self
        }
        let pausedTime = view.layer.convertTime(CACurrentMediaTime(), from: nil)
        view.layer.speed = 0.0
        view.layer.timeOffset = pausedTime
        return self
    }
    
    @discardableResult
    func resume() -> LayerAnimator {
        guard let view = view else {
            return self
        }
        let pausedTime = view.layer.timeOffset
        view.layer.speed = 1.0
        view.layer.timeOffset = 0.0
        view.layer.beginTime = 0.0
        let timeSincePause = view.layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        view.layer.beginTime = timeSincePause
        return self
    }
    
    /// 停止当前动画链所有动画
    ///
    /// - Returns: LayerAnimator
    @discardableResult
    func stop() -> LayerAnimator {
        guard let view = view else {
            return self
        }
        
        for animationGroup in animationExcutingChain {
            // 正在执行的
            if animationGroup.isGroupAnimating {
                view.layer.removeAnimation(forKey: animationGroup.animationKey)
            }
        }
        
        animationWaitChain.removeAll()
        animationExcutingChain.removeAll()
        
        return self
    }
}

// MARK: - 内部逻辑
extension LayerAnimator {
    
    private func currentAnimationGroup() -> LayerAnimateActionGroup {
        // 判断有没有group，没有的话创建一个
        if let group = animationWaitChain.first {
            return group
        } else {
            let group = LayerAnimateActionGroup()
            animationWaitChain.append(group)
            return group
        }
    }
    
    private func animationChainContinue() {
        
        /*
         1. 判断链路状态是否需要停止
         2. 不需要停止 - 判断是否有正在执行 - 有执行的话return，没有执行的话，执行动画
         */
        
        guard let view = self.view, let firstGroup = animationExcutingChain.first else {
            return
        }
        
        firstGroup.groupAnimationFinishCallBackToAnimator = { [weak self] (anim, flag) in
            // 完成之后 继续执行
            if flag {
                // 正常结束
                self?.animationExcutingChain.removeFirst()
                self?.animationChainContinue()
            } else {
                // 链路停止了
            }
        }
        
        if !firstGroup.isGroupAnimating {
            firstGroup.animationGroupStart(on: view)
        }
    }
}



