//
//  ViewController.swift
//  ChainAnimator
//
//  Created by Hobi on 2019/1/23.
//  Copyright © 2019年 Hobi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tmpView: UIView!
    var tmpView2: UIView!
    var tmpView3: ShoppingCarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tmpView = UIView.init(frame: CGRect.init(x: 200, y: 200, width: 100, height: 100))
        tmpView.backgroundColor = UIColor.red
        view.addSubview(tmpView)
        
        tmpView2 = UIView.init(frame: CGRect.init(x: 200, y: 400, width: 100, height: 100))
        tmpView2.backgroundColor = UIColor.blue
        view.addSubview(tmpView2)
        
        
//        tmpView3 = ShoppingCarView.init(frame: CGRect.init(x: 200, y: 400, width: 100, height: 100))
//        view.addSubview(tmpView3)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        tmpView.layerAnimator.expandLeft(to: 10).animate(duration: 1).expandRight(to: 200).animate(duration: 1).expandTop(to: 5).animate(duration: 1).expandBottom(to: 300).animate(duration: 1)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.tmpView.layerAnimator.pause()
//        }
//
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//            self.tmpView.layerAnimator.resume()
//        }
        
        tmpView2.layerAnimator.bounds(to: CGRect.init(x: 0, y: 0, width: 110, height: 10)).then(duration: 3).width(to: 100).then(duration: 3).height(to: 200).then(duration: 2).animate()
        
//        let animation = CAAnimationGroup.init()
//
//
//        let alphaAnimation = CAKeyframeAnimation.init(keyPath: "opacity")
//        alphaAnimation.values = [1, 0.3]
//
//        let animationGroup = CAAnimationGroup.init()
//        animationGroup.animations = [alphaAnimation]
//        animationGroup.duration = 1
//        animationGroup.beginTime = 1
//        animationGroup.repeatCount = 1
//        animationGroup.isRemovedOnCompletion = false
//        animationGroup.fillMode = .forwards
//
//        let move = CABasicAnimation.init(keyPath: "bounds.size.width")
//        move.toValue = 10
//        let animationGroup2 = CAAnimationGroup.init()
//        animationGroup2.animations = [move]
//        animationGroup2.duration = 3
//        animationGroup2.beginTime = 2
//        animationGroup2.repeatCount = 1
//        animationGroup2.isRemovedOnCompletion = false
//        animationGroup2.fillMode = .forwards
//
//
//        animation.animations = [animationGroup, animationGroup2]
//        animation.duration = 6
//        animation.beginTime = CACurrentMediaTime()
//
//
//        tmpView2.layer.add(animation, forKey: "123")
        
    }

}

extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print(self.view.layer.opacity)
    }
}

