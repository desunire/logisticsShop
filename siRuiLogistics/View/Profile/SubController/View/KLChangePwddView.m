//
//  KLChangePwdView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLChangePwddView.h"

@implementation KLChangePwddView

+(instancetype)initView{
    
    return [[[UINib nibWithNibName:NSStringFromClass([KLChangePwddView class]) bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
}

-(void)setUI{
    
    self.sureBtn.layer.cornerRadius = 5;
    
    self.sureBtn.layer.masksToBounds = YES;
}

- (IBAction)sureBtnClick:(id)sender {
    //判断输入是否符合逻辑
//    if (self.oldPwdTextField.text) {
//        <#statements#>
//    }
    
    if ([self.delegate respondsToSelector:@selector(changePwdWithOldPwd:andNewPwd:andSurepwd:)]) {
        [self.delegate changePwdWithOldPwd:self.oldPwdTextField.text andNewPwd:self.nnewTextField.text andSurepwd:self.surePwdTextField.text];
    }
}
@end
