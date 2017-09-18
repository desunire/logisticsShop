//
//  KLCategoryItemTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/18.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLCategoryItemTableViewCell.h"
#import "KLCategoryItemButton.h"

@interface KLCategoryItemTableViewCell()<KLCategoryItemButtonDelegate>


@end

@implementation KLCategoryItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellWithModelArr:(NSArray *)ItemArr{
    for (int i = 0; i<ItemArr.count; i++) {
        //设置每个UIButton的尺寸宽高
        CGFloat width = SCREEN_WIDTH/4;
        CGFloat picWidth = width-leftMargin-rightMargin;
        CGFloat height = picWidth+topMargin+belowMargin+titleHeight;
        KLCategoryObject *model = [ItemArr objectAtIndex:i];
        KLCategoryItemButton *btn = [[KLCategoryItemButton alloc] initWithFrame:CGRectMake(0+i%4*width, 0+i/4*height, width, height) WithModel:model];
        btn.delegate = self;
        [self.contentView addSubview:btn];
    }
}


#pragma mark KLCategoryItemButtonDelegate
-(void)clickBtnWithModel:(KLCategoryObject *)model{
    NSLog(@"%@",model.picDesc);
}


@end
