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
    public func centerX(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.center.x = value
        })
    }
    
    public func centerY(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.center.y = value
        })
    }
    
    public func center(to value: CGPoint) -> Self {
        return customAnimation({
            self.view!.center = value
        })
    }
}

extension ViewAnimator: ChainAnimatorAlphaProtocol {
    public func opacity(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.alpha = value
        })
    }
}

extension ViewAnimator: ChainAnimatorBoundsProtocol {
    public func size(to value: CGSize) -> Self {
        return customAnimation({
            self.view!.bounds.size = value
        })
    }
    

    public func bounds(to value: CGRect) -> Self {
        return customAnimation({
            self.view!.bounds = value
        })
    }

    public func width(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.bounds.size.width = value
        })
    }

    public func height(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.bounds.size.height = value
        })
    }
}

extension ViewAnimator: AnimatorScaleProtocl {
    public func scale(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.transform = CGAffineTransform.identity.scaledBy(x: value, y: value)
        })
    }
    
    public func scaleX(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.transform = CGAffineTransform.identity.scaledBy(x: value, y: 1)
        })
    }
    
    public func scaleY(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.transform = CGAffineTransform.identity.scaledBy(x: 1, y: value)
        })
    }
}
