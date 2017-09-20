//
//  KLProfileOperateOrderTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLProfileOperateOrderTableViewCell.h"
#import "KLProfileOperateOrderView.h"
#import "UpPicDownTextBtn.h"
@implementation KLProfileOperateOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



/**
 设置当前订单操作视图，待确认，待发货，售后，全部订单
 @param sender <#sender description#>
 */
-(void)setCellWithOperateItem:(id)sender{
    
    KLProfileOperateOrderView *operateView = [KLProfileOperateOrderView initView];
    
    //绘制当前cell
   // operateView.waitSureBtn = [[UpPicDownTextBtn alloc] initWithFrame:CGRectZero andPicImage:@"kind" andText:@"待确认" andTextColor:[UIColor grayColor] andTextFont:[UIFont systemFontOfSize:15.0]];
    
    [operateView.waitSureBtn setViewWithPicImage:@"kind" andText:@"待确认" andTextColor:[UIColor grayColor] andTextFont:[UIFont systemFontOfSize:15.0]];
    
    
     [operateView.waitSendBtn setViewWithPicImage:@"kind" andText:@"待发货" andTextColor:[UIColor grayColor] andTextFont:[UIFont systemFontOfSize:15.0]];
    
    
     [operateView.afterSaleBtn setViewWithPicImage:@"kind" andText:@"售后" andTextColor:[UIColor grayColor] andTextFont:[UIFont systemFontOfSize:15.0]];
    
    
     [operateView.allOrderBtn setViewWithPicImage:@"kind" andText:@"全部订单" andTextColor:[UIColor redColor] andTextFont:[UIFont systemFontOfSize:15.0]];
    
    operateView.frame = self.contentView.frame;
    
    [self.contentView addSubview:operateView];
    
    
}

@end
