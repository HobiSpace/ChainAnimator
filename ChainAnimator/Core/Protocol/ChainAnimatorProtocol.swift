//
//  ChainAnimatorProtocol.swift
//  ChainAnimator
//
//  Created by Hobi on 2019/1/25.
//  Copyright © 2019年 Hobi. All rights reserved.
//

import Foundation
import UIKit

typealias AnimationStopCallBackClosure = (Bool) -> Void

protocol AnimationConfigProtocol {
    
    /// 动画执行延时
    var delay: TimeInterval {get set}
    
    /// 是否正在执行动画
    var isAnimating: Bool {get set}
    
//    /// 动画重复次数
//    var repeatCount: Int {get set}
    
    /// 动画结束回调
    var animationStopCallBack: AnimationStopCallBackClosure? {get set}
    
    /// 动画结束回调到Animatro
    var animationStopCallBackToAnimator: AnimationStopCallBackClosure? {get set}
    
    /// 配置then
    ///
    /// - Parameters:
    ///   - duration: then完成的时间
    ///   - delay: then执行的演示
    ///   - repeatCount: then重复执行次数
    func configPrevChainLink(duration: TimeInterval, delay: TimeInterval, repeatCount: Int)
    
    /// 执行所有动画命令
    ///
    /// - Parameter view: view
    func excuteAnimationGroup(on view: UIView)
    
}

protocol ChainAnimatorProtocol {
    associatedtype AnimationItem: AnimationConfigProtocol
    /// 当前在等待需要执行的动画数组
    var animationWaitChain: [AnimationItem] {get set}
    
    /// 正在执行的动画数组
    var animationExcutingChain: [AnimationItem] {get set}
    
    /// 执行animate之前的所有动画命令
    ///
    /// - Parameters:
    ///   - repeatCount: 整个链路动画重复次数
    ///   - delay: 整个链路动画开始延时
    ///   - finishCallBack: 完成回调
    /// - Returns: Self
    func animate(delay: TimeInterval, finishCallBack: AnimationStopCallBackClosure?) -> Self
    
    /// 配置从当前then到上一个then的链路动画配置
    ///
    /// - Parameters:
    ///   - duration: 两个then之间动画执行时长
    ///   - repeatCount: 两个then之间的链路动画执行次数
    ///   - delay: 该then到上一个then执行的动画延时
    /// - Returns: Self
    func then(duration: TimeInterval, repeatCount: Int, delay: TimeInterval) -> Self
    
    func resume() -> Self
    
    func pause() -> Self
    
    func stop() -> Self
    
   
}

protocol AnimatorScaleProtocl: ChainAnimatorProtocol {
    
    /// 修改整体缩放比例
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func scale(to value: CGFloat) -> Self
    
    /// 修改X缩放比例
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func scaleX(to value: CGFloat) -> Self
    
    /// 修改Y缩放比例
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func scaleY(to value: CGFloat) -> Self

}

protocol ChainAnimatorAnchorPointProtocol: ChainAnimatorProtocol {
    
    /// 改变锚点
    ///
    /// - Parameter value: 锚点值
    /// - Returns: Self
    func anchorPoint(to value: CGPoint) -> Self
}

protocol ChainAnimatorRotationProtocol: ChainAnimatorProtocol {
    /// 沿X轴旋转
    ///
    /// - Parameter value: 目标值（.PI）
    /// - Returns: Self
    func rotationX(to value: CGFloat) -> Self
    
    /// 沿Y轴旋转
    ///
    /// - Parameter value: 目标值（.PI）
    /// - Returns: Self
    func rotationY(to value: CGFloat) -> Self
    
    /// 沿Z轴旋转
    ///
    /// - Parameter value: 目标值（.PI）
    /// - Returns: Self
    func rotationZ(to value: CGFloat) -> Self
}

protocol ChainAnimatorPositionProtocol: ChainAnimatorProtocol {
    /// 移动中心点X
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func centerX(to value: CGFloat) -> Self
    
    /// 移动中心点Y
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func centerY(to value: CGFloat) -> Self
    
    /// 移动中心点
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func center(to value: CGPoint) -> Self
}

protocol ChainAnimatorOriginalProtocol: ChainAnimatorProtocol {
    /// 移动原点
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func origin(to value: CGPoint) -> Self
    
    /// 移动原点X
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func originX(to value: CGFloat) -> Self
    
    /// 移动原点Y
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func originY(to value: CGFloat) -> Self
}

protocol ChainAnimatorAlphaProtocol: ChainAnimatorProtocol {
    /// 改变透明度
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func opacity(to value: CGFloat) -> Self
}

protocol ChainAnimatorBoundsProtocol: ChainAnimatorProtocol {
    /// 修改bounds，中心不变
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func bounds(to value: CGRect) -> Self
    
    /// 修改宽度，中心不变，左右拉长
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func width(to value: CGFloat) -> Self
    
    /// 修改高度，中心不变，上下拉长
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func height(to value: CGFloat) -> Self
    
    /// 修改大小
    ///
    /// - Parameter value: 目标值
    /// - Returns: Self
    func size(to value: CGSize) -> Self
    
//    /// 修改宽度，向左拉长，右边原点不变
//    ///
//    /// - Parameter value: 目标值
//    /// - Returns: Self
//    func expandLeft(to value: CGFloat) -> Self
//
//    /// 修改宽度，向右拉长，左边原点不变
//    ///
//    /// - Parameter value: 目标值
//    /// - Returns: Self
//    func expandRight(to value: CGFloat) -> Self
//
//    /// 修改高度，向上拉长，底部原点不变
//    ///
//    /// - Parameter value: 目标值
//    /// - Returns: Self
//    func expandTop(to value: CGFloat) -> Self
//
//    /// 修改高度，向下拉长，顶部原点不变
//    ///
//    /// - Parameter value: 目标值
//    /// - Returns: Self
//    func expandBottom(to value: CGFloat) -> Self
}
