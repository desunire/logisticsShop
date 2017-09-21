//
//  UIView+CZAddition.h
//
//  Created by 刘凡 on 16/5/11.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CZAddition)

/// 返回视图截图
- (UIImage *)cz_snapshotImage;


@property (nonatomic , assign) CGFloat dc_width;
@property (nonatomic , assign) CGFloat dc_height;
@property (nonatomic , assign) CGSize  dc_size;
@property (nonatomic , assign) CGFloat dc_x;
@property (nonatomic , assign) CGFloat dc_y;
@property (nonatomic , assign) CGPoint dc_origin;
@property (nonatomic , assign) CGFloat dc_centerX;
@property (nonatomic , assign) CGFloat dc_centerY;
@property (nonatomic , assign) CGFloat dc_right;
@property (nonatomic , assign) CGFloat dc_bottom;

- (BOOL)intersectWithView:(UIView *)view;

+ (instancetype)dc_viewFromXib;
- (BOOL)isShowingOnKeyWindow;

@end
