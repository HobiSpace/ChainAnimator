//
//  LayerAnimateActionGroup.swift
//  ChainAnimator
//
//  Created by Hobi on 2019/1/23.
//  Copyright © 2019年 Hobi. All rights reserved.
//

import UIKit

typealias LayerAnimationGroupFinishCallBackClosure = (CAAnimation, Bool) -> Void
typealias LayerAnimationCreatorClosure = () -> CAAnimation

class LayerAnimateActionGroup: NSObject {
    
    /// 该group下需要执行的动画Action
    var animateCreatorArray: [LayerAnimationCreatorClosure] = [LayerAnimationCreatorClosure]()
    
    /// 该group的执行时长
    var duration: TimeInterval = 0
    
    /// 动画重复次数
    var repeatCount: Int = 1
    
    /// 延迟执行时间
    var delay: TimeInterval = 0
    
    /// 用于后续扩展不同的key
    var animationKey: String = "animationKey"
    
    /// group所有动画完成回调给业务
    var groupAnimationFinishCallBack: LayerAnimationGroupFinishCallBackClosure?
    
    /// group所有动画完成回调给Animator
    var groupAnimationFinishCallBackToAnimator: LayerAnimationGroupFinishCallBackClosure?
    
    
    /// 该动画组是否正在执行
    var isGroupAnimating: Bool = false
    
    override init() {
        super.init()
    }
    
    deinit {
        
    }
    
    func addAnimationCreator(_ creator: @escaping LayerAnimationCreatorClosure) {
        animateCreatorArray.append(creator)
    }
    
    func animationGroupStart(on view: UIView) {
        isGroupAnimating = true
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

extension LayerAnimateActionGroup: CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        isGroupAnimating = false
        groupAnimationFinishCallBack?(anim, flag)
        groupAnimationFinishCallBackToAnimator?(anim, flag)
        groupAnimationFinishCallBack = nil
        groupAnimationFinishCallBackToAnimator = nil
        animateCreatorArray.removeAll()
    }
}
