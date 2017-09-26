//
//  KLOrderStateView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLOrderStateView.h"

@implementation KLOrderStateView

-(instancetype)initWithFrame:(CGRect)frame andChooseIndex:(int)index{
    
    if (self = [super initWithFrame:frame]) {
        [self setUIIndex:index];
    }
    return self;
}

-(void)setUIIndex:(int)index{
    
    self.backgroundColor = [UIColor whiteColor];
    NSArray *titles = @[NSLocalizedString(@"allOrder", nil),NSLocalizedString(@"waitSureOrder", nil),NSLocalizedString(@"waitSendOrder", nil)];
    CGFloat btnW = self.dc_width / titles.count;
    CGFloat btnH = self.dc_height;
    CGFloat btnY = 0;
    for (NSInteger i = 0; i < titles.count; i++) {
        KLFilterButton *button = [KLFilterButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [self addSubview:button];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        button.tag = i ;
        CGFloat btnX = i * btnW;
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == index) {
            [button setTitleColor:DefaultBackColor forState:UIControlStateNormal];
        }
    }
    [DCSpeedy dc_setUpAcrossPartingLineWith:self WithColor:[lineColor colorWithAlphaComponent:0.4]];
    
}

-(void)buttonClick:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(changeViewWithTag:)]) {
        [self.delegate changeViewWithTag:sender.tag];
    }
    
}

@end
