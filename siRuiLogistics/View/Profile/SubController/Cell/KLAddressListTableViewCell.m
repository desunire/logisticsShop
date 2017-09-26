//
//  KLAddressListTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLAddressListTableViewCell.h"

@implementation KLAddressListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)defaultBtnClick:(id)sender {

    if (self.block) {
        self.block(defaultAddress);
    }
}

- (IBAction)editBtnClick:(id)sender {


    if (self.block) {
        self.block(editAddress);
    }
}

- (IBAction)delBtnClick:(id)sender {


    if (self.block) {
        self.block(deleteAddress);
    }
}
@end
