//
//  KLEmptyView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/10/9.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol KLEmptyViewDelegate <NSObject>

@optional

/**
 点击当前视图后的操作，由具体的控制器实现
 */
-(void)clickView;


@end

@interface KLEmptyView : UIView


@property(weak,nonatomic)id<KLEmptyViewDelegate>delegate;

-(instancetype)initWithFrame:(CGRect)frame andBackImage:(NSString *)imageName andMessage:(NSString *)message;

@end
