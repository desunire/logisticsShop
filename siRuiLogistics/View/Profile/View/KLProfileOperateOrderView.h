//
//  KLProfileOperateOrderView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UpPicDownTextBtn;

@interface KLProfileOperateOrderView : UIView
@property (weak, nonatomic) IBOutlet UpPicDownTextBtn *waitSureBtn;
@property (weak, nonatomic) IBOutlet UpPicDownTextBtn *waitSendBtn;
@property (weak, nonatomic) IBOutlet UpPicDownTextBtn *afterSaleBtn;
@property (weak, nonatomic) IBOutlet UpPicDownTextBtn *allOrderBtn;

+(instancetype)initView;

@end
