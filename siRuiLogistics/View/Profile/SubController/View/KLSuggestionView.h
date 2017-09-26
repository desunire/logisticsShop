//
//  KLSuggestionView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol KLsuggestionViewDelegate <NSObject>

@optional

-(void)submitWithContent:(NSString *)content andPhone:(NSString *)phone;


@end

@interface KLSuggestionView : UIView
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)submitBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *placeHolderLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentView;

@property(weak,nonatomic)id<KLsuggestionViewDelegate>delegate;

+(instancetype)initView;

-(void)setUI;

@end
