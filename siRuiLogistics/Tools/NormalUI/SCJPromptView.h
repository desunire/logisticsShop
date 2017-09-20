//
//  SCJPromptView.h
//  phoenix
//
//  Created by mac on 16/11/3.
//  Copyright © 2016年 desunire. All rights reserved.
//

#import <UIKit/UIKit.h>

#define leftDistance  80
#define backViewHeight 150
#define btnHeight 50

@protocol SCJPromptViewDelegate <NSObject>

@optional

//点击了第item个按钮
-(void)chooseItem:(NSInteger)item;

@end

@interface SCJPromptView : UIView


NS_ASSUME_NONNULL_BEGIN
///**
//   背景毛玻璃
// */
//@property(strong,nonatomic)UIVisualEffectView *effectView;


@property(weak,nonatomic)id<SCJPromptViewDelegate>delegate;


@property(assign,nonatomic)CGFloat height;//高度


/**
 背景毛玻璃1
 */
@property(strong,nonatomic)UIView *effectview;


/**
   提示框背景
 */
@property(strong,nonatomic)UIView *backView;



/**
   确定按钮
 */
@property(strong,nonatomic)UIButton *sureBtn;



/**
  取消按钮
 */
@property(strong,nonatomic)UIButton *cancelBtn;




/**
   提示标题
 */
@property(strong,nonatomic)UILabel *titleLabel;


/**
   具体提示信息
 */
@property(strong,nonatomic)UILabel *messageLabel;

NS_ASSUME_NONNULL_END

//绘制视图
-(void)setViewWithTitle:(nullable NSString *)title andMessge:(nullable NSString *)message andCancelTitle:(nullable NSString *)cancel andSureTitle:(nullable NSString *)sure;



@end
