\# GradualAnimation



一个可以进行渐变色动画的Label。



![image](https://github.com/FaceWaller/blogImages/blob/master/%E5%8A%A8%E7%94%BB/gradientAnimation.gif?raw=true)



动画原理

使用CAGradientLayer进行渐变颜色的渲染，有四个需要设置的属性。

colors： 需要渐变的颜色

locations: colors中颜色位置，默认为均分颜色。 设置的时候保持和colors数组数量保持一致。 上面的动画主要就是对他和colors做手脚

startPoint: 渐变起点  endPoint: 渐变终点   这俩值主要控制渐变方向

再使用textLabel的layer设置为CAGradientLayer的mask，则只有文字显示了出来

>​    self.gradientLayer.mask = self.textLabel.layer;



假设我们要做的渐变色动画是  红 橙 黄 绿 ，在设置colors的时候做将colors设置为@[红 橙 黄 绿  红 橙];  设置locations的值为@[-4,-3-2,-1,0,1];其中 0 1 两个值标记的颜色为在layer上显示的颜色。

对locations属性做动画，fromValues =  @[-4,-3-2,-1,0,1]；  toValues = @[0,1,2,3,4,5]; 一次动画就是一个完整的从红色渐变到红色的过程，将动画设置为一直重复，则动画联动了起来。



对于colors更多的情况也是一样的道理

> NSMutableArray * resArr = [colors mutableCopy];
>
>​    if (colors.count >=2) {
>
>​        [resArr addObject:colors[0]];
>
>​        [resArr addObject:colors[1]];
>
>​    }
>
>for (int i = 0; i < count; i++) {
>
>​        [self.fromValue addObject:@(i + 2 - count)];
>
>​        [self.toValue addObject:@(i)];
>
>​    }

设置layer

>
>
>   self.gradientLayer.frame = self.textLabel.frame;
>
>​    self.gradientLayer.position = self.textLabel.center;
>
>​    self.gradientLayer.colors = self.colors;
>
>​    self.gradientLayer.locations = self.fromValue;
>
>​    self.gradientLayer.startPoint = CGPointMake(0, 0.5);
>
>​    self.gradientLayer.endPoint = CGPointMake(1, 0.5);
>
>​    self.gradientLayer.mask = self.textLabel.layer;
>
>​    self.textLabel.frame = self.gradientLayer.bounds;
>
>​    [self doAnimation];

设置动画

>[self.gradientLayer removeAnimationForKey:@"slide"];
>
>​    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
>
>​    animation.fromValue = self.fromValue;
>
>​    animation.toValue = self.toValue;
>
>​    animation.duration = timeIntervalI;
>
>​    animation.removedOnCompletion = YES;
>
>​    animation.repeatCount = HUGE_VALF;
>
>​    [self.gradientLayer addAnimation:animation forKey:@"slide"];





