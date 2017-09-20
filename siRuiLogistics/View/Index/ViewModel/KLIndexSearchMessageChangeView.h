//
//  KLIndexSearchMessageChangeView.h
//  siRuiLogistics
//
//  Created by desunire on 2017/9/19.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

//当前视图的状态
typedef enum : NSUInteger {
    ChooseLanguageState,
    NormalState,
    clickMessageState,
    clickSearchState
} KLIndexSearchMessageChangeViewState;

@protocol KLIndexSearchMessageChangeViewDelegate <NSObject>

@optional

/**
 改变语言
 @param senderBtn 点击按钮
 */
-(void)changeLangWithBtn:(UIButton *)senderBtn;


/**
 去消息页面
 @param senderBtn 消息按钮
 */
-(void)gotoMessageViewByBtn:(UIButton *)senderBtn;

/**
 去搜索页面
 @param senderBar 消息按钮
 */
-(void)gotoSearchView:(UISearchBar *)senderBar;


@end

@interface KLIndexSearchMessageChangeView : UIView


/**
 绘制视图通过界面
 */
+(instancetype)initView;

@property(weak,nonatomic)id<KLIndexSearchMessageChangeViewDelegate>delegate;
@property (strong, nonatomic) IBOutletCollection(UISearchBar) NSArray *searchView;

@property (weak, nonatomic) IBOutlet UIButton *languageBtn;
- (IBAction)changeLanguage:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *upDownImageView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *messageBtn;

- (IBAction)goMessage:(id)sender;

@end
