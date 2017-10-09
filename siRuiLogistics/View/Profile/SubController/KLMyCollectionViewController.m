//
//  KLMyCollectionViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLMyCollectionViewController.h"
#import "KLCollectionTableViewCell.h"
#import "KLAllChooseDelView.h"
static float delViewHeight = 60;

@interface KLMyCollectionViewController ()
<UITableViewDelegate,UITableViewDataSource,SCJPromptViewDelegate,KLAllChooseDelViewDelegate,KLEmptyViewDelegate>
//提示框
@property(strong,nonatomic)SCJPromptView *scjPromptView;

@property(strong,nonatomic)UITableView *tableView;

//全选删除操作视图
@property(strong,nonatomic)KLAllChooseDelView *delView;

//操作按钮
@property(strong,nonatomic)UIButton *editBtn;

//当前控制器状态 true--编辑删除状态 false--正常状态
@property(assign,nonatomic)BOOL operateState;


/**
 空视图
 */
@property(strong,nonatomic)KLEmptyView *emptyView;

@end

@implementation KLMyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self getCollectionList];
}
#pragma mark 获取我的收藏列表
-(void)getCollectionList{
    if (true) {
        [self addPromptView];
        [self addTabeView];
        [self addDelView];
    }else{
        //添加空视图
        [self setEmptyView:self.emptyView];
    }
}

#pragma mark 设置空视图（搜索结果为空）
-(void)setEmptyView:(KLEmptyView *)emptyView{
    emptyView= [[KLEmptyView alloc] initWithFrame:self.view.frame andBackImage:@"noAttention" andMessage:@""];
    emptyView.delegate = self;
    [self.view addSubview:emptyView];
}

-(void)clickView{

}
#pragma mark 设置navView
-(void)setNav{
    
     self.navigationItem.titleView = [[KLNavTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-80, 44) andTitle:@"我的收藏"];
    
    self.editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [self.editBtn setTitleColor:mainTitleColor forState:UIControlStateNormal];
    
    [self.editBtn addTarget:self action:@selector(editBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.editBtn.frame = CGRectMake(0, 0, 40, 30);
    
    self.operateState = false;//初始化状态为正常状态
    
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc] initWithCustomView:self.editBtn];
    
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

-(void)editBtnClick:(UIButton *)btn{
    
    self.operateState = ! self.operateState;
    
    if (self.operateState) {
         self.delView.hidden = NO;
        [self.editBtn setTitle:@"完成" forState:UIControlStateNormal];
        [self.editBtn setTitleColor:DefaultBackColor forState:UIControlStateNormal];
        self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT-delViewHeight);
    }
    else{
        self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT);
        self.delView.hidden = YES;
        [self.editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [self.editBtn setTitleColor:mainTitleColor forState:UIControlStateNormal];
    }
    
    [self.tableView reloadData];
    
}

#pragma mark 设置下面删除的操作框
-(void)addDelView{
    
    self.delView = [KLAllChooseDelView initView];
    self.delView.nowState = false;//初始化不是全选状态
    self.delView.frame = CGRectMake(0, SCREENH_HEIGHT-delViewHeight, SCREEN_WIDTH, delViewHeight);
    self.delView.delegate = self;
    self.delView.hidden = YES;
    [self.view addSubview:self.delView];
}

#pragma mark KLAllChooseDelViewDelegate 删除视图的代理方法
-(void)delData{
    
    self.scjPromptView.hidden = NO;
}

-(void)changeState:(BOOL)isAllChoose{
    
    
}

#pragma mark 设置提示框
-(void)addPromptView{
    self.scjPromptView=[[SCJPromptView alloc]initWithFrame:self.view.frame];
    self.scjPromptView.delegate=self;
    [self.scjPromptView setViewWithTitle:nil andMessge:@"确定删除?" andCancelTitle:@"取消" andSureTitle:@"确认"];
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
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT) style:UITableViewStylePlain];
    
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
    
    return 10;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (self.operateState) {
        KLCollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionDelCell"];
        
        if (cell ==nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLCollectionTableViewCell class]) owner:self options:nil] lastObject];
        }
        
        return cell;
    }
    else{
        KLCollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionNormalCell"];
        
        if (cell ==nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLCollectionTableViewCell class]) owner:self options:nil] firstObject];
        }
        
        return cell;
    }
    
    
}


#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] init];
    
    view.backgroundColor = viewBackColor;
    
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //查看商品详情
    KLGoodBaseViewController *vc= [[KLGoodBaseViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}

@end
