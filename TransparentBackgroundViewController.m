//
//  TransparentBackgroundViewController.m
//  
//
//  Created by Yunis on 15/10/16.
//
//

#import "TransparentBackgroundViewController.h"

@interface TransparentBackgroundViewController ()
@property(nonatomic,strong)UIButton *btr ;
@end

@implementation TransparentBackgroundViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    self.view.backgroundColor = [UIColor colorWithWhite:.1 alpha:.3];
    [self.view addSubview:self.btr];

    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //布局
    [UIView animateWithDuration:.35 animations:^{
        self.btr.center = self.view.center;
    }];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //监听事件

}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:.35 animations:^{
        self.btr.center = CGPointMake(self.view.frame.size.width/2.f, self.view.frame.size.height);
    }];
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
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - getters and setters
//初始化页面
- (UIButton *)btr{
    if (_btr == nil) {
        _btr = [UIButton buttonWithType:0];
        [_btr addTarget:self action:@selector(presentTransparentBackgroundView) forControlEvents:UIControlEventTouchUpInside];
        _btr.frame = CGRectMake(0, 0, 100, 100);
        _btr.backgroundColor = [UIColor redColor];
    }
    
    return _btr;
}

@end
