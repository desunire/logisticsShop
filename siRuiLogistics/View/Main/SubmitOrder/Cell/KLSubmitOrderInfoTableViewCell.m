//
//  KLSubmitOrderInfoTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/27.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLSubmitOrderInfoTableViewCell.h"

@implementation KLSubmitOrderInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.psBtn.layer.borderColor = viewBackColor.CGColor;
    self.psBtn.layer.borderWidth = 1;
    self.psBtn.layer.cornerRadius = 2;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//切换配送方式
- (IBAction)styleBtnClick:(id)sender {
    
    if (self.block) {
        self.block();
    }
    
}
- (IBAction)showAddressBtnClick:(id)sender {
}
@end
