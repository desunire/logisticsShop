//
//  KLFilterBrandTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/21.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLFilterBrandTableViewCell.h"

@implementation KLFilterBrandTableViewCell

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
    CGFloat height=proportion*(self.frame.size.width-(JGGeftMargin+JGGeftMargin)*3)/3+2*JGGtopMargin;
    //计算行数
    long int number = contentArr.count / 3 + 1;
    
    if (contentArr.count%3 != 0) {
        number ++;
    }
    
    KLScratchableLatexView *view = [[KLScratchableLatexView alloc] initWithFrame:CGRectMake(0, 0, FiltrateViewScreenW, height*number+10) andImageDataArr:contentArr];
    
    [self.contentView addSubview:view];
    
    [DCSpeedy dc_setUpAcrossPartingLineWith:self.contentView WithColor:[UIColorFromRGB(0xdadada) colorWithAlphaComponent:0.4]];
}

@end
