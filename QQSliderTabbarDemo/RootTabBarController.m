//
//  RootTabBarController.m
//  TabBarFour
//
//  Created by client on 15/10/24.
//  Copyright © 2015年 SJZ. All rights reserved.
//


#import "RootTabBarController.h"
#import "NavigationView.h"

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "PrefixHeader.pch"
#import "SJZCustomButton.h"

#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface RootTabBarController ()
{
    UIView * _viewCustomTabbar;
    NavigationView *nav;
}

@property (nonatomic, strong) NSMutableArray *arrayBtn;

@end

@implementation RootTabBarController


- (NSMutableArray *)arrayBtn
{
    if (!_arrayBtn) {
        _arrayBtn = [NSMutableArray array];
    }
    return _arrayBtn;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   [self createNav];
   [self createTabbarItem];
    self.tabBar.hidden = YES;
    [self createTabBar];
  
    nav = [NavigationView sharedNavigationViewWithTitle:@"首页"];
    [nav.leftBtn setImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
    nav.leftBtn.frame = CGRectMake(10, 25, 30, 30);
    nav.leftBtn.layer.cornerRadius =nav.leftBtn.frame.size.width/2.f;
    nav.leftBtn.layer.masksToBounds = YES;
    [nav.leftBtn addTarget:self action:@selector(sliderBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nav];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(HomeValueBtn:) name:@"one" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AcceptValueBtn:) name:@"two" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DeliveryValueBtn:) name:@"three" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(OrderTrackValueBtn:) name:@"four" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CompleteValueBtn:) name:@"five" object:nil];
    
    
}

//- (void)HomeValueBtn:(NSNotificationCenter*)sender{
//
//    nav.titleLabel.text = @"首页";
//
//}
//- (void)AcceptValueBtn:(NSNotificationCenter*)sender{
//    
//    nav.titleLabel.text = @"服务支付";
//    
//}
//
//- (void)DeliveryValueBtn:(NSNotificationCenter*)sender{
//
//    nav.titleLabel.text = @"发货";
//}
//
//- (void)OrderTrackValueBtn:(NSNotificationCenter*)sender{
//    
//    nav.titleLabel.text = @"订单追踪";
//}
//
//- (void)CompleteValueBtn:(NSNotificationCenter*)sender{
//    
//    nav.titleLabel.text = @"确认签收";
//}






/**
 *  添加视图控制器
 */
- (void)createTabbarItem{
    
    
    NSArray * arrayTitle = @[@"首页",@"揽收确认",@"线上发货",@"订单追踪",@"确认签收"];
    NSArray*unSeletedImages=@[@"tabbar_home",@"tabbar_lanshou",@"tabbar_fahuo_selected",@"tabbar_ordertrack",@"tabbar_complete"];
    NSArray *seletedImages=@[@"tabbar_home_selected",@"tabbar_lanshou_selected",@"tabbar_fahuo_selected",@"tabbar_ordertrack_selected",@"tabbar_complete_selected"];
    CGFloat offset = 5.0;
    for (int i = 0; i<self.tabBar.items.count; i++) {
        UITabBarItem *item = self.tabBar.items[i];
        item.tag=50+i;
        UIImage *unSelectedImage = [UIImage imageNamed:unSeletedImages[i]];
        unSelectedImage = [unSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarController.selectedIndex = 1;
        UIImage *seletedImage = [UIImage imageNamed:seletedImages[i]];
        seletedImage = [seletedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item = [item initWithTitle:arrayTitle[i] image:unSelectedImage selectedImage:seletedImage];
        item.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
    }
}
/**
 *  创建自定义TabBar
 */
- (void)createTabBar
{
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT - 68, WIDTH, 68)];
    [self.view addSubview:view];
    //    view.backgroundColor = [UIColor cyanColor];
    _viewCustomTabbar = view;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 68.5)];
        imageView.image = [UIImage imageNamed:@"tabbar_backImage"];

    
    [view addSubview:imageView];
    
    for (int i = 0; i < 5; i++) {
        CGFloat btnW = WIDTH / 5;
        
        self.button = [SJZCustomButton buttonWithType:UIButtonTypeCustom];
        self.button.tabBarItem = self.tabBar.items[i];
        self.button.frame = CGRectMake(btnW * i, 21, btnW-3, 49);
        
        if (i == 2) {
            self.button.frame = CGRectMake(btnW * i+2, 10, btnW-3, 87);
        }
        
        if (i ==0) {
            self.button.selected = YES;
            self.selectedIndex = i;
        }

        [view addSubview:self.button];
        self.button.tag = 1000+i;
        [self.button addTarget:self action:@selector(buttonPressedBtnBtn:) forControlEvents:UIControlEventTouchDown];
        [self.arrayBtn addObject:self.button];
    }
    

    
    
}

- (void)createNav{
    
    OneViewController * home = [OneViewController new];
    home.tabBarItem.badgeValue = @"2";
    TwoViewController * confirm = [TwoViewController new];
    ThreeViewController * order = [ThreeViewController new];
    FourViewController * sign = [FourViewController new];
    FiveViewController *five = [FiveViewController new];
    self.viewControllers =@[home,confirm,order,sign,five];
    
    
    home.oneHiddenBlock = ^(BOOL isHidden){
        //4 isHidden这个值来自第3步
        //获取值后，做相应的处理
        _viewCustomTabbar.hidden = isHidden;
    };
    
    
}



#pragma mark -- 按钮点击事件 --
- (void)buttonPressedBtnBtn:(SJZCustomButton *)btn
{
    for (SJZCustomButton * button in self.arrayBtn) {
        
        button.selected = NO;
    }
    btn.selected = YES;
    self.selectedIndex = btn.tag - 1000;
    NSLog(@"点击tag:%ld",(long)btn.tag);
    
    switch (btn.tag ) {
        case 1000:
            nav.titleLabel.text = @"首页";
            break;
        case 1001:
            nav.titleLabel.text = @"揽收确认";
            break;
        case 1002:
            nav.titleLabel.text = @"发货";
            break;
        case 1003:
            nav.titleLabel.text = @"订单追踪";
            break;
        case 1004:
            nav.titleLabel.text = @"签收确认";
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Configuring the view’s layout behavior

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)sliderBtnPress:(UIButton *)btn{
    
    [self.drawer open];
}

- (void)messageBtnPress{
    
    
}




@end
