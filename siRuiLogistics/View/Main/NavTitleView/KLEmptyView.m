//
//  KLEmptyView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/10/9.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLEmptyView.h"

@interface KLEmptyView()


/**
 背景图
 */
@property(strong,nonatomic)UIImageView *backImageView;





@end

@implementation KLEmptyView

-(instancetype)initWithFrame:(CGRect)frame andBackImage:(NSString *)imageName andMessage:(NSString *)message{
    
    if (self = [super initWithFrame:frame]) {
        
        //设置界面的点击事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickViewTap:)];
        [self addGestureRecognizer:tap];
        
        //绘制界面
        if (imageName) {
            self.backImageView = [[UIImageView alloc] initWithFrame:self.frame];
            self.backImageView.image = [UIImage imageNamed:imageName];
            self.backImageView.contentMode = UIViewContentModeCenter;
            [self addSubview:self.backImageView];
        }
        //TODO:界面显示文字 根据message文字分组显示
        
        
    }
    return self;
}


/**
点击事件
 @param sender <#sender description#>
 */
-(void)clickViewTap:(UITapGestureRecognizer *)sender{
    
    if ([self.delegate respondsToSelector:@selector(clickView)]) {
        [self.delegate clickView];
    }
}

@end
