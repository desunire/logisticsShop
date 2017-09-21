//
//  KLFilterCategoryTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/21.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLFilterCategoryTableViewCell.h"

@implementation KLFilterCategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellWithArr:(NSArray *)contentArr{
    
    //计算高度
    CGFloat height=30 + JGGtopMargin;//
    //计算行数
    long int number = contentArr.count / 3;

    if (contentArr.count%3 != 0) {
        number ++;
    }
    
    KLScratchableLatexView *view = [[KLScratchableLatexView alloc] initWithFrame:CGRectMake(0, 0, FiltrateViewScreenW, height*number+10) andBtnDataArr:contentArr];
    
    [self.contentView addSubview:view];
    
     [DCSpeedy dc_setUpAcrossPartingLineWith:self.contentView WithColor:[UIColorFromRGB(0xdadada) colorWithAlphaComponent:0.4]];
    
}

@end
