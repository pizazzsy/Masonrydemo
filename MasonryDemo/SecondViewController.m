//
//  SecondViewController.m
//  MasonryDemo
//
//  Created by PFZC on 2017/4/25.
//  Copyright © 2017年 PFZC. All rights reserved.
//

#import "SecondViewController.h"
#import "Masonry.h"

@interface SecondViewController ()<UITextFieldDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [backBtn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:backBtn];
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(30);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
    UITextField *pwdTextField = [UITextField new];
    pwdTextField.backgroundColor = [UIColor blackColor];
    [self.view addSubview:pwdTextField];
    UITextField *twopwdTextField = [UITextField new];
    twopwdTextField.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:twopwdTextField];
    twopwdTextField.placeholder = @"请再次输入密码";
    twopwdTextField.layer.masksToBounds = YES;
    twopwdTextField.layer.cornerRadius = 5;
    
    [pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 40));
    }];
    
    [twopwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.center.equalTo(self.view);
        make.top.equalTo(pwdTextField.mas_bottom).with.offset(20);
        //        make.centerY.mas_equalTo(pwdTextField.mas_centerY);
        make.left.mas_equalTo(pwdTextField.mas_left);
        make.right.mas_equalTo(pwdTextField.mas_right);
        make.width.mas_equalTo(pwdTextField.mas_width);
        make.height.mas_equalTo(pwdTextField.mas_height);
    }];
    pwdTextField.delegate=self;
    twopwdTextField.delegate=self;
}
-(void)BtnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
   // 回收键盘,取消第一响应者
    [textField resignFirstResponder];
    return YES;
    
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
