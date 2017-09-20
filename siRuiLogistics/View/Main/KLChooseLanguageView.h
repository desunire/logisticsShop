//
//  KLChooseLanguageView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/20.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLChooseLanguageView : UIView


/**
 //当前所属视图的Index
 */
@property(assign,nonatomic)NSInteger index;

@property (weak, nonatomic) IBOutlet UIButton *englishBtn;

@property (weak, nonatomic) IBOutlet UIButton *chineseBtn;

@property (weak, nonatomic) IBOutlet UIButton *espanBtn;


- (IBAction)chooseEnglish:(id)sender;
- (IBAction)chooseChiness:(id)sender;

- (IBAction)chooseEspan:(id)sender;

@end
