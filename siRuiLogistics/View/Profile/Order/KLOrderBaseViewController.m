//
//  KLOrderBaseViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/26.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLOrderBaseViewController.h"
#import "KLOrderListTableViewCell.h"
#import "KLOrderGoodListTableViewCell.h"
#import "KLOrderStateListTableViewCell.h"

#import "KLOrderModel.h"
#import "KLOrderGoodModel.h"

@interface KLOrderBaseViewController ()<UITableViewDelegate,UITableViewDataSource,KLEmptyViewDelegate>
/**
 数据源
 */
@property(strong,nonatomic)NSMutableArray *orderListData;

@end

@implementation KLOrderBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTableView];
    [self setEmptyView];
    [self getOrderList];
}

#pragma mark 获取当前订单list数据源
-(void)getOrderList{
    //获取数据源
    KLOrderModel *Model1 = [KLOrderModel new];
    Model1.orderTime = @"2017-06-05 12:20";
    Model1.orderState = @"待发货";
    KLOrderGoodModel *gmodel1 =[KLOrderGoodModel new];
    KLOrderGoodModel *gmodel2 =[KLOrderGoodModel new];
    KLOrderGoodModel *gmodel3 =[KLOrderGoodModel new];
    Model1.orderGoodList = @[gmodel1,gmodel2,gmodel3];
    
    
    KLOrderModel *Model2 = [KLOrderModel new];
    Model2.orderTime = @"2017-06-05 12:20";
    Model2.orderState = @"待发货";
    KLOrderGoodModel *gmodel11 =[KLOrderGoodModel new];
    KLOrderGoodModel *gmodel22 =[KLOrderGoodModel new];
    KLOrderGoodModel *gmodel33 =[KLOrderGoodModel new];
    Model2.orderGoodList = @[gmodel11,gmodel22,gmodel33];
    
    self.orderListData = [NSMutableArray array];
    [self.orderListData addObject:Model1];
    [self.orderListData addObject:Model2];
    
}
#pragma mark 设置空视图（搜索结果为空）
-(void)setEmptyView{
    self.emptyView= [[KLEmptyView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height-50-64) andBackImage:@"noOrder" andMessage:@""];
    self.emptyView.delegate = self;
    [self.view addSubview:self.emptyView];
}

-(void)clickView{
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
    
    return self.orderListData.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    KLOrderModel *model = [self.orderListData objectAtIndex:section];
    return 1+model.orderGoodList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KLOrderModel *model = [self.orderListData objectAtIndex:indexPath.section];
    if (indexPath.row ==model.orderGoodList.count) {
        KLOrderStateListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderstateListCell"];
        
        if (cell ==nil) {
            cell =[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLOrderStateListTableViewCell class]) owner:self options:nil] firstObject];
        }
        
        return cell;
    }
    else{
        KLOrderGoodListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderGoodListCell"];
        
        if (cell ==nil) {
            cell =[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLOrderGoodListTableViewCell class]) owner:self options:nil] firstObject];
        }
        
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    KLOrderModel *model = [self.orderListData objectAtIndex:indexPath.section];
    if (indexPath.row ==model.orderGoodList.count) {
        return 40;
    }
    return 100;
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
