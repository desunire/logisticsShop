//
//  KLSubmitZitiOrderTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/27.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLSubmitZitiOrderTableViewCell.h"

@implementation KLSubmitZitiOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.ztBtn.layer.borderColor = viewBackColor.CGColor;
    self.ztBtn.layer.borderWidth = 1;
    self.ztBtn.layer.cornerRadius = 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)ztBtnClick:(id)sender {
    
    if (self.block) {
        self.block();
    }
    
    
}
@end
