//
//  OneViewController.m
//  SliderTabbarDemo
//
//  Created by JJT on 16/8/3.
//  Copyright © 2016年 SJZ. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController (){


    BOOL isHidden;
}

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    UIButton *button = [UIButton  buttonWithType:UIButtonTypeCustom];
    button.center = CGPointMake(self.view.center.x, self.view.center.y-25);
    button.backgroundColor = [UIColor purpleColor];
    [button setTitle:@"点击 隐藏tabbar" forState:UIControlStateNormal];
    [button setTitle:@"点击 显示tabbar" forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont systemFontOfSize:14.f];
    button.bounds = CGRectMake(0, 0, 150, 50);
    [button addTarget:self action:@selector(btnbtnbtnbtnbtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    

}


- (void)btnbtnbtnbtnbtn{
    
    isHidden =!isHidden;
    //3.如果使用这个block，基本格式，必写
    if (_oneHiddenBlock) {
        //传值出去，先有这个值，在之后的4里面才能用这个值
        self.oneHiddenBlock(isHidden);
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
