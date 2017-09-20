//
//  KLProfileInfoTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLProfileInfoTableViewCell.h"
#import "KLProfileInfoView.h"
@implementation KLProfileInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellWithModel:(id)model{
    
    KLProfileInfoView *view = [KLProfileInfoView initView];
    
    view.frame = self.contentView.frame;
    
    [self.contentView addSubview:view];
    
}

@end
