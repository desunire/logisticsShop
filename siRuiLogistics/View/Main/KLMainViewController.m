//
//  KLMainViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/13.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLMainViewController.h"

@interface KLMainViewController ()<UITabBarControllerDelegate>

@end

@implementation KLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self setNavViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 设置界面层级关系
-(void)setNavViewController{
    //根据字典json数据源设置界面视图
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"main.json" ofType:nil];
//    
//    NSData *data = [NSJSONSerialization dataWithJSONObject:[NSData dataWithContentsOfFile:path] options:nil error:nil];
//    
//    NSArray *array =[NSKeyedUnarchiver unarchiveObjectWithData:data];
//    ;
    
    //初始化文件路径。
    NSString* path  = [[NSBundle mainBundle] pathForResource:@"main.json" ofType:nil];
    //将文件内容读取到字符串中，注意编码NSUTF8StringEncoding 防止乱码，
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //将字符串写到缓冲区。
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    
    if (array) {
        NSMutableArray *subArr = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            
            [subArr addObject:[self setControllerWithDic:dict]];
        }
        self.viewControllers = subArr;
    }
    
    
}

//根据字典创建子控制器
-(UIViewController *)setControllerWithDic:(NSDictionary*)dic{
    
    //确保字典中字段有值
    if (dic[@"clsName"]) {
        if (dic[@"title"]) {
            if (dic[@"imageName"]) {
                Class cls = NSClassFromString(dic[@"clsName"]);
                KLBaseViewController *vc = [[cls alloc] init];
                //设置TabBar的title
                vc.title = NSLocalizedString(dic[@"title"], nil);
                //设置图形
                vc.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_gray",dic[@"imageName"]]];
                
                UIImage *selectImage =[[UIImage imageNamed:[NSString stringWithFormat:@"%@_red",dic[@"imageName"]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//设置图片模式 很重要
                //selectImage.renderingMode = UIImageRenderingModeAlwaysOriginal;
                vc.tabBarItem.selectedImage = selectImage;
               // vc.tabBarItem.selectedImage.renderingMode = UIImageRenderingModeAlwaysOriginal;
                [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
                [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:DefaultBackColor} forState:UIControlStateHighlighted];
                KLNavgationViewController *knv = [[KLNavgationViewController alloc] initWithRootViewController:vc];
                return knv;
                
             }
        }
        
    }
        UIViewController *vc = [UIViewController new];
        return vc;
 }


#pragma mark - <UITabBarControllerDelegate>
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //点击tabBarItem动画
    [self tabBarButtonClick:[self getTabBarButton]];
    
}
- (UIControl *)getTabBarButton{
    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
    
    return tabBarButton;
}
#pragma mark - 点击动画
- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据自己需求改动
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            //添加动画
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}


#pragma mark - 禁止屏幕旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
