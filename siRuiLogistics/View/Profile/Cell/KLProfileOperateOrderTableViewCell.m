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
    
     operateView.frame = self.contentView.frame;
    
    //四个按钮重新设置frame
    CGFloat width = SCREEN_WIDTH/4;
    CGFloat picHeight = width-leftMargin-rightMargin;
    CGFloat height = picHeight+topMargin+belowMargin+titleHeight;
    operateView.waitSureBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH/4, height);
    operateView.waitSendBtn.frame = CGRectMake(0, SCREEN_WIDTH/4, SCREEN_WIDTH/4, height);
    operateView.afterSaleBtn.frame = CGRectMake(0, SCREEN_WIDTH/4*2, SCREEN_WIDTH/4, height);
    operateView.allOrderBtn.frame = CGRectMake(0, SCREEN_WIDTH/4*3, SCREEN_WIDTH/4, height);
    
    
    
    [operateView.waitSureBtn setViewWithPicImage:@"mine_tobe_confirm" andText:NSLocalizedString(@"waitConfirmed", nil) andTextColor:[UIColor grayColor] andTextFont:[UIFont systemFontOfSize:15.0]];
    
    operateView.waitSendBtn.tag = waitSureOrder;
    
    [operateView.waitSureBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
    
     [operateView.waitSendBtn setViewWithPicImage:@"mine_goods_undelivered_order" andText:NSLocalizedString(@"waitSend", nil) andTextColor:[UIColor grayColor] andTextFont:[UIFont systemFontOfSize:15.0]];
     operateView.waitSendBtn.tag = waitsendOrder;
    [operateView.waitSendBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
     [operateView.afterSaleBtn setViewWithPicImage:@"mine_customer_service" andText:NSLocalizedString(@"afterSale", nil) andTextColor:[UIColor grayColor] andTextFont:[UIFont systemFontOfSize:15.0]];
    
    operateView.afterSaleBtn.tag = afterSaleOrder;
    [operateView.afterSaleBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
     [operateView.allOrderBtn setViewWithPicImage:@"mine_all_orders" andText:NSLocalizedString(@"allOrder", nil) andTextColor:[UIColor redColor] andTextFont:[UIFont systemFontOfSize:15.0]];
    operateView.allOrderBtn.tag = allOrder;
    [operateView.allOrderBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
   
    [self.contentView addSubview:operateView];
 }


-(void)clickItem:(UIButton *)sender{
    
    if (self.block) {
        self.block(sender.tag);
    }
    
}


@end
