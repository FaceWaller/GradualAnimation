//
//  GradualChangeLabel.m
//  CAGradientLayerAnimation
//
//  Created by jpz on 2019/4/19.
//  Copyright © 2019 jpz. All rights reserved.
//

#import "GradualChangeLabel.h"

static CGFloat timeIntervalI= 2.f;

@interface GradualChangeLabel()
@property(nonatomic,strong) UILabel * textLabel;
@property(nonatomic, strong) CAGradientLayer *gradientLayer;
@property(nonatomic, strong) NSMutableArray *fromValue;
@property(nonatomic, strong) NSMutableArray *toValue;
@end

@implementation GradualChangeLabel

- (NSMutableArray *)fromValue{
    if (!_fromValue) {
        _fromValue = [NSMutableArray array];
    }
    return _fromValue;
}

- (NSMutableArray *)toValue{
    if (!_toValue) {
        _toValue = [NSMutableArray array];
    }
    return _toValue;
}

- (CAGradientLayer *)gradientLayer{
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        [self.layer addSublayer:_gradientLayer];
    }
    return _gradientLayer;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}

- (instancetype)init{
    return [self initWithFrame:CGRectZero];
}

- (void)setupSubViews{
    self.textLabel = [[UILabel alloc]initWithFrame:self.bounds];
    
}

- (void)setFont:(UIFont *)font{
    _font = font;
    self.textLabel.font = font;
}

- (void)setColors:(NSMutableArray *)colors{
    // 处理颜色
    NSMutableArray * resArr = [colors mutableCopy];
    if (colors.count >=2) {
        [resArr addObject:colors[0]];
        [resArr addObject:colors[1]];
    }
    _colors = resArr;
    for (int i = (int)self.colors.count; i > 0; i--) {
        [self.fromValue addObject: @(2-i)];
        [self.toValue addObject:@(self.colors.count - i)];
    }

    if (self.text) {
        [self updateGradientLayer];
    }
}

- (void)setText:(NSString *)text{
    _text = text;
    self.textLabel.text = text;
    if (self.colors) {
        [self updateGradientLayer];
    }
}

- (void)updateGradientLayer{
    self.gradientLayer.frame = self.textLabel.frame;
    self.gradientLayer.position = self.textLabel.center;
    self.gradientLayer.colors = self.colors;
    self.gradientLayer.locations = self.fromValue;
    self.gradientLayer.startPoint = CGPointMake(0, 0.5);
    self.gradientLayer.endPoint = CGPointMake(1, 0.5);
    self.gradientLayer.mask = self.textLabel.layer;
    self.textLabel.frame = self.gradientLayer.bounds;
    [self doAnimation];
}

- (void)doAnimation {
    [self.gradientLayer removeAnimationForKey:@"slide"];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    animation.fromValue = self.fromValue;
    animation.toValue = self.toValue;
    animation.duration = timeIntervalI;
    animation.removedOnCompletion = YES;
    animation.repeatCount = HUGE_VALF;
    [self.gradientLayer addAnimation:animation forKey:@"slide"];
}

@end
