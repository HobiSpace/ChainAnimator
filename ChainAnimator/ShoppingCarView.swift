//
//  ShoppingCarView.swift
//  ChainAnimator
//
//  Created by Hobi on 2019/1/24.
//  Copyright © 2019年 Hobi. All rights reserved.
//

import UIKit

class ShoppingCarView: UIView {
    
    var foldView: ShoppingCarFoldView!
    var expandView: ShoppingCarExpandView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animation() {

    }

}
