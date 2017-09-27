//
//  KLCategoryItemButton.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/18.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLCategoryItemButton.h"
#import "UIImageView+WebCache.h"



@implementation KLCategoryItemButton

-(instancetype)initWithFrame:(CGRect)frame WithModel:(KLCategoryObject *)model{
    
    if (self = [super initWithFrame:frame]) {
        //self.backgroundColor = [UIColor cz_randomColor];
        //设置图片和文字
        UIImageView *picImageView = [[UIImageView alloc] init];
        NSURL *picUrl = [NSURL URLWithString:model.urlPic];
        
//        [picImageView sd_setImageWithURL:picUrl placeholderImage:[UIImage imageNamed:@"clutch"] options:SDWebImageRetryFailed progress:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        }];
        UILabel *title = [[UILabel alloc]init];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = [UIFont systemFontOfSize:15.0];
        title.text = model.picDesc;
        //自动布局必备设置
        picImageView.translatesAutoresizingMaskIntoConstraints = false;
        title.translatesAutoresizingMaskIntoConstraints = false;
        //添加图文,使用自动布局方式
        if (model.picDesc) {
            [picImageView sd_setImageWithURL:picUrl placeholderImage:[UIImage imageNamed:@"clutch"] options:SDWebImageRetryFailed progress:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            }];
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
            
            
            [self addConstraint:titleConstraintX];
            [self addConstraint:titleConstraintTop];
            [self addConstraint:titleConstraintWidth];
            [self addConstraint:titleConstraintHeight];
        }else{
            [picImageView sd_setImageWithURL:picUrl placeholderImage:[UIImage imageNamed:@"more_index"] options:SDWebImageRetryFailed progress:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            }];
            
            picImageView.contentMode = UIViewContentModeScaleAspectFit;
            //纯图片展示
            if (model.urlPic) {
                [self addSubview:picImageView];
                //设置布局
                NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:picImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
                
                NSLayoutConstraint *constraintY = [NSLayoutConstraint constraintWithItem:picImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
                
                //计算图片的宽度
                NSLayoutConstraint *constraintWidth = [NSLayoutConstraint constraintWithItem:picImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.bounds.size.width];
                
                NSLayoutConstraint *constraintHeight = [NSLayoutConstraint constraintWithItem:picImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.bounds.size.height];
                [self addConstraint:constraintX];
                [self addConstraint:constraintY];
                [self addConstraint:constraintWidth];
                [self addConstraint:constraintHeight];
            }
        }
        //设置当前视图模型
        self.model = model;
       //添加点击事件
       [self addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}


-(void)clickItem:(id)sender{
    
    if ([self.delegate respondsToSelector:@selector(clickBtnWithModel:)]) {
        
        [self.delegate clickBtnWithModel:self.model];
    }
}

@end
