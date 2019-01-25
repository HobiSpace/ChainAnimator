//
//  ShoppingCarFoldView.swift
//  ChainAnimator
//
//  Created by Hobi on 2019/1/25.
//  Copyright © 2019年 Hobi. All rights reserved.
//

import UIKit

class ShoppingCarFoldView: UIView {
    
    var iconContentView: UIView!
    var iconAnimationView: UIView!
    var infoContentView: UIView!
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        iconContentView = {
            let view = UIView.init(frame: self.bounds)
            view.backgroundColor = UIColor.red
            return view
        }()
        
        iconAnimationView = {
            let view = UIView.init(frame: self.bounds)
            view.backgroundColor = UIColor.blue
            return view
        }()
        
        infoContentView = {
            let view = UIView.init(frame: self.bounds)
            view.backgroundColor = UIColor.clear
            return view
        }()
        
        titleLabel = {
            let label = UILabel.init(frame: self.bounds)
            label.text = "123"
            return label
        }()
        
        addSubview(infoContentView)
        infoContentView.addSubview(iconAnimationView)
        infoContentView.addSubview(iconContentView)
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func expand() {
//        infoContentView.animator.centerY(to: 0).animate(duration: 1)
//        titleLabel.animator.centerY(to: self.bounds.maxY).animate(duration: 1)
    }
    
    func fold() {
        
    }
    
    func playInfo() {
        
    }
}

