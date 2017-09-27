//
//  KLOrderBaseViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLOrderBaseViewController.h"
#import "KLOrderListTableViewCell.h"
@interface KLOrderBaseViewController ()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation KLOrderBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTableView];
}


#pragma mark 设置TableVIew
-(void)addTableView{
    
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height-50-64) style:UITableViewStylePlain];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    self.tableView.backgroundColor = viewBackColor;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    KLOrderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderListCell"];
    
    if (cell ==nil) {
        cell =[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLOrderListTableViewCell class]) owner:self options:nil] firstObject];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 140;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] init];
    
    view.backgroundColor = viewBackColor;
    
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    KLOrderDetailViewController *vc = [[KLOrderDetailViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:NO];
}

@end
