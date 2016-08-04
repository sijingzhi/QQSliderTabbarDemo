//
//  RootTabBarController.h
//  TabBarFour
//
//  Created by client on 15/10/24.
//  Copyright © 2015年 SJZ. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SJZCustomButton.h"

#import "ICSDrawerController.h"

@interface RootTabBarController : UITabBarController<ICSDrawerControllerChild, ICSDrawerControllerPresenting>


@property(nonatomic, weak) ICSDrawerController *drawer;
@property(nonatomic, strong) SJZCustomButton * button;

@end
