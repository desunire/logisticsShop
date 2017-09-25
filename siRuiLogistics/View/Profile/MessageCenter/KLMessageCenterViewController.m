//
//  KLMessageCenterViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/25.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLMessageCenterViewController.h"
#import "KLMessageStateView.h"
@interface KLMessageCenterViewController ()

@end

@implementation KLMessageCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [[KLNavTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-80, 44) andTitle:@"消息中心"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
