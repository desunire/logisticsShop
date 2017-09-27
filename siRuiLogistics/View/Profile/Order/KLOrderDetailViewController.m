//
//  KLOrderDetailViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/27.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLOrderDetailViewController.h"
#import "KLOrderStateTableViewCell.h"
#import "KLOrderDetailInfoTableViewCell.h"
#import "KLOrderGoodDetailInfoTableViewCell.h"
#import "KLOrderTimeTableViewCell.h"

static float delBtnHeight = 60;

//全局设置cell标识
static NSString *orderStateCellId = @"orderStateCell";

static NSString *orderDetailInfoCellId = @"orderDetailInfoCell";

static NSString *orderGoodDetailInfoId = @"orderGoodDetailInfoCell";

static NSString *orderTimeCellId = @"orderTimeCell";


@interface KLOrderDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
//删除订单按钮
@property(strong,nonatomic)UIButton *delBtn;

//展示视图
@property(strong,nonatomic)UITableView *tableView;

@end

@implementation KLOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.titleView = [[KLNavTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-80, 44) andTitle:@"订单详情"];
    [self addTabeView];
    [self initDelBtn];
}


#pragma mark 初始化删除订单按钮
-(void)initDelBtn{
    
    self.delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.delBtn.backgroundColor = DefaultBackColor;
    [self.delBtn setTitle:@"删除订单" forState:UIControlStateNormal];
    [self.delBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.delBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15.0];
    
    self.delBtn.frame = CGRectMake(0, SCREENH_HEIGHT-delBtnHeight, SCREEN_WIDTH, delBtnHeight);
    [self.view addSubview:self.delBtn];
}

#pragma mark 添加tableView
-(void)addTabeView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT-delBtnHeight) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = viewBackColor;
    
    [self.view addSubview:self.tableView];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        KLOrderStateTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:orderStateCellId];
        if (cell == nil) {
            cell =[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLOrderStateTableViewCell class]) owner:self options:nil] firstObject];
        }
        return cell;
        
    } else if (indexPath.section == 1) {
        KLOrderDetailInfoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:orderDetailInfoCellId];
        if (cell == nil) {
            cell =[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLOrderDetailInfoTableViewCell class]) owner:self options:nil] firstObject];
        }
        return cell;
        
    }else if (indexPath.section == 2) {
        KLOrderGoodDetailInfoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:orderGoodDetailInfoId];
        if (cell == nil) {
            cell =[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLOrderGoodDetailInfoTableViewCell class]) owner:self options:nil] firstObject];
        }
        return cell;
        
    }else {
        KLOrderTimeTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:orderTimeCellId];
        if (cell == nil) {
            cell =[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLOrderTimeTableViewCell class]) owner:self options:nil] firstObject];
        }
        return cell;
    }

}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }
    if (indexPath.section == 1) {
        return 140;
    }
    
    if (indexPath.section == 2) {
        return 100;
    }
    if (indexPath.section == 3) {
        return 60;
    }
    
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] init];
    
    view.backgroundColor = viewBackColor;
    
    return view;
}

@end
