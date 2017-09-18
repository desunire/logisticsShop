//
//  KLCategoryItemButton.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/18.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLCategoryObject.h"


@protocol KLCategoryItemButtonDelegate <NSObject>

@optional

-(void)clickBtnWithModel:(KLCategoryObject *)model;


@end

static  CGFloat leftMargin= 20;

static  CGFloat topMargin= 15;

static  CGFloat ItemMargin= 40;//2个button之间的间隔

static  CGFloat rightMargin= 20;

static  CGFloat belowMargin = 10;

static  CGFloat titleHeight = 20;

@interface KLCategoryItemButton : UIButton

@property(strong,nonatomic)KLCategoryObject *model;

@property(weak,nonatomic)id<KLCategoryItemButtonDelegate>delegate;

-(instancetype)initWithFrame:(CGRect)frame WithModel:(KLCategoryObject *)model;

@end
