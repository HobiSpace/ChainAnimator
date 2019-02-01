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
}

extension ViewAnimator: ChainAnimatorAlphaProtocol {
    func opacity(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.alpha = value
        })
    }
}

extension ViewAnimator: ChainAnimatorBoundsProtocol {
    func size(to value: CGSize) -> Self {
        return customAnimation({
            self.view!.bounds.size = value
        })
    }
    

    func bounds(to value: CGRect) -> Self {
        return customAnimation({
            self.view!.bounds = value
        })
    }

    func width(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.bounds.size.width = value
        })
    }

    func height(to value: CGFloat) -> Self {
        return customAnimation({
            self.view!.bounds.size.height = value
        })
    }
}
