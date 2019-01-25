//
//  ViewAnimator+Effect.swift
//  ChainAnimator
//
//  Created by Hobi on 2019/1/25.
//  Copyright © 2019年 Hobi. All rights reserved.
//

import Foundation
import UIKit

extension ViewAnimator: ChainAnimatorPositionProtocol {
    func centerX(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.center.x = value
        })
    }
    
    func centerY(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.center.y = value
        })
    }
    
    func center(to value: CGPoint) -> Self {
        return customAnimation({
            self.view!.center = value
        })
    }
    
    func origin(to value: CGPoint) -> Self {
        return customAnimation({
            self.view!.frame = CGRect.init(origin: value, size: self.view!.bounds.size)
        })
    }
    
    func originX(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.frame.origin.x = value
        })
    }
    
    func originY(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.frame.origin.y = value
        })
    }
}

extension ViewAnimator: ChainAnimatorAlphaProtocol {
    func opacity(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.alpha = value
        })
    }
    
}

//extension ViewAnimator: ChainAnimatorBoundsProtocol {
//    
//    func bounds(to value: CGRect) -> Self {
//        return customAnimation({
//            self.view!.bounds = value
//        })
//    }
//    
//    func width(to value: CGFloat) -> Self {
//        var tmpBounds = view!.bounds
//        tmpBounds = CGRect.init(x: tmpBounds.minX, y: tmpBounds.minY, width: value, height: tmpBounds.height)
//        return bounds(to: tmpBounds)
//    }
//
//    func height(to value: CGFloat) -> Self {
//        var tmpBounds = view!.bounds
//        tmpBounds = CGRect.init(x: tmpBounds.minX, y: tmpBounds.minY, width: tmpBounds.width, height: value)
//        return bounds(to: tmpBounds)
//    }
//
//    func expandLeft(to value: CGFloat) -> Self {
//        let deltaWidth = value - view!.bounds.width
//        let deltaX = deltaWidth / 2
//        return width(to: value).centerX(to: view!.center.x - deltaX)
//    }
//
//    func expandRight(to value: CGFloat) -> Self {
//        let deltaWidth = value - view!.bounds.width
//        let deltaX = deltaWidth / 2
//        return width(to: value).centerX(to: view!.center.x + deltaX)
//    }
//
//    func expandTop(to value: CGFloat) -> Self {
//        let deltaHeight = value - view!.bounds.height
//        let deltaY = deltaHeight / 2
//        return height(to: value).centerY(to: view!.center.y - deltaY)
//    }
//
//    func expandBottom(to value: CGFloat) -> Self {
//        let deltaHeight = value - view!.bounds.height
//        let deltaY = deltaHeight / 2
//        return height(to: value).centerY(to: view!.center.y + deltaY)
//    }
//
//}
