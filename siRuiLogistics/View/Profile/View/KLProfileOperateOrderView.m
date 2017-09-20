//
//  KLProfileOperateOrderView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLProfileOperateOrderView.h"

@implementation KLProfileOperateOrderView

+(instancetype)initView{
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([KLProfileOperateOrderView class]) bundle:nil];
    return  [[nib instantiateWithOwner:nil options:nil] firstObject];
}

@end
