# ChainAnimator

## 简介
swift 开发的链式动画库，支持Core Animation和UIView Animation两种动画方式

LayerAnimator 不会去改变view的任何属性，在动画结束后会移除动画Layer

ViewAnimator 会直接改变View的属性，动画结束后不会复原，且支持点击

## 安装

```
 pod 'ChainAnimator', :git => 'git@github.com:HobiSpace/ChainAnimator.git', :branch => 'master'
```

## 使用

```swift
// LayerAnimator - Core Animation
tmpView.layerAnimator.rotationZ(to: .pi).centerX(to: 100).then(duration: 3).width(to: 100).centerX(to: 135).then(duration: 2).animate()

// ViewAnimator - View Animation
tmpView.viewAnimator.centerX(to: 300).width(to: 100).then(duration: 2).opacity(to: 0.3).height(to: 300).then(duration: 2, repeatCount: 3, delay: 0).animate(delay: 2) { (flag) in
print(self.tmpView.frame)
}
```

| 基础方法 | 作用 | 备注 |
| ------ | ------ | ------ |
| animate | 执行两个then之间的动画 | animate前必须有then |
| then | 配置从当前then到上一个then的链路动画配置 | 每一个then是一个组合并行动画，then之后的是顺序动画 |
| resume | 继续动画 |  |
| pause | 暂停动画 |  |
| stop | 移除动画 |  |


| 效果 | 作用 | 支持Animator |
| ------ | ------ | ------ |
| scale | | Layer |
| scaleX | | Layer |
| scaleY | | Layer |
| anchorPoint |  | Layer |
| rotationX | | Layer |
| rotationY | | Layer |
| rotationZ | | Layer |
| centerX | | Layer/View |
| centerY | | Layer/View |
| center | | Layer/View |
| opacity | | Layer/View |
| bounds | | Layer/View |
| width | | Layer/View |
| height | | Layer/View |
| size | | Layer/View |

