//
//  KLSalePromotionTableViewCell.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/18.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>


//点击商品的Block
typedef void(^clickGoodItemBlock)(NSString *);

static CGFloat cellHeight = 260;

@interface KLSalePromotionTableViewCell : UITableViewCell

@property(copy,nonatomic)clickGoodItemBlock block;

-(void)setCellWithPromotionArr:(NSMutableArray *)promotionArr;

@end
