//
//  KLMessageCenterViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/25.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLMessageCenterViewController.h"
#import "KLMessageStateView.h"
#import "KLMessageListTableViewCell.h"


static float stateViewHeight = 70;

static NSString *messageListCell=  @"messageListCell";

@interface KLMessageCenterViewController ()<UITableViewDelegate,UITableViewDataSource,SCJPromptViewDelegate>

@property(strong,nonatomic)KLMessageStateView *stateView;

//提示框
@property(strong,nonatomic)SCJPromptView *scjPromptView;

@property(strong,nonatomic)UITableView *tableView;

@end

@implementation KLMessageCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [[KLNavTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-80, 44) andTitle:@"消息中心"];
    [self addButtomView];
    [self addPromptView];
    [self addTabeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 设置界面UI
-(void)addButtomView{
    
    self.stateView = [KLMessageStateView initView];
    
    self.stateView.frame = CGRectMake(0, SCREENH_HEIGHT-stateViewHeight, SCREEN_WIDTH, stateViewHeight);
    
    //初始化选择状态
    self.stateView.isAllChoose = false;
    
    __weak typeof(self)wSelf = self;
    
    self.stateView.block = ^(BOOL flag){
      
        if (flag) {
            wSelf.scjPromptView.hidden = NO;
            NSLog(@"选中了");
        }else{
            NSLog(@"no");
        }
        
    };
    
    [self.view addSubview:self.stateView];
}


#pragma mark 设置提示框
-(void)addPromptView{
    self.scjPromptView=[[SCJPromptView alloc]initWithFrame:self.view.frame];
    self.scjPromptView.delegate=self;
    [self.scjPromptView setViewWithTitle:nil andMessge:@"全部设为已读?" andCancelTitle:@"取消" andSureTitle:@"确认"];
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
#pragma mark 添加tableView
-(void)addTabeView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREENH_HEIGHT-stateViewHeight-64) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = viewBackColor;
    
    [self.view addSubview:self.tableView];
    
}


#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KLMessageListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:messageListCell];
    
    if (cell ==nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLMessageListTableViewCell class]) owner:self options:nil] firstObject];
    }
    
    return cell;
    
}


#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
