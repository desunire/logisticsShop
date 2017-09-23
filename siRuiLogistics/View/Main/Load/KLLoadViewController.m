//
//  KLLoadViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/23.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLLoadViewController.h"

@interface KLLoadViewController ()

@end

@implementation KLLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    
    self.loadBtn.layer.cornerRadius = 5;
    
    self.loadBtn.layer.masksToBounds = YES;
    
    [self.accountTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).offset(10);
        
        make.top.equalTo(self.view.mas_top).offset(550*SCREENH_HEIGHT/1334);
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-20, 30));
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}

@end
