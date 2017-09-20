//
//  KLIndexSearchMessageChangeView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLIndexSearchMessageChangeView.h"

@interface KLIndexSearchMessageChangeView()<UISearchBarDelegate>

@end

@implementation KLIndexSearchMessageChangeView

+(instancetype)initView{
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([KLIndexSearchMessageChangeView class]) bundle:nil];
    return  [[nib instantiateWithOwner:nil options:nil] firstObject];
}

- (IBAction)changeLanguage:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(changeLangWithBtn:)]) {
        [self.delegate changeLangWithBtn:sender];
    }
    [UIView animateWithDuration:0.25 animations:^{
        CGAffineTransform transform= CGAffineTransformMakeRotation(M_PI*1);
        self.upDownImageView.transform = transform;
    }];
    
}
- (IBAction)goMessage:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(gotoMessageViewByBtn:)]) {
        [self.delegate gotoMessageViewByBtn:sender];
    }
}


-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    if ([self.delegate respondsToSelector:@selector(gotoSearchView:)]) {
        [self.delegate gotoSearchView:self.searchBar];
    }
    
    return NO;
    
}


@end
