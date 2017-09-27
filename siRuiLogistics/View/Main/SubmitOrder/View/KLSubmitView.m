//
//  KLSubmitOrderView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/27.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLSubmitView.h"

@implementation KLSubmitView


- (IBAction)submitBtnClick:(id)sender {
    
    if ([self.delagete respondsToSelector:@selector(submitOrder)]) {
        [self.delagete submitOrder];
    }
    
}

+(instancetype)initView{
    return [[[UINib nibWithNibName:NSStringFromClass([KLSubmitView class]) bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
}

@end
