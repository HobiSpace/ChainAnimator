//
//  LayerAnimateActionGroup.swift
//  ChainAnimator
//
//  Created by Hobi on 2019/1/23.
//  Copyright © 2019年 Hobi. All rights reserved.
//

import UIKit

/// 构造CAAnimation的闭包，函数式编程，用于保护CAAnimation不被修改，以及可以方便自定义化CAAnimation
typealias LayerAnimationCreatorClosure = () -> CAAnimation

class LayerAnimateActionGroup: NSObject, AnimationConfigProtocol {
    
    var delay: TimeInterval = 0
    
    var isAnimating: Bool = false
    
    var animationStopCallBack: AnimationStopCallBackClosure?
    
    var animationStopCallBackToAnimator: AnimationStopCallBackClosure?
    
    var animateCreatorArray: [LayerAnimationCreatorClosure] = [LayerAnimationCreatorClosure]()

    var repeatCount: Int = 1

    /// 用于后续扩展不同的key
    var animationKey: String = "animationKey"
    
    var animationGroup: CAAnimationGroup?
    
    override init() {
        super.init()
    }
    
    deinit {
        print("release group")
    }
    
}

// MARK: - CAAnimationDelegate
extension LayerAnimateActionGroup: CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        isAnimating = false
        animationStopCallBack?(flag)
        animationStopCallBackToAnimator?(flag)
        animationStopCallBack = nil
        animationStopCallBackToAnimator = nil
        animateCreatorArray.removeAll()
        animationGroup = nil
    }
}


extension LayerAnimateActionGroup {
    
    func addAnimationCreator(_ creator: @escaping LayerAnimationCreatorClosure) {
        animateCreatorArray.append(creator)
    }
    
    func currentAnimationGroup() -> CAAnimationGroup {
        guard let animationGroup = self.animationGroup else {
            let tmpAnimationGroup = CAAnimationGroup.init()
            self.animationGroup = tmpAnimationGroup
            return tmpAnimationGroup
        }
        return animationGroup
    }
    
    func configPrevChainLink(duration: TimeInterval, delay: TimeInterval, repeatCount: Int) {
        // 创建一个group 然后把当前所有的creator创建到group中
        
        // 然后计算延时以及执行时间，添加到自己的animationgroup中
        
        var animationArray = [CAAnimation]()
        for creator in animateCreatorArray {
            let animation = creator()
            animationArray.append(animation)
        }
        
        //  配置TmpGroupAnimation
        let tmpGroupAnimation = CAAnimationGroup.init()
        tmpGroupAnimation.animations = animationArray
        tmpGroupAnimation.fillMode = .forwards
        tmpGroupAnimation.isRemovedOnCompletion = false
        
        let animationGroup = currentAnimationGroup()
        
        if var animations = animationGroup.animations, let lastAnimation = animations.last {
            // 上一个链路存在动画
            tmpGroupAnimation.beginTime = lastAnimation.beginTime + lastAnimation.duration * Double(lastAnimation.repeatCount) + delay
            tmpGroupAnimation.duration = duration
            tmpGroupAnimation.repeatCount = Float(repeatCount)
            animations.append(tmpGroupAnimation)
            animationGroup.animations = animations
        } else {
            tmpGroupAnimation.beginTime = delay
            tmpGroupAnimation.duration = duration
            tmpGroupAnimation.repeatCount = Float(repeatCount)
            animationGroup.animations = [tmpGroupAnimation]
        }

        animateCreatorArray.removeAll()
    }
    
    func excuteAnimationGroup(on view: UIView) {
        
        // 执行animation group
        isAnimating = true
        let animationGroup = currentAnimationGroup()
        
        guard let animations = animationGroup.animations, let lastAnimation = animations.last else {
            return
        }
        
        animationGroup.delegate = self
        animationGroup.beginTime = CACurrentMediaTime() + delay
        animationGroup.repeatCount = Float(repeatCount)
        animationGroup.duration = lastAnimation.beginTime + lastAnimation.duration * Double(lastAnimation.repeatCount)
        
        view.layer.add(animationGroup, forKey: animationKey)
    }
    
}
