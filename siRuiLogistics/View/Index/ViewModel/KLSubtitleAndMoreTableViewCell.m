//
//  KLSubtitleAndMoreTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/18.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLSubtitleAndMoreTableViewCell.h"

@implementation KLSubtitleAndMoreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.hotLabel.text = NSLocalizedString(@"hotRecommend", nil);
    self.moreLabel.text =NSLocalizedString(@"More", nil);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
