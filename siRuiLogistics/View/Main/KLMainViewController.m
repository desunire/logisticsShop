//
//  KLMainViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/13.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLMainViewController.h"

@interface KLMainViewController ()

@end

@implementation KLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
                vc.title = dic[@"title"];
                //设置图形
                vc.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%@",dic[@"imageName"]]];
                
                UIImage *selectImage =[[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%@_selected",dic[@"imageName"]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//设置图片模式 很重要
                //selectImage.renderingMode = UIImageRenderingModeAlwaysOriginal;
                vc.tabBarItem.selectedImage = selectImage;
               // vc.tabBarItem.selectedImage.renderingMode = UIImageRenderingModeAlwaysOriginal;
                [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
                [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateHighlighted];
                KLNavgationViewController *knv = [[KLNavgationViewController alloc] initWithRootViewController:vc];
                return knv;
                
             }
        }
        
    }
        UIViewController *vc = [UIViewController new];
        return vc;
 }

@end
