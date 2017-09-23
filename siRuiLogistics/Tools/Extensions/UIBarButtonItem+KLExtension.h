//
//  UIBarButtonItem+KLExtension.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/20.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (KLExtension)


/**
 一张返回图片
 @param imageName <#imageName description#>
 @return <#return value description#>
 */
-(instancetype)initWithCustomView:(NSString *)imageName andTarget:(SEL)selector;


+(UIBarButtonItem *)ItemWithImage:(UIImage *)image WithHighlighted:(UIImage *)HighlightedImage Target:(id)target action:(SEL)action;

@end
