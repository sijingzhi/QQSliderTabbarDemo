//
//  SJZTabBar.m
//  SliderTabbarDemo
//
//  Created by JJT on 16/8/3.
//  Copyright © 2016年 SJZ. All rights reserved.
//

#import "SJZTabBar.h"
#import "SJZTabBarButton.h"

@interface SJZTabBar ()

/**
 *  存放按钮的数组
 */
@property (nonatomic,strong) NSMutableArray *btnArray;

/**
 *  存放选中的按钮
 */
@property (nonatomic,strong)SJZTabBarButton *selectedBtn;

/**
 *  中间加号按钮
 */
@property (nonatomic,strong)UIButton *plusBtn;

@end

@implementation SJZTabBar

- (NSMutableArray *)btnArray
{
    if (_btnArray == nil) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

/**
 *  复写初始化方法
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor  = [UIColor clearColor];
        // 填充TabBar背景图片
        self.image = [UIImage imageNamed:@"tabbar_background_os7"];
        self.userInteractionEnabled = YES;
        
        // 创建中间加号按钮
        UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [self addSubview:plusBtn];
        [plusBtn addTarget:self action:@selector(plusBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        self.plusBtn = plusBtn;
    }
    return self;
}

- (void)setTabBarItem:(UITabBarItem *)tabBarItem
{
    _tabBarItem = tabBarItem;
    
    SJZTabBarButton *button = [SJZTabBarButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button];
    
    button.tabBarItem = tabBarItem;
    
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    [self.btnArray addObject:button];
    
    // 第一次进来将第一个按钮变为选中状态
    if (self.btnArray.count == 1) {
        [self buttonPressed:button];
    }
    
}


#pragma mark -- 按钮点击事件 --
- (void)buttonPressed:(SJZTabBarButton *)btn
{
    //1. 将原来的选中按钮变为普通状态
    _selectedBtn.selected = NO;
    //2. 将现在选中的按钮变为选中状态
    btn.selected = YES;
    //3. 将选中的按钮存放起来
    _selectedBtn = btn;
    
    NSInteger index = [self.btnArray indexOfObject:btn];
    
    if ([_delegate respondsToSelector:@selector(SJZTabBarSelectedItemIndex:)]) {
        [_delegate SJZTabBarSelectedItemIndex:index];
    }
    
    
}

- (void)plusBtnPressed:(UIButton *)btn
{
    
}


// 对子视图进行布局 （将要显示的时候会调用）
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置plusBtn的frame
    CGPoint center =  CGPointMake(CGRectGetWidth(self.frame) * 0.5, CGRectGetHeight(self.frame) * 0.5);
    CGFloat plusBtnW = self.plusBtn.currentBackgroundImage.size.width;
    CGFloat plusBtnH = self.plusBtn.currentBackgroundImage.size.height;
    self.plusBtn.frame = CGRectMake(0, 0, plusBtnW, plusBtnH);
    self.plusBtn.center = center;
    
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = CGRectGetWidth(self.frame)/(CGFloat)(self.btnArray.count+1);
    CGFloat btnH = CGRectGetHeight(self.frame);
    
    for (int i = 0; i < self.btnArray.count; i++) {
        SJZTabBarButton *btn = self.btnArray[i];
        btnX = btnW * i;
        if (i > 1) {
            btnX += btnW; // 当下标大于1的起始X每次增加一个按钮宽度
        }
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
}

@end
