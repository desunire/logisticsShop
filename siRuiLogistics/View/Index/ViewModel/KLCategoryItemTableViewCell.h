//
//  KLCategoryItemTableViewCell.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/18.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KLCategoryObject;

typedef void(^clickItemBlock)(KLCategoryObject *object);

@interface KLCategoryItemTableViewCell : UITableViewCell

//设置cell根据分类模型数组
-(void)setCellWithModelArr:(NSArray *)ItemArr;

@property(copy,nonatomic)clickItemBlock block;

@end
