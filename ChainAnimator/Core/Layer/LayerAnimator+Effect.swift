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
    case scale          = "transform.scale"
    case scaleX         = "transform.scale.x"
    case scaleY         = "transform.scale.y"
    case rotationX      = "transform.rotation.x"
    case rotationY      = "transform.rotation.y"
    case rotationZ      = "transform.rotation.z"
}

// MARK: - Position
extension LayerAnimator: ChainAnimatorPositionProtocol {

    /// 移动中心点X
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func centerX(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.positionX.rawValue)
            animation.values = [self.view!.center.x, value]
            return animation
        })
    }

    /// 移动中心点Y
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func centerY(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.positionY.rawValue)
            animation.values = [self.view!.center.y, value]
            return animation
        })
    }

    /// 移动中心点
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func center(to value: CGPoint) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.position.rawValue)
            animation.values = [self.view!.center, value]
            return animation
        })
    }

    /// 移动原点
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func origin(to value: CGPoint) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.position.rawValue)
            let deltaPoint = CGPoint.init(x: self.view!.center.x - self.view!.frame.minX, y: self.view!.center.y - self.view!.frame.minY)
            animation.values = [self.view!.center, CGPoint.init(x: value.x + deltaPoint.x, y: value.y + deltaPoint.y)]
            return animation
        })
    }

    /// 移动原点X
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func originX(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.positionX.rawValue)
            let deltaX = self.view!.center.x - self.view!.frame.minX
            animation.values = [self.view!.center.x, value + deltaX]
            return animation
        })
    }

    /// 移动原点Y
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func originY(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.positionY.rawValue)
            let deltaY = self.view!.center.y - self.view!.frame.minY
            animation.values = [self.view!.center.y, value + deltaY]
            return animation
        })
    }
}

// MARK: - Alpha
extension LayerAnimator: ChainAnimatorAlphaProtocol {

    /// 改变透明度
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func opacity(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.opacity.rawValue)
            animation.values = [self.view!.alpha, value]
            return animation
        })
    }
}

// MARK: - Bounds
extension LayerAnimator: ChainAnimatorBoundsProtocol {

    /// 修改bounds，中心不变
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func bounds(to value: CGRect) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.bounds.rawValue)
            animation.values = [self.view!.bounds, value]
            return animation
        })
    }

    /// 修改宽度，中心不变，左右拉长
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func width(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.bounds.rawValue)
            var tmpBounds = self.view!.bounds
            tmpBounds = CGRect.init(x: tmpBounds.minX, y: tmpBounds.minY, width: value, height: tmpBounds.height)
            animation.values = [self.view!.bounds, tmpBounds]
            return animation
        })
    }

    /// 修改高度，中心不变，上下拉长
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func height(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.bounds.rawValue)
            var tmpBounds = self.view!.bounds
            tmpBounds = CGRect.init(x: tmpBounds.minX, y: tmpBounds.minY, width: tmpBounds.width, height: value)
            animation.values = [self.view!.bounds, tmpBounds]
            return animation
        })
    }

    /// 修改宽度，向左拉长，右边原点不变
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func expandLeft(to value: CGFloat) -> Self {
        return width(to: value).customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.positionX.rawValue)
            let deltaWidth = value - self.view!.bounds.width
            let deltaX = deltaWidth / 2
            animation.values = [self.view!.center.x, self.view!.center.x - deltaX]
            return animation
        })
    }

    /// 修改宽度，向右拉长，左边原点不变
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func expandRight(to value: CGFloat) -> Self {
        return width(to: value).customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.positionX.rawValue)
            let deltaWidth = value - self.view!.bounds.width
            let deltaX = deltaWidth / 2
            animation.values = [self.view!.center.x, self.view!.center.x + deltaX]
            return animation
        })
    }

    /// 修改高度，向上拉长，底部原点不变
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func expandTop(to value: CGFloat) -> Self {
         return height(to: value).customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.positionY.rawValue)
            let deltaHeight = value - self.view!.bounds.height
            let deltaY = deltaHeight / 2
            animation.values = [self.view!.center.y, self.view!.center.y - deltaY]
            return animation
        })
    }

    /// 修改高度，向下拉长，顶部原点不变
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func expandBottom(to value: CGFloat) -> Self {        
        return height(to: value).customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.positionY.rawValue)
            let deltaHeight = value - self.view!.bounds.height
            let deltaY = deltaHeight / 2
            animation.values = [self.view!.center.y, self.view!.center.y + deltaY]
            return animation
        })
    }
}

extension LayerAnimator: AnimatorScaleProtocl {

    /// 修改整体缩放比例
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func scale(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.scale.rawValue)
            animation.values = [1, value]
            return animation
        })
    }

    /// 修改X缩放比例
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func scaleX(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.scaleX.rawValue)
            animation.values = [1, value]
            return animation
        })
    }

    /// 修改Y缩放比例
    ///
    /// - Parameter value: 目标值
    /// - Returns: LayerAnimator
    func scaleY(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CAKeyframeAnimation.init(keyPath: LayerAnimatorKey.scaleY.rawValue)
            animation.values = [1, value]
            return animation
        })
    }
}

// MARK: - Rotation
extension LayerAnimator: ChainAnimatorRotationProtocol {

    /// 沿X轴旋转
    ///
    /// - Parameter value: 目标值（.PI）
    /// - Returns: LayerAnimator
    func rotationX(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.rotationX.rawValue)
            animation.toValue = value
            return animation
        })
    }

    /// 沿Y轴旋转
    ///
    /// - Parameter value: 目标值（.PI）
    /// - Returns: LayerAnimator
    func rotationY(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.rotationY.rawValue)
            animation.toValue = value
            return animation
        })
    }

    /// 沿Z轴旋转
    ///
    /// - Parameter value: 目标值（.PI）
    /// - Returns: LayerAnimator
    func rotationZ(to value: CGFloat) -> Self {
        return customAnimation({ () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: LayerAnimatorKey.rotationZ.rawValue)
            animation.toValue = value
            return animation
        })
    }
}


