//
//  KLNavgationViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/13.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLNavgationViewController.h"
#import "UIBarButtonItem+KLExtension.h"
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
//        if ([viewController isKindOfClass:[KLBaseViewController class]]) {
//            
//        }
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:@"icon_left" andTarget:@selector(goBack:)];
        
        viewController.navigationItem.leftBarButtonItem.width = -15;  //偏移距离  -向左偏移, +向右偏移
    }

    [super pushViewController:viewController animated:animated];
}


-(void)goBack:(id)sender{
    
    [self popViewControllerAnimated:YES];
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
