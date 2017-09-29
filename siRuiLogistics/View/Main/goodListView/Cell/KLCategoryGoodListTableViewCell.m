//
//  KLCategoryGoodListTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/21.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLCategoryGoodListTableViewCell.h"

@implementation KLCategoryGoodListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //中划线
//    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSForegroundColorAttributeName:mainTitleColor};
//    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:@"$30.00" attributes:attribtDic];
//    self.goodOriginPriceLabel.attributedText = attribtStr;

    self.goodOriginPriceLabel.text = @"$150.00";
    
    [UILabel setMiddleLineWithText:@"" andForegroundColor:DefaultBackColor WithLabel:self.goodOriginPriceLabel];
    
   // [UILabel setMiddleLineWithText:@"￥30.0000" andForegroundColor:DefaultBackColor WithLabel:self.goodNameLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)gotoShopCart:(id)sender {
}
@end
