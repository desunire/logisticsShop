//
//  KLGoodCollectView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/18.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLGoodCollectView.h"

@implementation KLGoodCollectView


+(instancetype)initView{
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([KLGoodCollectView class]) bundle:nil];
    return  [[nib instantiateWithOwner:nil options:nil] firstObject];
}

@end
