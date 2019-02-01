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
        view.addSubview(tmpView)
        
        tmpView2 = UIView.init(frame: CGRect.init(x: 200, y: 400, width: 100, height: 100))
        tmpView2.backgroundColor = UIColor.blue
        view.addSubview(tmpView2)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        tmpView.viewAnimator.center(to: CGPoint.init(x: 20, y: 20)).width(to: 20).then(duration: 1, repeatCount: 3, delay: 0).expandBottom(to: 300).then(duration: 2).animate(delay: 3, finishCallBack: nil)
        
        tmpView.layerAnimator.anchorPoint(to: CGPoint.init(x: 0, y: 0)).width(to: 50).then(duration: 2).rotationZ(to: .pi).then(duration: 10).animate()
        
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
        
        
        
//        UIView.animate(withDuration: 2, delay: 0, options: .curveLinear, animations: {
//            UIView.setAnimationRepeatCount(3)
//            self.tmpView.frame = CGRect.init(x: 0, y: 0, width: 20, height: 20)
//        }) { (flag) in
//            print("123")
//        }
    }

}

extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print(self.view.layer.opacity)
    }
}

