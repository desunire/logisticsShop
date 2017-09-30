//
//  KLSubmitOrderInfoTableViewCell.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/27.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^changePickGoodStyleBlock)();

@interface KLSubmitOrderInfoTableViewCell : UITableViewCell


@property(copy,nonatomic)changePickGoodStyleBlock block;


- (IBAction)styleBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *psStoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *psBtn;
@property (weak, nonatomic) IBOutlet UILabel *psAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *psUserNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *psPhoneLabel;
- (IBAction)showAddressBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *pickWayLabel;
@property (weak, nonatomic) IBOutlet UILabel *receivedLabel;
@property (weak, nonatomic) IBOutlet UILabel *receivedAddress;

@end
