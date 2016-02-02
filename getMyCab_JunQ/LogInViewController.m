//
//  LogInViewController.m
//  getMyCab_JunQ
//
//  Created by 钱骏 on 16/2/1.
//  Copyright © 2016年 钱骏. All rights reserved.
//

#import "LogInViewController.h"
#import "CustomerRegisterViewController.h"
#import "DriverRegisterViewController.h"

@interface LogInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *password_text;
@property (weak, nonatomic) IBOutlet UITextField *UserId_text;
- (IBAction)login_but:(id)sender;
- (IBAction)singup_but:(id)sender;

@end

@implementation LogInViewController
@synthesize tagFlag;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(tagFlag == 0){
        self.title = @"Hello,customer login";
    }
    else if(tagFlag == 1){
        self.title = @"Hello, driver login";
    }
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

- (IBAction)login_but:(id)sender {
    
  
}

- (IBAction)singup_but:(id)sender {
    if(tagFlag == 0){
        
        CustomerRegisterViewController *cusConnect = [self.storyboard instantiateViewControllerWithIdentifier:@"CustomerRegisterViewController"];
        [self.navigationController pushViewController:cusConnect animated:YES];
        
    }
    else if(tagFlag == 1){
        DriverRegisterViewController *driConnect = [self.storyboard instantiateViewControllerWithIdentifier:@"DriverRegisterViewController"];
        [self.navigationController pushViewController:driConnect animated:YES];
    }
    
}
@end
