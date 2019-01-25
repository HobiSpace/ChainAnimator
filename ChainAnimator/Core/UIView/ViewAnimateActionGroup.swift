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
    
    var duration: TimeInterval = 0
    
    var delay: TimeInterval = 0
    
    var isAnimating: Bool = false
    
    var repeatCount: Int = 1
    
    var animationStopCallBack: AnimationStopCallBackClosure?
    
    var animationStopCallBackToAnimator: AnimationStopCallBackClosure?
    
    var animateCreatorArray: [ViewAnimationCreatorClosure] = [ViewAnimationCreatorClosure]()
    
    override init() {
        super.init()
    }
    
    func addAnimationCreator(_ creator: @escaping ViewAnimationCreatorClosure) {
        animateCreatorArray.append(creator)
    }
    
    func animationGroupStart(on view: UIView) {
        
        
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.allowUserInteraction, animations: {
            for creator in self.animateCreatorArray {
                creator()
            }
        }) { (flag) in
            self.isAnimating = false
            self.animationStopCallBack?(flag)
            self.animationStopCallBackToAnimator?(flag)
            self.animationStopCallBack = nil
            self.animationStopCallBackToAnimator = nil
            self.animateCreatorArray.removeAll()
        }
    }
}
