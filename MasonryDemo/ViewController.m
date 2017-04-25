//
//  ViewController.m
//  MasonryDemo
//
//  Created by PFZC on 2017/4/25.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    UIView *blackView = [UIView new];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    
    // 给黑色view添加约束
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // 添加左、上边距约束（左、上约束都是20）
        make.left.top.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        
    }];
    
    // 初始化灰色view
    UIView *grayView = [UIView new];
    grayView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:grayView];
    
    // 给灰色view添加约束
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //距离下边距20
        make.bottom.right.mas_equalTo(-20);
        //高度与黑色view相同
        make.height.equalTo(blackView);
        //距离黑色view底部20
        make.top.equalTo(blackView.mas_bottom).offset(20);
        //左边距是view的中心点
        make.left.equalTo(weakSelf.view.mas_centerX).offset(0);
    }];
    UIButton *Btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [Btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Btn setTitle:@"下一步" forState:UIControlStateNormal];
    [Btn setBackgroundColor:[UIColor yellowColor]];
    [Btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Btn];
    [Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(blackView.mas_bottom).offset(20);
        make.left.mas_equalTo(20);
        //设置btn大小固定
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];

    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)btnClick
{

    SecondViewController *controller = [[SecondViewController alloc] init];
    controller.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
