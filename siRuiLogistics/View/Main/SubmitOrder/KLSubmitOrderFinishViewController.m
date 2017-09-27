//
//  KLSubmitOrderFinishViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/27.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLSubmitOrderFinishViewController.h"

@interface KLSubmitOrderFinishViewController ()

@end

@implementation KLSubmitOrderFinishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 设置navView
-(void)setNav{
    
    self.navigationItem.titleView = [[KLNavTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-80, 44) andTitle:@"提交成功"];
    
}

#pragma mark 设置UI
-(void)setUI{
    
    self.lookBtn.layer.borderColor =viewBackColor.CGColor;
    self.lookBtn.layer.borderWidth = 1;
    self.lookBtn.layer.masksToBounds = YES;
    self.lookBtn.layer.cornerRadius = 4;
}

- (IBAction)orderDetail:(id)sender {
    
    KLOrderDetailViewController *vc = [[KLOrderDetailViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:NO];
}
@end
