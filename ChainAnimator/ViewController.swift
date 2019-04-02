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
    override func viewDidLoad() {
        super.viewDidLoad()
        tmpView = UIView.init(frame: CGRect.init(x: 10, y: 200, width: 30, height: 30))
        tmpView.backgroundColor = UIColor.red
        let tmpView3 = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 15, height: 15))
        tmpView3.backgroundColor = UIColor.green
        tmpView.addSubview(tmpView3)
        
        view.addSubview(tmpView)
        
        tmpView2 = UIView.init(frame: CGRect.init(x: 100, y: 200, width: 30, height: 30))
        tmpView2.backgroundColor = UIColor.blue
        view.addSubview(tmpView2)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        tmpView.viewAnimator.center(to: CGPoint.init(x: 20, y: 20)).width(to: 20).then(duration: 10, repeatCount: 1, delay: 0, option: UIView.AnimationOptions.curveEaseIn).animate()
//        tmpView2.viewAnimator.center(to: CGPoint.init(x: 110, y: 20)).width(to: 20).then(duration: 10, repeatCount: 1, delay: 0, option: UIView.AnimationOptions.curveLinear).animate()
//        tmpView.layerAnimator.anchorPoint(to: CGPoint.init(x: 0, y: 0)).width(to: 50).then(duration: 2).rotationZ(to: .pi).then(duration: 10).animate()
//        tmpView.layerAnimator.width(to: 50).then(duration: 2).animate(delay: 0) { (_) in
//            print("123")
//        }
//        tmpView.viewAnimator.centerX(to: 300).width(to: 100).then(duration: 2).opacity(to: 0.3).height(to: 300).then(duration: 2, repeatCount: 3, delay: 0).animate(delay: 2) { (flag) in
//            print(self.tmpView.frame)
//        }
//
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
        
        
//
//        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
//            self.tmpView.frame = CGRect.init(x: 0, y: 0, width: 20, height: 20)
//        }) { (flag) in
//            print("123")
//        }
//
//        UIView.animate(withDuration: 2, delay: 0, options: .curveLinear, animations: {
//            self.tmpView2.frame = CGRect.init(x: 100, y: 0, width: 20, height: 20)
//        }) { (flag) in
//            print("123")
//        }
        
//        tmpView.layerAnimator.center(from: CGPoint.init(x: 100, y: 9), to: CGPoint.init(x: 400, y: 300)).then(duration: 3).animate()
        
//        var array = [1, 2]
//        
//        UIView.animate(withDuration: 3, animations: {
//            self.tmpView.frame = CGRect.init(x: 300, y: 300, width: 200, height: 200)
//        }) { (finish) in
//            array.removeFirst()
//        }
//        
//        tmpView.layer.removeAllAnimations()
//        array.removeAll()
    }

}


