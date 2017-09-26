//
//  KLAddressListTableViewCell.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    defaultAddress,
    editAddress,
    deleteAddress,
} addressListOperate;

typedef void(^addressListBlock)(addressListOperate);


@interface KLAddressListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *namelabel;
@property (weak, nonatomic) IBOutlet UILabel *phonelabel;
@property (weak, nonatomic) IBOutlet UILabel *addresslabel;
@property (weak, nonatomic) IBOutlet UIButton *defaultBtn;

@property (copy,nonatomic)addressListBlock block;

- (IBAction)defaultBtnClick:(id)sender;
- (IBAction)editBtnClick:(id)sender;
- (IBAction)delBtnClick:(id)sender;

@end
