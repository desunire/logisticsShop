//
//  KLSalePromotionTableViewCell.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/18.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLSalePromotionTableViewCell.h"
#import "KLGoodCollectView.h"



@implementation KLSalePromotionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


/**
 根据促销的商品list设置推销产品
 @param promotionArr 数据源
 */
-(void)setCellWithPromotionArr:(NSMutableArray *)promotionArr{
    
    // 设置UI
    for (int i = 0; i<promotionArr.count; i++) {
        KLGoodCollectView *goodView = [KLGoodCollectView initView];
        CGFloat width = SCREEN_WIDTH/2;
        goodView.frame = CGRectMake(0+i%2*width, 0+i/2*cellHeight, width, cellHeight);
        goodView.showImageView .image = [UIImage kl_avatatImageWithSize:CGSizeMake(30, 30) andBackColor:[UIColor redColor]];
        goodView.good = [NSString stringWithFormat:@"id:%d",i];
        //给推广的商品view添加点击事件
        UITapGestureRecognizer *tapView =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickItem:)];
        [goodView addGestureRecognizer:tapView];
        [self.contentView addSubview:goodView];
    }
    
}

-(void)clickItem:(UITapGestureRecognizer *)sender{
    
    //获取当前视图
    KLGoodCollectView *view = (KLGoodCollectView *)sender.view;
    if (self.block) {
        self.block(view.good);
    }
    
}


@end
