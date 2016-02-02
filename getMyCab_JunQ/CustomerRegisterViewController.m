//
//  CustomerRegisterViewController.m
//  getMyCab_JunQ
//
//  Created by 钱骏 on 16/2/1.
//  Copyright © 2016年 钱骏. All rights reserved.
//

#import "CustomerRegisterViewController.h"
#import "CustomerTableViewCell.h"
@interface CustomerRegisterViewController ()
{
    NSMutableArray *arrayForLabelText;
    NSMutableArray *arrayForUse;
}


@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation CustomerRegisterViewController


BOOL isNameValid = NO;
BOOL isEmailValid = NO;
BOOL isPasswordValid = NO;
BOOL isPhoneNumber = NO;
BOOL isPassWordCheckValid = NO;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrayForLabelText = [[NSMutableArray alloc]initWithObjects:@"Full Name",@"Email Address",@"Phone Number",@"Password",@"Confirm Password", nil];
    
    arrayForUse = [[NSMutableArray alloc]init];
    [_submit setEnabled:FALSE];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(void)clear{
    static NSString *cellIdentifier = @"CustomerTableViewCell";
    CustomerTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.labelText.text = @"";
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"CustomerTableViewCell";
    CustomerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.labelText.text = [arrayForLabelText objectAtIndex:indexPath.row];
    return cell;
}


//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;        // return NO to disallow editing.
//- (void)textFieldDidBeginEditing:(UITextField *)textField;           // became first responder
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
//- (void)textFieldDidEndEditing:(UITextField *)textField;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
//- (BOOL)textFieldShouldReturn:(UITextField *)textField;              // called when 'return' key pressed. return NO to ignore.




#pragma -mark delegate




- (IBAction)submit_but:(id)sender {
//    NSString *stringTem;
//    
//    for (int i = 0 ; i<arrayForLabelText.count; i++) {
//        CustomerTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
//        NSLog(@"~~~~~%@",cell.textField.text);
//        //string and previousCell only valid for the confiming the password.
//       // NSString *string = cell.textField.text;
//        
//        
////        CustomerTableViewCell *previousCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i-1 inSection:0]];
////        NSLog(@">>>>>>>%@",cell.textField.text);
//
//        if(i == 0){
//            if(cell.textField.text.length<10&&cell.textField.text.length>0){
//                isNameValid = YES;
//                NSLog(@"0%@",cell.textField.text);
//            }
//        }
//        
//        if(i==1){
//            if(cell.textField.text.length>0 && [cell.textField.text containsString:@"@"]){
//                isEmailValid = YES;
//                 NSLog(@"1%@",cell.textField.text);
//            }
//        }
//    
//        if(i == 2){
//            if(cell.textField.text.length == 10){
//                isPhoneNumber= YES;
//                 NSLog(@"2%@",cell.textField.text);
//            }
//            
//        }
//    
//        if(i == 3){
//          //  NSString *strTemp = string;
//            if(cell.textField.text.length<10 && cell.textField.text.length>5){
//               // NSString *tempStr;
//                stringTem = cell.textField.text;
//                isPasswordValid = YES;
//                 NSLog(@"3%@",cell.textField.text);
//            }
//        }
//    
//        if(i == 4){
//          //  if ([string isEqualToString:previousCell.textField.text]&&string.length>0 ) {
//            
//            if([cell.textField.text isEqualToString:stringTem]){
//                isPassWordCheckValid = YES;
//                 NSLog(@"4%@",cell.textField.text);
//            }
//        }
//        
//        
//        if(isNameValid == YES&& isEmailValid == YES && isPasswordValid ==YES && isPhoneNumber ==YES && isPassWordCheckValid ==YES){
//            [_submit setEnabled:TRUE];
//            
//            NSLog(@"hahaha");
//            
//            
//        
//        }
//
//    }

}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSString *stringTem;
    
    for (int i = 0 ; i<arrayForLabelText.count; i++) {
        CustomerTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        NSLog(@"~~~~~%@",cell.textField.text);
        //string and previousCell only valid for the confiming the password.
        // NSString *string = cell.textField.text;
        
        
        //        CustomerTableViewCell *previousCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i-1 inSection:0]];
        //        NSLog(@">>>>>>>%@",cell.textField.text);
        
        if(i == 0){
            if(cell.textField.text.length<10&&cell.textField.text.length>0){
                isNameValid = YES;
                NSLog(@"0%@",cell.textField.text);
            }
        }
        
        if(i==1){
            if(cell.textField.text.length>0 && [cell.textField.text containsString:@"@"]){
                isEmailValid = YES;
                NSLog(@"1%@",cell.textField.text);
            }
        }
        
        if(i == 2){
            if(cell.textField.text.length == 10){
                isPhoneNumber= YES;
                NSLog(@"2%@",cell.textField.text);
            }
            
        }
        
        if(i == 3){
            //  NSString *strTemp = string;
            if(cell.textField.text.length<10 && cell.textField.text.length>5){
                // NSString *tempStr;
                stringTem = cell.textField.text;
                isPasswordValid = YES;
                NSLog(@"3%@",cell.textField.text);
            }
        }
        
        if(i == 4){
            //  if ([string isEqualToString:previousCell.textField.text]&&string.length>0 ) {
            
            if([cell.textField.text isEqualToString:stringTem]){
                isPassWordCheckValid = YES;
                NSLog(@"4%@",cell.textField.text);
            }
        }
        
        
        if(isNameValid == YES&& isEmailValid == YES && isPasswordValid ==YES && isPhoneNumber ==YES && isPassWordCheckValid ==YES){
            [_submit setEnabled:TRUE];
            
            NSLog(@"hahaha");
            
        }
        
    }


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
