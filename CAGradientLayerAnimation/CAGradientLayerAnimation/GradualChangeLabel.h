//
//  GradualChangeLabel.h
//  CAGradientLayerAnimation
//
//  Created by jpz on 2019/4/19.
//  Copyright © 2019 jpz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GradualChangeLabel : UIView
@property(nonatomic,copy)NSString *text;
// 数组内存放CGColor
@property(nonatomic,strong)NSMutableArray *colors;
@property(nonatomic,strong)UIFont *font;
@end

NS_ASSUME_NONNULL_END
