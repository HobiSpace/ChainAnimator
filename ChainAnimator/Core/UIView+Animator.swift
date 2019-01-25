//
//  UIView+Animator.swift
//  ChainAnimator
//
//  Created by Hobi on 2019/1/23.
//  Copyright © 2019年 Hobi. All rights reserved.
//

import UIKit
import Foundation

var layerAnimatorePropertyKey = "layerAnimatorePropertyKey"

extension UIView {
    var layerAnimator: LayerAnimator {
        get {
            assert(Thread.isMainThread, "Animator 必须在主线程调用")
            
            if let animation = objc_getAssociatedObject(self, &layerAnimatorePropertyKey) as? LayerAnimator {
                return animation
            } else {
                let animation = LayerAnimator()
                animation.view = self
                objc_setAssociatedObject(self, &layerAnimatorePropertyKey, animation, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
                return animation
            }
        }
    }
}
