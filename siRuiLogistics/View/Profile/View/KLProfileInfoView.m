//
//  KLProfileInfoView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLProfileInfoView.h"

@implementation KLProfileInfoView

+(instancetype)initView{
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([KLProfileInfoView class]) bundle:nil];
    return  [[nib instantiateWithOwner:nil options:nil] firstObject];
}

@end
