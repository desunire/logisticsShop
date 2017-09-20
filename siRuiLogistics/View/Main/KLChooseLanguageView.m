//
//  KLChooseLanguageView.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/20.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLChooseLanguageView.h"

@implementation KLChooseLanguageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)chooseEnglish:(id)sender {
    [self changeLanguageTo:@"en"];
}

- (IBAction)chooseChiness:(id)sender {
    [self changeLanguageTo:@"zh-Hans"];
}

- (IBAction)chooseEspan:(id)sender {
    [self changeLanguageTo:@"es"];
}

- (void)changeLanguageTo:(NSString *)language {
    // 设置语言
    [NSBundle setLanguage:language];
    // 然后将设置好的语言存储好，下次进来直接加载
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:@"myLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
     KLMainViewController * vc= [[KLMainViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController =vc;
    vc.selectedIndex = self.index;
}

@end
