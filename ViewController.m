//
//  ViewController.m
//  TransparentBackground
//
//  Created by Yunis on 15/10/16.
//  Copyright (c) 2015年 yunis. All rights reserved.
//

#import "ViewController.h"
#import "TransparentBackgroundViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)UIButton *btr ;
@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.btr];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //布局
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //监听事件
}
- (void)dealloc
{
    
}
#pragma mark - Public Method
//外部方法

#pragma mark - Private Method
//本类方法

#pragma mark - Delegate
//代理方法

#pragma mark - Event Response
//点击响应事件
- (void)presentTransparentBackgroundView{
    TransparentBackgroundViewController *test = [[TransparentBackgroundViewController alloc] init];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
        
        test.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        test.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController: test animated:YES completion:nil];
        
    }else{
        
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [self presentViewController:test animated:NO completion:^{
            [test dismissViewControllerAnimated:NO completion:^{
                appDelegate.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
                [self presentViewController:test animated:NO completion:nil];
                appDelegate.window.rootViewController.modalPresentationStyle = UIModalPresentationFullScreen;
                
            }];
        }];
        
    }
}


#pragma mark - getters and setters
//初始化页面

- (UIImageView *)bgImageView{
    if (_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        _bgImageView.image = [UIImage imageNamed:@"bg"];
    }
    
    return _bgImageView;
}
- (UIButton *)btr{
    if (_btr == nil) {
        _btr = [UIButton buttonWithType:0];
        [_btr addTarget:self action:@selector(presentTransparentBackgroundView) forControlEvents:UIControlEventTouchUpInside];
        _btr.frame = CGRectMake(0, 0, 100, 100);
        _btr.center = self.view.center;
        _btr.backgroundColor = [UIColor redColor];
    }
    
    return _btr;
}
@end
