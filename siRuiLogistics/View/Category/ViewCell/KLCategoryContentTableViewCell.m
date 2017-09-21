//
//  KLCategoryContentTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/20.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLCategoryContentTableViewCell.h"

@implementation KLCategoryContentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setCellWithArr:(NSArray *)contentArr{
    
    KLScratchableLatexView *view = [[KLScratchableLatexView alloc] initWithDataArr:contentArr];
    
    [self.contentView addSubview:view];
    
}

@end
