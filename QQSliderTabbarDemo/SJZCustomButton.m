//
//  SJZCustomButton.m
//  SliderTabbarDemo
//
//  Created by JJT on 16/8/3.
//  Copyright © 2016年 SJZ. All rights reserved.
//
#import "SJZCustomButton.h"
#import "SJZBageButton.h"
#import "PrefixHeader.pch"

// 0~1.0
#define SJZTabBarButtonRatio 0.6


@interface SJZCustomButton ()

/**
 *  角标按钮
 */
@property (nonatomic,strong) SJZBageButton *badgeBtn;

@end

@implementation SJZCustomButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font =[UIFont systemFontOfSize:12];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:RGB(27, 183, 184) forState:UIControlStateSelected];
        // 255 130 4
        // 创建一个BadgeButton
        SJZBageButton *badgeBtn = [SJZBageButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:badgeBtn];
        self.badgeBtn = badgeBtn;
        self.badgeBtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleBottomMargin;
    }
    return self;
}

- (void)setTabBarItem:(UITabBarItem *)tabBarItem
{
    _tabBarItem = tabBarItem;
    
    
    // KVO
    // 添加观察者
    [_tabBarItem addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    
    [self setTitle:tabBarItem.title forState:UIControlStateNormal];
    [self setTitle:tabBarItem.title forState:UIControlStateSelected];
    [self setImage:tabBarItem.image forState:UIControlStateNormal];
    [self setImage:tabBarItem.selectedImage forState:UIControlStateSelected];
    
    // 第一次是值已经改变了才添加的观察者，所以需要手动调用一次
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.badgeBtn.badgeValue = _tabBarItem.badgeValue;
    
    CGRect rect = self.badgeBtn.frame;
    rect.origin.x = CGRectGetWidth(self.frame) - CGRectGetWidth(self.badgeBtn.frame);
    self.badgeBtn.frame = rect;
    
}

- (void)dealloc
{
    // 移除观察者
    [_tabBarItem removeObserver:self forKeyPath:@"badgeValue" context:nil];
}


/**
 *  让高亮状态什么也不做，不变颜色或者title
 */
- (void)setHighlighted:(BOOL)highlighted
{
    
}


// 改写图片的Rect
- (CGRect)imageRectForContentRect:(CGRect)contentRect // button的frame
{
    return CGRectMake(0, 0, CGRectGetWidth(contentRect), CGRectGetHeight(contentRect) * SJZTabBarButtonRatio);
}

// 改写文字的Rect
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, CGRectGetHeight(contentRect) * SJZTabBarButtonRatio, CGRectGetWidth(contentRect), CGRectGetHeight(contentRect) * (1-SJZTabBarButtonRatio));
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
}
@end

