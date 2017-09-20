//
//  KLNavgationViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/13.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLNavgationViewController.h"

@interface KLNavgationViewController ()

@end

@implementation KLNavgationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//重写push方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    
    if (self.childViewControllers.count>0) {
        //不是栈底控制器
         viewController.hidesBottomBarWhenPushed = YES;
         self.navigationBar.hidden = NO;
    }
//    if (self.childViewControllers.count == 0) {
//        self.navigationBar.hidden = YES;
//    }else{
//        self.navigationBar.hidden = NO;
//    }
    [super pushViewController:viewController animated:animated];
}


//-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
