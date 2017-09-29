//
//  KLProfileItemTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLProfileItemTableViewCell.h"

@implementation KLProfileItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellWithDic:(NSDictionary *)dic{
    
    if ([dic jsonString:@"imageName"]) {
        self.showImageView.image = [UIImage imageNamed:[dic valueForKey:@"imageName"]];
    }
    
    if ([dic jsonString:@"title"]) {
        self.title.text =NSLocalizedString([dic valueForKey:@"title"], nil);
    }
    
}

@end
