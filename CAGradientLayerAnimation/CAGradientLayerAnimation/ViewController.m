//
//  ViewController.m
//  CAGradientLayerAnimation
//
//  Created by jpz on 2019/4/19.
//  Copyright © 2019 jpz. All rights reserved.
//

#import "ViewController.h"
#import "GradualChangeLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GradualChangeLabel * label = [[GradualChangeLabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    [self.view addSubview:label];
    
    label.colors = [@[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor blueColor].CGColor] mutableCopy];
    
    label.text = @"渐变色的动画！！";
    
}


@end
