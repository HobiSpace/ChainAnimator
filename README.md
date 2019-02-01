# ChainAnimator

## 简介
swift 开发的链式动画库，支持Core Animation和UIView Animation两种动画方式

```swift
// LayerAnimator - Core Animation
tmpView.layerAnimator.rotationZ(to: .pi).centerX(to: 100).then(duration: 3).width(to: 100).centerX(to: 135).then(duration: 2).animate()

// ViewAnimator - View Animation
tmpView.viewAnimator.centerX(to: 300).width(to: 100).then(duration: 2).opacity(to: 0.3).height(to: 300).then(duration: 2, repeatCount: 3, delay: 0).animate(delay: 2) { (flag) in
print(self.tmpView.frame)
}
```

LayerAnimator 不会去改变view的任何属性，在动画结束后会移除动画Layer

ViewAnimator 会直接改变View的属性，动画结束后不会复原，且支持点击
