//
//  KLShopCarItemTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/20.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLShopCarItemTableViewCell.h"

@implementation KLShopCarItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //绘制数量按钮
    self.numberBtn.layer.borderColor = UIColorFromRGB(0xdadada).CGColor;
    self.numberBtn.layer.borderWidth = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)reduceNumClick:(id)sender {
    
    NSLog(@"reduce");
}

- (IBAction)addNumberClick:(id)sender {
    NSLog(@"add");
}

@end
