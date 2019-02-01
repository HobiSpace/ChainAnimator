//
//  LayerAnimator+Effect.swift
//  ChainAnimator
//
//  Created by Hobi on 2019/1/24.
//  Copyright © 2019年 Hobi. All rights reserved.
//

import Foundation
import UIKit

// KVC 修改view layer的值

enum LayerAnimatorKey: String {
    case position       = "position"
    case positionX      = "position.x"
    case positionY      = "position.y"
    case opacity        = "opacity"
    case bounds         = "bounds"
    case size           = "bounds.size"
    case width          = "bounds.size.width"
    case height         = "bounds.size.height"
    case scale          = "transform.scale"
    case scaleX         = "transform.scale.x"
    case scaleY         = "transform.scale.y"
    case rotationX      = "transform.rotation.x"
    case rotationY      = "transform.rotation.y"
    case rotationZ      = "transform.rotation.z"
    case anchorPoint    = "anchorPoint"
}

// MARK: - Position
extension LayerAnimator: ChainAnimatorPositionProtocol {

    func centerX(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.positionX.rawValue)
            animation.toValue = value
            return animation
        })
    }

    func centerY(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.positionY.rawValue)
            animation.toValue = value
            return animation
        })
    }

    func center(to value: CGPoint) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.position.rawValue)
            animation.toValue = value
            return animation
        })
    }
}

// MARK: - Alpha
extension LayerAnimator: ChainAnimatorAlphaProtocol {

    func opacity(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.opacity.rawValue)
            animation.toValue = value
            return animation
        })
    }
}

// MARK: - Bounds
extension LayerAnimator: ChainAnimatorBoundsProtocol {

    func bounds(to value: CGRect) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.bounds.rawValue)
            animation.toValue = value
            return animation
        })
    }
    
    func size(to value: CGSize) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.size.rawValue)
            animation.toValue = value
            return animation
        })
    }

    func width(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.width.rawValue)
            animation.toValue = value
            return animation
        })
    }

    func height(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.height.rawValue)
            animation.toValue = value
            return animation
        })
    }

}

extension LayerAnimator: AnimatorScaleProtocl {

    func scale(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.scale.rawValue)
            animation.toValue = value
            return animation
        })
    }

    func scaleX(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.scaleX.rawValue)
            animation.toValue = value
            return animation
        })
    }

    func scaleY(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.scaleY.rawValue)
            animation.toValue = value
            return animation
        })
    }
}

// MARK: - Rotation
extension LayerAnimator: ChainAnimatorRotationProtocol {

    func rotationX(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.rotationX.rawValue)
            animation.toValue = value
            return animation
        })
    }
 
    func rotationY(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.rotationY.rawValue)
            animation.toValue = value
            return animation
        })
    }

    func rotationZ(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.rotationZ.rawValue)
            animation.toValue = value
            return animation
        })
    }
    
}

extension LayerAnimator: ChainAnimatorAnchorPointProtocol {
    func anchorPoint(to value: CGPoint) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.anchorPoint.rawValue)
            animation.toValue = value
            return animation
        })
    }
}


