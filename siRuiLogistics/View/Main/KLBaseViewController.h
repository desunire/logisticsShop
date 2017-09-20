//
//  KLBaseViewController.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/13.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLChooseLanguageView.h"
@interface KLBaseViewController : UIViewController
/**
 展现内容的tableView视图
 */
@property(strong,nonatomic)UITableView *tableView;

/**
 首页搜索视图的背景视图
 */
@property(strong,nonatomic)UIView *indexDefaultBackView;

/**
 搜索和切换语言，查看消息的视图
 */
@property(strong,nonatomic)KLIndexSearchMessageChangeView *indexSearchTopView;

/**
 切换语言视图
 */
@property(strong,nonatomic)KLChooseLanguageView *chooseLanguageView;

-(void)setChooseLanguage;

@end
