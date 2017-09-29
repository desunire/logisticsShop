//
//  KLSubmitOrderViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/27.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLSubmitOrderViewController.h"
#import "KLSubmitOrderInfoTableViewCell.h"
#import "KLSubmitOrderGoodInfoTableViewCell.h"
#import "KLSubmitZitiOrderTableViewCell.h"
#import "KLSubmitView.h"
#import "KLSubmitOrderFinishViewController.h"
#import "KLAddressViewController.h"
static float operateViewHeight = 60;


@interface KLSubmitOrderViewController ()<UITableViewDelegate,UITableViewDataSource,KLSubmitViewDelegate,SCJPromptViewDelegate>


@property(strong,nonatomic)UITableView *tableView;
//提示框
@property(strong,nonatomic)SCJPromptView *scjPromptView;

//提货方式 0--自提 1--配送
@property(assign,nonatomic)int pickgoodStyle;


//提交订单视图
@property(strong,nonatomic)KLSubmitView *submitView;
@end

@implementation KLSubmitOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self addTabeView];
    [self addPromptView];
}


#pragma mark 设置提示框
-(void)addPromptView{
    self.scjPromptView=[[SCJPromptView alloc]initWithFrame:self.view.frame];
    self.scjPromptView.delegate=self;
    [self.scjPromptView setViewWithTitle:nil andMessge:@"确定要提交订单?" andCancelTitle:@"取消" andSureTitle:@"确认"];
    self.scjPromptView.hidden = YES;
    [self.navigationController.view addSubview:self.scjPromptView];
}
-(void)chooseItem:(NSInteger)item{
    if (item==0) {
        NSLog(@"取消");
    }
    else if(item==1){
        NSLog(@"确定");
        [self gotoFinishSubmitOrder];
    }
    self.scjPromptView.hidden = YES;
}


#pragma mark 确定提交订单
-(void)gotoFinishSubmitOrder{
    KLSubmitOrderFinishViewController *vc=[[KLSubmitOrderFinishViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
    
}

#pragma mark 添加tableView和下面的操作视图
-(void)addTabeView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT-operateViewHeight) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = viewBackColor;
    
    [self.view addSubview:self.tableView];
    
    
    self.submitView = [KLSubmitView initView];
    
    self.submitView.frame = CGRectMake(0, SCREENH_HEIGHT-operateViewHeight, SCREEN_WIDTH, operateViewHeight);
    
    self.submitView.delagete =self;
    
    [self.view addSubview:self.submitView];
}

#pragma mark klSubmitViewDelegate
-(void)submitOrder{
    
    //提交订单
    self.scjPromptView.hidden = NO;
}

#pragma mark 设置navView
-(void)setNav{
    
    self.navigationItem.titleView = [[KLNavTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-80, 44) andTitle:NSLocalizedString(@"orderConfirmed", nil)];
    
}


#pragma mark tableView代理和数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] init];
    
    view.backgroundColor = viewBackColor;
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==0 ) {
        return 140;
    }
    return 100;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     __weak typeof(self)wself= self;
    
    if (indexPath.section == 0) {
        if (self.pickgoodStyle == 0) {
            KLSubmitZitiOrderTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"submitOrderZiti"];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLSubmitOrderInfoTableViewCell class]) owner:self options:nil] lastObject];
            }
            cell.block= ^(){
                //选择提货方式
                [wself choosePickGoodStyle];
            };
            return cell;
        }else{
            KLSubmitOrderInfoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"submitOrderPeisong"];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLSubmitOrderInfoTableViewCell class]) owner:self options:nil] firstObject];
            }
            cell.block= ^(){
                //选择提货方式
                [wself choosePickGoodStyle];
            };
            return cell;
        }
    }
    else{
        KLSubmitOrderGoodInfoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"submitOrderGoodCell"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLSubmitOrderGoodInfoTableViewCell class]) owner:self options:nil] firstObject];
        }
        return cell;
     }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.pickgoodStyle == 1) {//配送 去设置收货地址
        if (indexPath.section == 0) {
            KLAddressViewController *vc= [[KLAddressViewController alloc] init];
            [self.navigationController pushViewController:vc animated:NO];
        }
    }
}

#pragma mark 选择提货方式
-(void)choosePickGoodStyle{
    // 初始化
    
    UIAlertController *alertDialog = [UIAlertController alertControllerWithTitle:nil message:@"选择提货方式" preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 分别3个创建操作
    
    UIAlertAction *laterAction = [UIAlertAction actionWithTitle:@"自提" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        if (self.pickgoodStyle != 0) {
             self.pickgoodStyle = 0;
            [self.tableView reloadData];
        }
        
        
    }];
    
    UIAlertAction *neverAction = [UIAlertAction actionWithTitle:@"配送" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        if (self.pickgoodStyle != 1) {
            self.pickgoodStyle = 1;
            [self.tableView reloadData];
        }
        
    }];
    

    
    // 添加操作（顺序就是呈现的上下顺序）
    
    [alertDialog addAction:laterAction];
    
    [alertDialog addAction:neverAction];
    

    // 呈现警告视图
    
    [self presentViewController:alertDialog animated:YES completion:nil];
}


@end
