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
    //设置自提界面的多国语言显示
    self.pickWayLabel.text = NSLocalizedString(@"pickWay", nil);
    self.saleManagerLabel.text = NSLocalizedString(@"salesManager", nil);
    self.pickAddressLabel.text = NSLocalizedString(@"takeAddress", nil);
    [self.ztBtn setTitle:NSLocalizedString(@"ziti", nil) forState:UIControlStateNormal];
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
