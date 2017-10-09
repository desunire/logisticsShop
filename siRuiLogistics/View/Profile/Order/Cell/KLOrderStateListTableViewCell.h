//
//  KLOrderStateListTableViewCell.h
//  siRuiLogistics
//
//  Created by desunire on 2017/10/9.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLOrderStateListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *orderTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderStateLabel;
@property (weak, nonatomic) IBOutlet UIButton *delBtn;
- (IBAction)delBtnClick:(id)sender;

@end
