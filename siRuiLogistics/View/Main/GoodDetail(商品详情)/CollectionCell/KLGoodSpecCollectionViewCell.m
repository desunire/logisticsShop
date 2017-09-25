//
//  KLGoodSpecCollectionViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/25.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLGoodSpecCollectionViewCell.h"

@implementation KLGoodSpecCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.chooseNumberBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    self.chooseNumberBtn.layer.borderWidth = 1;
    self.chooseNumberBtn.layer.borderColor = UIColorFromRGB(0xdadada).CGColor;
}

@end
