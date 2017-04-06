//
//  YZMainViewController.m
//  直播测试
//
//  Created by 董晓萌 on 17/3/23.
//  Copyright © 2017年 wyzc. All rights reserved.
//

#import "YZMainViewController.h"
#import "ViewController.h"
//#import "YZViewController.h"
@interface YZMainViewController ()

@end

@implementation YZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)CaiJi:(id)sender {


}
- (IBAction)LieBiao:(id)sender {

    ViewController * liebiao = [[ViewController alloc]init];
    [self.navigationController pushViewController:liebiao animated:YES];
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
