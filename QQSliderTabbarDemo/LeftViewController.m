//
//  LeftViewController.m
//  FHB
//
//  Created by JJT on 16/5/4.
//  Copyright © 2016年 SJZ. All rights reserved.
//

#import "LeftViewController.h"

#define W_IDTH [UIScreen mainScreen].bounds.size.width
#define H_EIGHT [UIScreen mainScreen].bounds.size.height

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>



@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, (H_EIGHT - 176)/2, 4*W_IDTH/5, 176) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:tableView];
        
        
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
  
    cell.textLabel.text = [NSString stringWithFormat:@"%@%ld",@"内容",(long)indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    UIImage *iconImage = [[UIImage alloc]init];
  
    iconImage = [UIImage imageNamed:@"icon"];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    CGSize itemSize = CGSizeMake(20, 20);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO,0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [iconImage drawInRect:imageRect];
    
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row ==0) {
        
    }
    
    if (indexPath.row ==1) {

      
       
    }
    if (indexPath.row == 2) {
        
        
    }
    
    
    if (indexPath.row == 3) {
        
       
    }


}
- (void)secutryBtnPress{

    

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
