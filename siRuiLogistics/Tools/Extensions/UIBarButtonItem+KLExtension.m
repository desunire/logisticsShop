//
//  UIBarButtonItem+KLExtension.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/20.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "UIBarButtonItem+KLExtension.h"

@implementation UIBarButtonItem (KLExtension)

-(instancetype)initWithCustomView:(NSString *)imageName andTarget:(SEL)selector{
    
    UIButton *back = [UIButton cz_imageButton:imageName backgroundImageName:imageName];
    
    back.frame = CGRectMake(0, 0, 20, 20);
    
   // back.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    
    // 让按钮的内容往左边偏移10
    //back.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    
    [back addTarget:nil action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return [self initWithCustomView:back];
}

@end
