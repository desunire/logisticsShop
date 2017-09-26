//
//  UpPicDownTextBtn.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "UpPicDownTextBtn.h"



@implementation UpPicDownTextBtn

-(instancetype)initWithFrame:(CGRect)frame andPicImage:(NSString *)imageName andText:(NSString *)text andTextColor:(UIColor *)textColor andTextFont:(UIFont *)textFont{
    
    
    if (self = [super initWithFrame:frame]) {
        //设置图片和文字
        UIImageView *picImageView = [[UIImageView alloc] init];
        picImageView.image = [UIImage imageNamed:imageName];
        UILabel *title = [[UILabel alloc]init];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = textFont;
        title.text = text;
        title.textColor = textColor;
        //自动布局必备设置
        picImageView.translatesAutoresizingMaskIntoConstraints = false;
        title.translatesAutoresizingMaskIntoConstraints = false;
            //设置布局
            NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:picImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:topMargin];
            
            NSLayoutConstraint *constraintLeft = [NSLayoutConstraint constraintWithItem:picImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:leftMargin];
            
            //计算图片的宽度
            CGFloat width = self.bounds.size.width - leftMargin - rightMargin;
            NSLayoutConstraint *constraintWidth = [NSLayoutConstraint constraintWithItem:picImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
            
            CGFloat height = width;
            NSLayoutConstraint *constraintHeight = [NSLayoutConstraint constraintWithItem:picImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
            
            [self addSubview:picImageView];
            [self addSubview:title];
            
            [self addConstraints:@[constraintTop,constraintLeft,constraintWidth,constraintHeight]];
            
            
            //picImageView.frame = CGRectMake(leftMargin, topMargin , width, height);
            
            //设置标题尺寸位置
            //设置布局
            NSLayoutConstraint *titleConstraintX = [NSLayoutConstraint constraintWithItem:title attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
            
            NSLayoutConstraint *titleConstraintTop = [NSLayoutConstraint constraintWithItem:title attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:picImageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:belowMargin];
            
            //CGFloat width = self.bounds.size.width - leftMargin - rightMargin;
            NSLayoutConstraint *titleConstraintWidth = [NSLayoutConstraint constraintWithItem:title attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.bounds.size.width];
            
            //CGFloat height = width;
            NSLayoutConstraint *titleConstraintHeight = [NSLayoutConstraint constraintWithItem:title attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:titleHeight];
            
        [self addConstraints:@[titleConstraintX,titleConstraintTop,titleConstraintWidth,titleConstraintHeight]];
        
        //添加点击事件
        [self addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        }
    
    return self;
}


-(void)setViewWithPicImage:(NSString *)imageName andText:(NSString *)text andTextColor:(UIColor *)textColor andTextFont:(UIFont *)textFont{
    
    self.picImageView = [[UIImageView alloc] init];
    _picImageView.image = [UIImage imageNamed:imageName];
    self.title = [[UILabel alloc]init];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.font = textFont;
    _title.text = text;
    _title.textColor = textColor;
    //自动布局必备设置
    _picImageView.translatesAutoresizingMaskIntoConstraints = false;
    _title.translatesAutoresizingMaskIntoConstraints = false;
    //设置布局
    NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:_picImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:topMargin];
    
    NSLayoutConstraint *constraintLeft = [NSLayoutConstraint constraintWithItem:_picImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:leftMargin];
    
    //计算图片的宽度
    CGFloat width = self.bounds.size.width - leftMargin - rightMargin;
    NSLayoutConstraint *constraintWidth = [NSLayoutConstraint constraintWithItem:_picImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    
    CGFloat height = width;
    NSLayoutConstraint *constraintHeight = [NSLayoutConstraint constraintWithItem:_picImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    
    [self addSubview:_picImageView];
    [self addSubview:_title];
    
    [self addConstraints:@[constraintTop,constraintLeft,constraintWidth,constraintHeight]];
    
    
    //picImageView.frame = CGRectMake(leftMargin, topMargin , width, height);
    
    //设置标题尺寸位置
    //设置布局
    NSLayoutConstraint *titleConstraintX = [NSLayoutConstraint constraintWithItem:_title attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint *titleConstraintTop = [NSLayoutConstraint constraintWithItem:_title attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_picImageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:belowMargin];
    
    //CGFloat width = self.bounds.size.width - leftMargin - rightMargin;
    NSLayoutConstraint *titleConstraintWidth = [NSLayoutConstraint constraintWithItem:_title attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.bounds.size.width];
    
    //CGFloat height = width;
    NSLayoutConstraint *titleConstraintHeight = [NSLayoutConstraint constraintWithItem:_title attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:titleHeight];
    
    [self addConstraints:@[titleConstraintX,titleConstraintTop,titleConstraintWidth,titleConstraintHeight]];
    
    //添加点击事件
    //[self addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];

}

//-(void)clickItem:(UIButton *)sender{
//    
//
//    
//}

@end
