//
//  KLMessageStateView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/25.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLMessageStateView.h"

@implementation KLMessageStateView

+(instancetype)initView{
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([KLMessageStateView class]) bundle:nil];
    return  [[nib instantiateWithOwner:nil options:nil] firstObject];
}



- (IBAction)changeChooseState:(id)sender {
    
    self.isAllChoose = !self.isAllChoose;
    if (self.block) {
        self.block(self.isAllChoose);
    }
//    if (self.isAllChoose) {
//        [self.chooseBtn setImage:[UIImage imageNamed:@"xuanzhong"] forState:UIControlStateNormal];
//    }else{
//        [self.chooseBtn setImage:[UIImage imageNamed:@"weixuanzhong"] forState:UIControlStateNormal];
//    }
    
}
@end
