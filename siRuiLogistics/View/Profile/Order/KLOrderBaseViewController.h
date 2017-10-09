//
//  KLOrderBaseViewController.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLOrderBaseViewController : UIViewController


@property(strong,nonatomic)UITableView *tableView;

/**
 空视图
 */
@property(strong,nonatomic)KLEmptyView *emptyView;

@property(assign,nonatomic)int nowIndex;


//获取当前订单列表
-(void)getOrderList;

@end
