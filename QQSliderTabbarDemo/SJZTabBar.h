//
//  SJZTabBar.h
//  SliderTabbarDemo
//
//  Created by JJT on 16/8/3.
//  Copyright © 2016年 SJZ. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol SJZTabBarDelegate <NSObject>

/**
 *  选中了第几个按钮
 *
 *  @param index 按钮的index
 */
- (void)SJZTabBarSelectedItemIndex:(NSInteger)index;

@end


@interface SJZTabBar : UIImageView

@property (nonatomic,strong)  UITabBarItem *tabBarItem;

@property (nonatomic,weak) id <SJZTabBarDelegate> delegate;








@end
