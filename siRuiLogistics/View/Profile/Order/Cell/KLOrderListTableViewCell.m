//
//  KLOrderListTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLOrderListTableViewCell.h"

@implementation KLOrderListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.delBtn.backgroundColor = [UIColor whiteColor];
    
    [self.delBtn setTitleColor:DefaultBackColor forState:UIControlStateNormal];
    
    
    self.delBtn.layer.borderWidth = 1;
    
    self.delBtn.layer.borderColor = DefaultBackColor.CGColor;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)delOrderBtnClick:(id)sender {
}
@end
