//
//  SJZBageButton.m
//  SliderTabbarDemo
//
//  Created by JJT on 16/8/3.
//  Copyright © 2016年 SJZ. All rights reserved.
//

#import "SJZBageButton.h"

@implementation SJZBageButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        [self setBackgroundImage:[self OriginImage:[UIImage imageNamed:@"round_red"] scaleToSize:CGSizeMake(15, 15)] forState:UIControlStateNormal];
        
     
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    if (badgeValue.length == 0 || badgeValue == nil) {
        self.hidden = YES;
    }else {
        self.hidden = NO;
        
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        CGRect frame  = self.frame;
        frame.size.width = self.currentBackgroundImage.size.width;
        frame.size.height = self.currentBackgroundImage.size.height;
        
        // 根据内容计算宽度
        CGSize size = [badgeValue sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        frame.size.width = (size.width + 10) > frame.size.width?(size.width + 10):frame.size.width;
        
        self.frame = frame;
        
    }
}


@end
