//
//  UIImage+KLExtentsion.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/18.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "UIImage+KLExtentsion.h"

@implementation UIImage (KLExtentsion)

+(instancetype)kl_avatatImageWithSize:(CGSize)size andBackColor:(UIColor *)backColor{
    
    //设置边框宽度
    CGFloat border = 1;
    CGFloat imageWH = size.width;
    
    //计算外圆的尺寸
    //CGFloat ovalWH = imageWH + 2 * border;
    CGFloat ovalWH = imageWH;
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    //画一个大的圆形--边框颜色
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalWH, ovalWH)];
    
    [backColor set];
    [path fill];
    
    //设置裁剪区域
    UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, imageWH, imageWH)];
    [path1 addClip];
    
    //绘制图片
   // [self drawAtPoint:CGPointMake(border, border)];
    UIImage *result;
    
    [result drawAtPoint:CGPointMake(border, border)];
    
    //从上下文中获取图片
    result = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return result;
    
}


@end
