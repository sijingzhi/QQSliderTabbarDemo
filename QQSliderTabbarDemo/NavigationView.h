//
//  NavigationView.h
//  FHB
//
//  Created by JJT on 16/5/3.
//  Copyright © 2016年 SJZ. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NavigationView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;

//类方法
+ (NavigationView *)sharedNavigationViewWithTitle:(NSString *)title;

+ (UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size;

@end
