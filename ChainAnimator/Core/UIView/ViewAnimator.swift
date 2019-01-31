//
//  ViewAnimator.swift
//  ChainAnimator
//
//  Created by Hobi on 2019/1/25.
//  Copyright © 2019年 Hobi. All rights reserved.
//

import UIKit

class ViewAnimator: ChainAnimatorProtocol {
    
    typealias AnimationItem = ViewAnimateActionGroup
    
    var animationWaitChain: [ViewAnimateActionGroup]
    
    var animationExcutingChain: [ViewAnimateActionGroup]
    
    /// view 引用
    weak var view: UIView?
    
    init() {
        animationWaitChain = [ViewAnimateActionGroup]()
        animationExcutingChain = [ViewAnimateActionGroup]()
    }
    
    func resume() -> Self {
        return self
    }
    
    func pause() -> Self {
        return self
    }
    
    func stop() -> Self {
        guard let view = view else {
            return self
        }
        
        for animationGroup in animationExcutingChain {
            animationGroup.cleanDelayExcuting(on: view)
        }
        
        animationWaitChain.removeAll()
        animationExcutingChain.removeAll()

        self.view?.layer.removeAllAnimations()
        return self
    }
    
    @discardableResult
    func animate(delay: TimeInterval = 0, finishCallBack: AnimationStopCallBackClosure? = nil) -> Self {
        /*
         把wait group 移到excuting
         */
        guard let firstGroup = animationWaitChain.first else {
            return self
        }
        firstGroup.delay = delay
        firstGroup.animationStopCallBack = finishCallBack
        
        // 从等待队列移除，放到执行队列
        animationWaitChain.removeFirst()
        animationExcutingChain.append(firstGroup)
        animationChainContinue()
        return self
    }
    
    func then(duration: TimeInterval, repeatCount: Int = 1, delay: TimeInterval = 0) -> Self {
        /*
         把wait group 移到excuting
         */
        guard let firstGroup = animationWaitChain.first else {
            return self
        }
        //        firstGroup.duration = duration
        //        firstGroup.repeatCount = repeatCount
        //        firstGroup.delay = firstGroup.delay + delay
        
        firstGroup.configPrevChainLink(duration: duration, delay: delay, repeatCount: repeatCount)
        return self
    }
}

// MARK: - 对外逻辑
extension ViewAnimator {
    /// 自定义构造Animation，用于完全动画内容自定义
    ///
    /// - Parameter animationCreatorClosure: 修改view的值的闭包
    /// - Returns: Self
    @discardableResult
    func customAnimation(_ animationCreatorClosure: @escaping ViewAnimationCreatorClosure) -> Self {
        currentAnimationGroup().addAnimationCreator(animationCreatorClosure)
        return self
    }
}

// MARK: - 内部方法
extension ViewAnimator {
    /// 继续执行动画链路
    private func animationChainContinue() {
        /*
         1. 判断链路状态是否需要停止
         2. 不需要停止 - 判断是否有正在执行 - 有执行的话return，没有执行的话，执行动画
         */
        
        guard let view = self.view, let firstGroup = animationExcutingChain.first else {
            return
        }
        
        firstGroup.animationStopCallBackToAnimator = { [weak self] (flag) in
            // 完成之后 继续执行
            if flag {
                // 正常结束
                self?.animationExcutingChain.removeFirst()
                self?.animationChainContinue()
            } else {
                // 链路停止了
            }
        }
        
        if !firstGroup.isAnimating {
            firstGroup.excuteAnimationGroup(on: view)
        }
    }
    
    /// 获取当前动画组
    ///
    /// - Returns: 动画组
    private func currentAnimationGroup() -> ViewAnimateActionGroup {
        // 判断有没有group，没有的话创建一个
        if let group = animationWaitChain.first {
            return group
        } else {
            let group = ViewAnimateActionGroup()
            animationWaitChain.append(group)
            return group
        }
    }
}
