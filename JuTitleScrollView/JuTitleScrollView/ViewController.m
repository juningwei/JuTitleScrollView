//
//  ViewController.m
//  JuTitleScrollView
//
//  Created by 鞠凝玮 on 16/3/9.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "ViewController.h"
#import "JuTitleScrollView.h"

#define ScreenWidth [[UIScreen mainScreen]bounds].size.width
@interface ViewController ()<JuTitleScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.view.userInteractionEnabled = YES;
    
    JuTitleScrollView *juTitleScrollView = [[JuTitleScrollView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, 45) titleArray:@[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日"]];
    juTitleScrollView.backgroundColor = [UIColor purpleColor];
    juTitleScrollView.delegate = self;
    [self.view addSubview:juTitleScrollView];
}

- (void)juTitleScrollViewSelected:(NSInteger)index{
    NSLog(@"index===%zd",index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
