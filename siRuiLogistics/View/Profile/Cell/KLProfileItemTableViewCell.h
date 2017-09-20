//
//  KLProfileItemTableViewCell.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLProfileItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;

-(void)setCellWithDic:(NSDictionary *)dic;

@end
