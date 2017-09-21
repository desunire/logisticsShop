//
//  KLFilterButton.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/21.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLFilterButton.h"

/** 常量数 */
CGFloat const DCMargin = 5;

/** 导航栏高度 */
CGFloat const DCNaviH = 44;

/** 底部tab高度 */
CGFloat const DCBottomTabH = 49;
/** 顶部Nav高度+指示器 */
CGFloat const DCTopNavH = 64;

@implementation KLFilterButton

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
       // self.backgroundColor = [UIColor cz_randomColor];
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.titleLabel.font = PFR14Font;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
    
    //计算完加一个间距
    self.dc_width += DCMargin;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.dc_x = self.dc_width * 0.4;
    self.imageView.dc_x = CGRectGetMaxX(self.titleLabel.frame) + DCMargin;
    self.imageView.dc_centerY = self.titleLabel.dc_centerY;
}

@end
