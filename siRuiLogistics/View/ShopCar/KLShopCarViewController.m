//
//  KLShopCarViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/13.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLShopCarViewController.h"
#import "KLShopCarTitleTableViewCell.h"
#import "KLShopCarItemTableViewCell.h"
#import "ShopCarSettlementView.h"




static NSString *titleCell = @"shopCarTitleCell";

static NSString *itemCell = @"shopCarItemCell";

@interface KLShopCarViewController ()<UITableViewDelegate,UITableViewDataSource,ShopCarSettlementViewDelegate,SCJPromptViewDelegate>
/**
  购物车数据，， 仓库名-仓库下具体商品
 */
@property(strong,nonatomic)NSString *shopCarDataArr;


/**
  购物车页面下面操作视图，结算和删除
 */
@property(strong,nonatomic)ShopCarSettlementView *OperateView;

/**
 编辑和删除按钮
 */
@property(strong,nonatomic)UIButton *editOrdelBtn;

/**
  提示框
 */
@property(strong,nonatomic)SCJPromptView *scjPromptView;

@end

@implementation KLShopCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self registreCell];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT-self.tabBarController.tabBar.frame.size.height);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addOperateView];
    [self addEdit];
    [self initPromptBox];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 初始化提示框 SCJPromptViewDelegate
-(void)initPromptBox{
    self.scjPromptView=[[SCJPromptView alloc]initWithFrame:self.view.frame];
    self.scjPromptView.delegate=self;
    [self.scjPromptView setViewWithTitle:nil andMessge:@"确定要删除吗?" andCancelTitle:@"取消" andSureTitle:@"确认"];
    self.scjPromptView.hidden = YES;
    [self.navigationController.view addSubview:self.scjPromptView];
}


-(void)chooseItem:(NSInteger)item{
    if (item==0) {
        NSLog(@"取消");
    }
    else if(item==1){
        NSLog(@"确定");
    }
    self.scjPromptView.hidden = YES;
}
#pragma mark 设置购物车页面的编辑删除功能
-(void)addEdit{
    self.editOrdelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    [_editOrdelBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [_editOrdelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_editOrdelBtn addTarget:self action:@selector(editOrdelClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:self.editOrdelBtn];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

-(void)editOrdelClick:(UIButton *)editOrDelBtn{
    if (self.OperateView.shopcarOperateState == normalState) {
        self.OperateView.shopcarOperateState =editState;
        [UIView animateWithDuration:0.5 animations:^{
            [editOrDelBtn setTitle:@"完成" forState:UIControlStateNormal];
            [editOrDelBtn setTitleColor:DefaultBackColor forState:UIControlStateNormal];
        }];
    }else{
        self.OperateView.shopcarOperateState  = normalState;
        [UIView animateWithDuration:0.5 animations:^{
            [editOrDelBtn setTitle:@"编辑" forState:UIControlStateNormal];
            [editOrDelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }];
    }
}
#pragma mark 购物车结算和删除汇总视图
-(void)addOperateView{
    self.OperateView = [[ShopCarSettlementView alloc] initWithFrame:CGRectMake(0, self.tabBarController.tabBar.frame.origin.y-self.tabBarController.tabBar.frame.size.height, SCREEN_WIDTH, 50)];
    self.OperateView.shopcarOperateState = normalState;
    self.OperateView.delegate = self;
    [self.view insertSubview:self.OperateView aboveSubview:self.tabBarController.view];
}

#pragma mark ShopCarSettlementViewDelegate
-(void)gotoPay{
    NSLog(@"结算");
    KLSubmitOrderViewController *vc= [[KLSubmitOrderViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
    
}
-(void)delete:(id)sender{
    self.scjPromptView.hidden = NO;
    NSLog(@"删除");
}
-(void)chooseAll{
    NSLog(@"全选");
}

-(void)cancelChooseAll{
    NSLog(@"取消全选");
}

#pragma mark 注册cell
-(void)registreCell{
    
   // [self.tableView registerClass:[KLShopCarTitleTableViewCell class] forCellReuseIdentifier:titleCell];
  // [self.tableView registerClass:[KLShopCarItemTableViewCell class] forCellReuseIdentifier:itemCell];
    
    
}

#pragma mark UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        KLShopCarTitleTableViewCell *cell = (KLShopCarTitleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:titleCell];
        
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLShopCarTitleTableViewCell class]) owner:self options:nil] firstObject];
        }
        return cell;
        
    }else{
        
        KLShopCarItemTableViewCell *cell =(KLShopCarItemTableViewCell *)[tableView dequeueReusableCellWithIdentifier:itemCell];
        
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLShopCarItemTableViewCell class]) owner:self options:nil] firstObject];
        }
        return cell;
        
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return 50;
    }
    return 100;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10;
}

@end
