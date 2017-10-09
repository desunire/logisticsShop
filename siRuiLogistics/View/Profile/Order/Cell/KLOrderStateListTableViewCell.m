//
//  KLOrderStateListTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/10/9.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLOrderStateListTableViewCell.h"

@implementation KLOrderStateListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.delBtn.backgroundColor = [UIColor whiteColor];
    
    [self.delBtn setTitleColor:DefaultBackColor forState:UIControlStateNormal];
    
    
    self.delBtn.layer.borderWidth = 1;
    
    self.delBtn.layer.borderColor = DefaultBackColor.CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)delBtnClick:(id)sender {
}
@end
