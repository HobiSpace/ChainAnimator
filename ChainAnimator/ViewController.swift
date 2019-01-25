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
        
//        tmpView2 = UIView.init(frame: CGRect.init(x: 200, y: 400, width: 100, height: 100))
//        tmpView2.backgroundColor = UIColor.blue
//        view.addSubview(tmpView2)
        
        
//        tmpView3 = ShoppingCarView.init(frame: CGRect.init(x: 200, y: 400, width: 100, height: 100))
//        view.addSubview(tmpView3)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tmpView.layerAnimator.expandBottom(to: 200).animate(duration: 10)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tmpView.layerAnimator.pause()
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.tmpView.layerAnimator.resume()
        }
        
    }

}

