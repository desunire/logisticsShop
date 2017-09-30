//
//  KLSubmitZitiOrderTableViewCell.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/27.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^changePickGoodStyleBlock)();

@interface KLSubmitZitiOrderTableViewCell : UITableViewCell

@property(copy,nonatomic)changePickGoodStyleBlock block;

@property (weak, nonatomic) IBOutlet UIButton *ztBtn;
@property (weak, nonatomic) IBOutlet UILabel *ztStoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *ztAddresslabel;
@property (weak, nonatomic) IBOutlet UILabel *ztUsernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ztPhoneLabel;
- (IBAction)ztBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *pickWayLabel;
@property (weak, nonatomic) IBOutlet UILabel *saleManagerLabel;
@property (weak, nonatomic) IBOutlet UILabel *pickAddressLabel;

@end
