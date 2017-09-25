//
//  KLBigImgShowViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/25.
//  Copyright © 2017年 desunire. All rights reserved.
//


#define TAG 99

#import "KLBigImgShowViewController.h"
#import "KLBigImgShowCollectionViewCell.h"
@interface KLBigImgShowViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation KLBigImgShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView.showsHorizontalScrollIndicator = false;
    self.collectionView.contentOffset = CGPointMake(SCREEN_WIDTH*2, 0);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KLBigImgShowCollectionViewCell *cell = (KLBigImgShowCollectionViewCell  *)[collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    [self configureCell:cell withIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(KLBigImgShowCollectionViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    UIView  *subview = [cell.contentView viewWithTag:TAG];
    [subview removeFromSuperview];
    
    switch (indexPath.section) {
        case 0:
            cell.imageView.image =  [UIImage imageNamed:@"i1"];
            cell.mainLabel.text = @"1/2";
            break;
        case 1:
            cell.imageView.image =  [UIImage imageNamed:@"i2"];
            cell.mainLabel.text = @"2/2";
            break;
        default:
            break;
    }
}

@end
