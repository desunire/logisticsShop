//
//  KLBaseViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/13.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLBaseViewController.h"

@interface KLBaseViewController ()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation KLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 初始化tableView
-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
   // self.tableView.style =  UITableViewStylePlain;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    [self.view insertSubview:self.tableView belowSubview:backView];
}

#pragma mark tableView代理和数据源方法实现
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  0;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [UITableViewCell new];
    return cell;
}


@end
