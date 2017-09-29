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
    
    
    //设置数据
    self.goodPriceLabel.text = [NSString stringWithFormat:@"%@:",NSLocalizedString(@"goodPrice", nil)];
    
    self.goodNumberLabel.text = [NSString stringWithFormat:@"%@:",NSLocalizedString(@"goodNumber", nil)];
    
    self.goodBrandLabel.text = [NSString stringWithFormat:@"%@:陕西汽车重卡",NSLocalizedString(@"brand", nil)];
    
    self.goodModelLabel.text =self.goodBrandLabel.text = [NSString stringWithFormat:@"%@:1702AD02",NSLocalizedString(@"goodModel", nil)];
    
    [UILabel setMiddleLineWithText:@"￥15.00" andForegroundColor:DefaultBackColor WithLabel:self.goodOriginPriceLabel];


    
    
    self.goodStoreLabel.text = [NSString stringWithFormat:@"%@:99件",NSLocalizedString(@"goodinventory", nil)];
    
}

@end
