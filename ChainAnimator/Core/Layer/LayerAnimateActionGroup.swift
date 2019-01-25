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
    
    var duration: TimeInterval = 0
    
    var delay: TimeInterval = 0
    
    var isAnimating: Bool = false
    
    var animationStopCallBack: AnimationStopCallBackClosure?
    
    var animationStopCallBackToAnimator: AnimationStopCallBackClosure?
    
    var animateCreatorArray: [LayerAnimationCreatorClosure] = [LayerAnimationCreatorClosure]()

    var repeatCount: Int = 1

    /// 用于后续扩展不同的key
    var animationKey: String = "animationKey"
    
    override init() {
        super.init()
    }
    
    deinit {
        
    }
    
    func addAnimationCreator(_ creator: @escaping LayerAnimationCreatorClosure) {
        animateCreatorArray.append(creator)
    }
    
    func animationGroupStart(on view: UIView) {
        isAnimating = true
        var animationArray = [CAAnimation]()
        for creator in animateCreatorArray {
            let animation = creator()
            animationArray.append(animation)
        }
        let groupAnimation = CAAnimationGroup.init()
        groupAnimation.animations = animationArray
        groupAnimation.delegate = self
        groupAnimation.duration = duration
        groupAnimation.beginTime = CACurrentMediaTime() + delay
        groupAnimation.repeatCount = Float(repeatCount)
        view.layer.add(groupAnimation, forKey: animationKey)
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
    }
}
