//
//  OneViewController.h
//  SliderTabbarDemo
//
//  Created by JJT on 16/8/3.
//  Copyright © 2016年 SJZ. All rights reserved.
//

#import <UIKit/UIKit.h>
//1 声明
typedef void (^oneBlock)(BOOL isHidden);

@interface OneViewController : UIViewController
//2 实现调用
@property (nonatomic, copy) oneBlock oneHiddenBlock;

@end
