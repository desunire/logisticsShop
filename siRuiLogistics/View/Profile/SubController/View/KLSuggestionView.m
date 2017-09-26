//
//  KLSuggestionView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLSuggestionView.h"

@implementation KLSuggestionView


- (IBAction)submitBtnClick:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(submitWithContent:andPhone:)]) {
        [self.delegate submitWithContent:self.contentView.text andPhone:self.phoneTextField.text];
    }
    
}

+(instancetype)initView{
    
    return [[[UINib nibWithNibName:NSStringFromClass([KLSuggestionView class]) bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
}

-(void)setUI{
    
    self.submitBtn.layer.cornerRadius = 5;
    
    self.submitBtn.layer.masksToBounds = YES;
}

@end
