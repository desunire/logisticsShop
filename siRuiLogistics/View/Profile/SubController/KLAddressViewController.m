//
//  KLAddressViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLAddressViewController.h"
#import "KLAddressListTableViewCell.h"
#import "KLEditAddressViewController.h"
@interface KLAddressViewController ()<UITableViewDelegate,UITableViewDataSource>
//操作按钮
@property(strong,nonatomic)UIButton *editBtn;

@property(strong,nonatomic)UITableView *tableView;

@end

@implementation KLAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self addTabeView];
}

#pragma mark 设置navView
-(void)setNav{
    
    self.navigationItem.titleView = [[KLNavTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-80, 44) andTitle:@"收货地址"];
    
    self.editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.editBtn setImage:[UIImage imageNamed:@"add_address"] forState:UIControlStateNormal];
    
    
    [self.editBtn addTarget:self action:@selector(editBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.editBtn.frame = CGRectMake(0, 0, 30, 30);
    
    
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc] initWithCustomView:self.editBtn];
    
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

-(void)editBtnClick:(UIButton *)btn{
    KLEditAddressViewController *vc =[[KLEditAddressViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
    
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
    
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KLAddressListTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"addressListCell"];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([KLAddressListTableViewCell class]) owner:self options:nil] firstObject];
    }
    
    cell.block = ^(addressListOperate type){
      
        if (type == defaultAddress) {
            NSLog(@"默认");
        }
        
        if (type == editAddress) {
            NSLog(@"编辑");
        }
        
        if (type == deleteAddress) {
            NSLog(@"删除");
        }
    };
    
    return cell;
    
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
}

@end
