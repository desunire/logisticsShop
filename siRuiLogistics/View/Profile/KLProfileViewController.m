//
//  KLProfileViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/13.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLProfileViewController.h"
#import "KLProfileInfoTableViewCell.h"
#import "KLProfileOperateOrderTableViewCell.h"
#import "UpPicDownTextBtn.h"
#import "KLCustomManagerInfoTableViewCell.h"
#import "KLProfileItemTableViewCell.h"
#import "KLOrderViewController.h"
#import "KLLoadViewController.h"

//个人信息cell
static NSString *profileInfoCell = @"profileInfoCell";

//订单信息cell
static NSString *orderInfoCell = @"orderInfoCell";

//客户经理信息
static NSString *customManagerCell  = @"customManagerCell";
@interface KLProfileViewController ()<UITableViewDelegate,UITableViewDataSource,SCJPromptViewDelegate>
/**
 //当前页面偏移量 默认是0
 */
@property(assign,nonatomic)CGFloat offY;


/**
 //个人中心具体的用户操作如我的收藏，我的售后等
 */
@property(strong,nonatomic)NSArray *profileItemArr;
//退出提示框
@property(strong,nonatomic)SCJPromptView *scjPromptView;

//售后提示框
@property(strong,nonatomic)SCJPromptView *afterSalePromptView;

//当前提示框的类型 0-退出登录 1-拨打售后电话
@property(assign,nonatomic)int promptType;
@end

@implementation KLProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor =[UIColor cz_randomColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.indexSearchTopView.hidden = YES;
     [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionInitial context:nil];
    self.offY = 0.0;
    NSString *path  = [[NSBundle mainBundle] pathForResource:@"ProfileItem.plist" ofType:nil];
    self.profileItemArr = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"%@,,%@",path,self.profileItemArr);
    [self registerCell];
    [self addPromptView];
    [self addAfterSaleView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

#pragma mark 设置售后提示框
-(void)addAfterSaleView{
    
    self.afterSalePromptView=[[SCJPromptView alloc]initWithFrame:self.view.frame];
    self.afterSalePromptView.delegate=self;
    [ self.afterSalePromptView setViewWithTitle:nil andMessge:@"请联系:你大爷133546789"
     andCancelTitle:@"取消" andSureTitle:@"确认"];
    self.afterSalePromptView.hidden = YES;
    [self.tabBarController.view addSubview: self.afterSalePromptView];
}


#pragma mark 调往订单列表页面
-(void)gotoOrderListView:(int)index;{
    
    KLOrderViewController *vc = [[KLOrderViewController alloc] init];
    vc.nowOrderState = index;
    [self.navigationController pushViewController:vc
                                         animated:NO];
    
}

#pragma mark 设置退出提示框
-(void)addPromptView{
    self.scjPromptView=[[SCJPromptView alloc]initWithFrame:self.view.frame];
    self.scjPromptView.delegate=self;
    [self.scjPromptView setViewWithTitle:nil andMessge:@"确定退出登录?" andCancelTitle:@"取消" andSureTitle:@"确认"];
    self.scjPromptView.hidden = YES;
    [self.tabBarController.view addSubview:self.scjPromptView];
}
#pragma mark SCJPromptViewDelegate
-(void)chooseItem:(NSInteger)item{
    if (item==0) {
        NSLog(@"取消");
    }
    else if(item==1){
        //判断是1打售后电脑 还是 退出登录0
        if (self.promptType == 0) {
            KLLoadViewController *vc = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass( [KLLoadViewController class]) owner:self options:nil] firstObject];
            [UIApplication sharedApplication].keyWindow.rootViewController = vc;
        }
        
    }
    self.afterSalePromptView.hidden = YES;
    self.scjPromptView.hidden = YES;
}

#pragma mark 注册cell
-(void)registerCell{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[KLProfileInfoTableViewCell class] forCellReuseIdentifier:profileInfoCell];
     [self.tableView registerClass:[KLProfileOperateOrderTableViewCell class] forCellReuseIdentifier:orderInfoCell];
    [self.tableView registerClass:[KLCustomManagerInfoTableViewCell class] forCellReuseIdentifier:customManagerCell];
}


#pragma mark UITableViewDelegate,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  2;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return  self.profileItemArr.count;
    }
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    __weak typeof(self)Wself= self;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            KLProfileInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:profileInfoCell forIndexPath:indexPath] ;
            if (cell == nil) {
                cell = [[KLProfileInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:profileInfoCell];
            }
            [cell setCellWithModel:nil];
            return cell;
        }else if(indexPath.row == 1){
            KLProfileOperateOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:orderInfoCell forIndexPath:indexPath] ;
            if (cell == nil) {
                cell = [[KLProfileOperateOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderInfoCell];
            }
            [cell setCellWithOperateItem:nil];
            cell.block= ^(operateType type){
                if (type == waitSureOrder) {
                    [Wself gotoOrderListView:1];
                }
                
                if (type == waitsendOrder) {
                    [Wself gotoOrderListView:2];
                }
                
                
                if (type == afterSaleOrder) {
                    Wself.promptType = 1;
                    Wself.afterSalePromptView.hidden = NO;
                }
                
                if (type == allOrder) {
                    [Wself gotoOrderListView:0];
                }
                
                
            };
            return cell;
        }else{
            KLCustomManagerInfoTableViewCell *cell =
            //[tableView dequeueReusableCellWithIdentifier:customManagerCell forIndexPath:indexPath] ;
            [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLCustomManagerInfoTableViewCell class]) owner:self options:nil] firstObject];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLCustomManagerInfoTableViewCell class]) owner:self options:nil] firstObject];
            }
            return cell;
        }
       
    }
    else{
        KLProfileItemTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLProfileItemTableViewCell class]) owner:self options:nil] firstObject];
        
        NSDictionary *dic =[self.profileItemArr objectAtIndex:indexPath.row];
        
        [cell setCellWithDic:dic];
        
        return cell;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        //注销账户单独处理
        if (indexPath.row == self.profileItemArr.count-1) {
            self.promptType = 0;
            self.scjPromptView.hidden = NO;
        }else{
            NSDictionary *dic = [self.profileItemArr objectAtIndex:indexPath.row];
            if ([dic jsonString:@"view"]) {
                [DCURLRouter pushURLString:[dic jsonString:@"view"] animated:NO];
                NSLog(@"%@",[dic jsonString:@"view"]);
            }
        }
       
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            //计算订单视图的高度
            CGFloat width = SCREEN_WIDTH/4;
            CGFloat picWidth = width-leftMargin-rightMargin;
            CGFloat height = picWidth+topMargin+belowMargin+titleHeight+leftMargin;
            NSLog(@"%f",height);
            return height;
        }
        if (indexPath.row == 2) {
            return 80;//客户经理cell的高度
        }
        if (indexPath.row == 0) {
            return 250;
        }
    }
    return 50;
}
#pragma mark 监听tablView的滑动距离
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    //NSLog(@"%.2f>>%.2f",self.tableView.contentOffset.y,self.tableView.contentInset.top);
    //if (self.tableView.contentOffset.y>0) {
      //  CGFloat alpha = self.tableView.contentOffset.y;
//        self.test.alpha =(alpha < 1.0 ?alpha:1.0);
       // NSLog(@"%.2f",alpha);
  //  }
    self.offY = 0 - self.tableView.contentOffset.y;
    
   
    
//    [self.tableView reloadData];
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (self.tableView.contentOffset.y<0) {
        self.tableView.contentOffset=CGPointMake(0, -10);
    }
}

#pragma mark  内存管理
-(void)dealloc{
     [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}

@end
