//
//  KLAllChooseDelView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLAllChooseDelView.h"

@implementation KLAllChooseDelView

- (IBAction)chooseChangeBtn:(id)sender {
    
    self.nowState = !self.nowState;
    
    if ([self.delegate respondsToSelector:@selector(changeState:)]) {
        
        [self.delegate changeState:self.nowState];
    }
    
}

- (IBAction)delBtnClick:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(delData)]) {
        [self.delegate delData];
    }
    
}

+(instancetype)initView{
    
    //[UINib nibWithNibName:NSStringFromClass([KLMessageStateView class]) bundle:nil]
    return [[[UINib nibWithNibName:NSStringFromClass([KLAllChooseDelView class]) bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
}

@end
