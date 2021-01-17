//
//  ViewController.m
//  MVVMInOC
//
//  Created by huang on 2021/1/16.
//

#import "ViewController.h"
#import "ScoreInfo.h"
#import "PLCommand.h"
#import <SVProgressHUD.h>

@interface ViewController ()
@property(nonatomic)UIButton *btn;
@property(nonatomic)ScoreInfo *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [[ScoreInfo alloc] init];
    _btn = [[UIButton alloc] initWithFrame:self.view.bounds];
    _btn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_btn];
    [_btn setTitle:_viewModel.displayText forState:UIControlStateNormal];
    
    //双向绑定
    [self initCommand];
    [self initSubscribe];
    
}

- (void)initCommand{
    [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)initSubscribe{
    
    [self.viewModel.scoreCmd prepare:^{
        [SVProgressHUD show];
    } subscribeNext:^(NSError *error, id content) {
        if (error) {
            [SVProgressHUD showInfoWithStatus:@"更新失败"];
            NSLog(@"%@", error.userInfo);
        }else{
            [SVProgressHUD showInfoWithStatus:@"更新成功"];
        }
        [self.btn setTitle:self.viewModel.displayText forState:UIControlStateNormal];
    }];
}

-(void)btnClick{
    [self.viewModel.scoreCmd execute:@(2)];
}

@end
