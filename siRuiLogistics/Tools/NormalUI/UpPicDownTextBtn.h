//
//  UpPicDownTextBtn.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

static  CGFloat leftMargin= 20;

static  CGFloat topMargin= 15;

static  CGFloat rightMargin= 20;

static  CGFloat belowMargin = 10;

static  CGFloat titleHeight = 20;

@interface UpPicDownTextBtn : UIButton

@property(strong,nonatomic) UIImageView *picImageView;

@property(strong,nonatomic) UILabel *title;


-(instancetype)initWithFrame:(CGRect)frame andPicImage:(NSString *)imageName andText:(NSString *)text andTextColor:(UIColor *)textColor andTextFont:(UIFont *)textFont;


-(void)setViewWithPicImage:(NSString *)imageName andText:(NSString *)text andTextColor:(UIColor *)textColor andTextFont:(UIFont *)textFont;


@end
