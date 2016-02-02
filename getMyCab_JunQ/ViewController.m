//
//  ViewController.m
//  getMyCab_JunQ
//
//  Created by 钱骏 on 16/2/1.
//  Copyright © 2016年 钱骏. All rights reserved.
//

#import "ViewController.h"
#import "LogInViewController.h"

@interface ViewController ()
- (IBAction)login_but:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login_but:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    LogInViewController *logConnect = [self.storyboard instantiateViewControllerWithIdentifier:@"LogInViewController"];
    [self.navigationController pushViewController:logConnect animated:YES];
    logConnect.tagFlag = button.tag;
}
@end
