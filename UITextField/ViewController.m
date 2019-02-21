//
//  ViewController.m
//  UITextField
//
//  Created by Mac on 2019/2/21.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
    textField.delegate = self;
    textField.secureTextEntry = NO;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.layer.borderWidth = 0.5f;
    textField.layer.borderColor = [UIColor blackColor].CGColor;
    textField.placeholder = @"请输入";
    //添加UIControlEventEditingChanged点击事件
    [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:textField];
}

#pragma mark - 该方法不是协议方法、是在textField上添加的点击事件
-(void)textFieldDidChange:(UITextField *)textField{
    
    //过滤空格
    NSString *tem = [[textField.text componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] componentsJoinedByString:@""];
    textField.text = tem;
}


@end
