//
//  KLProfileOperateOrderTableViewCell.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    waitSureOrder,
    waitsendOrder,
    afterSaleOrder,
    allOrder
}operateType;


typedef void(^orderOperateBlock)(operateType);

@interface KLProfileOperateOrderTableViewCell : UITableViewCell


@property(copy,nonatomic)orderOperateBlock block;

-(void)setCellWithOperateItem:(id)sender;


@end
