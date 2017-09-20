//
//  UILabel+CZAddition.h
//
//  Created by 刘凡 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CZAddition)

/// 创建文本标签
///
/// @param text     文本
/// @param fontSize 字体大小
/// @param color    颜色
///
/// @return UILabel
+ (instancetype)cz_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color;




//设置字体大小,颜色,位置
+(UILabel *)setMyLabel:(UIFont *)font andColor:(UIColor *)color andTextAlignment:(NSTextAlignment )textAlignment;


//单行获取label的frame
-(CGSize)getSize:(CGSize)size andFont:(UIFont *)font andText:(NSString *)str;

//多行行获取label的frame
-(CGSize)getmultSize:(CGSize)size andFont:(UIFont *)font andText:(NSString *)str;


@end
