//
//  NavigationView.m
//  FHB
//
//  Created by JJT on 16/5/3.
//  Copyright © 2016年 SJZ. All rights reserved.
//

#import "NavigationView.h"
#import "PrefixHeader.pch"

@implementation NavigationView

//类方法
+(NavigationView *)sharedNavigationViewWithTitle:(NSString *)title
{
    NavigationView * nav = [[NavigationView alloc]initWithFrame:CGRectMake(0, 0, W_IDTH, 64)];
    nav.backgroundColor = RGB(27, 183, 184);
    nav.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, W_IDTH, 44)];
    nav.titleLabel.text = title;
    nav.titleLabel.textAlignment = NSTextAlignmentCenter;
    nav.titleLabel.textColor = [UIColor whiteColor];
    nav.titleLabel.font = [UIFont systemFontOfSize:16];
    [nav addSubview:nav.titleLabel];
    
    nav.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nav.rightBtn.frame = CGRectMake(W_IDTH-40, 20, 40, 44);
    [nav.rightBtn setTitleColor:RGB(85, 85, 85) forState:UIControlStateNormal];
    nav.rightBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [nav addSubview:nav.rightBtn];
    
    nav.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nav.leftBtn.frame = CGRectMake(0, 20, 40, 44);
    [nav.leftBtn setTitleColor:RGB(85, 85, 85) forState:UIControlStateNormal];
    nav.leftBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [nav addSubview:nav.leftBtn];
    
    return nav;
}

+ (UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}




@end
