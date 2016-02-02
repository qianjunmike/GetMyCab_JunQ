//
//  DriverRegisterViewController.m
//  getMyCab_JunQ
//
//  Created by 钱骏 on 16/2/1.
//  Copyright © 2016年 钱骏. All rights reserved.
//

#import "DriverRegisterViewController.h"
#import "DriverTableViewCell.h"
#import "DobTableViewCell.h"
#import "ActionsheetTableViewCell.h"
#import "PhotoTableViewCell.h"
#import "CityTableViewCell.h"

@interface DriverRegisterViewController ()
{
    NSMutableArray *arrayForUse;
    UIAlertController *alerteq;
    UIAlertController *alertbg;
    NSString *selectDate;
}

- (IBAction)DatePicker:(id)sender;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


@end

@implementation DriverRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrayForUse = [[NSMutableArray alloc]initWithObjects:@"Full name",@"Email",@"mobile number",@"Password",@"ConfirmPassword",@"Vehicle number",@"Licence number",@"emergency number",@"dob",@"eq",@"bgroup",@"photo",@"city", nil];
    // Do any additional setup after loading the view.
    
    //alertAction for eq
    
    alerteq = [UIAlertController alertControllerWithTitle:@"Please choose" message:@"Pick your education" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *secondarySchool=[UIAlertAction actionWithTitle:@"Secondary school" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textfield=(UITextField*)[self.view viewWithTag:9];
        textfield.text=@"Secondary school";
    }];
    UIAlertAction *highSchool=[UIAlertAction actionWithTitle:@"High school" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textfield=(UITextField*)[self.view viewWithTag:9];
        textfield.text=@"High school";
    }];
    UIAlertAction *bachelorSchool=[UIAlertAction actionWithTitle:@"Bachelor" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textfield=(UITextField*)[self.view viewWithTag:9];
        textfield.text=@"Bachelor";
    }];
    UIAlertAction *masterSchool=[UIAlertAction actionWithTitle:@"Master" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textfield=(UITextField*)[self.view viewWithTag:9];
        textfield.text=@"Master";
    }];
    [alerteq addAction:secondarySchool];
    [alerteq addAction:highSchool];
    [alerteq addAction:bachelorSchool];
    [alerteq addAction:masterSchool];
    
    
    //alertaction for bg
    alertbg=[UIAlertController alertControllerWithTitle:@"Make your choice" message:@"Pick your Blood Group" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * actionA=[UIAlertAction actionWithTitle:@"A" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textfield=(UITextField*)[self.view viewWithTag:10];
        textfield.text=@"A";
    }];
    UIAlertAction * actionB=[UIAlertAction actionWithTitle:@"B" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textfield=(UITextField*)[self.view viewWithTag:10];
        textfield.text=@"B";
    }];
    UIAlertAction * actionO=[UIAlertAction actionWithTitle:@"O" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textfield=(UITextField*)[self.view viewWithTag:10];
        textfield.text=@"O";
    }];
    [alertbg addAction:actionA];
    [alertbg addAction:actionB];
    [alertbg addAction:actionO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayForUse.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row<8){
        DriverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DriverTableViewCell"];
        cell.labeltext.text = [arrayForUse objectAtIndex:indexPath.row];
        cell.textfield.tag = indexPath.row+1;
        cell.textfield.delegate=self;
        NSLog(@"%@",cell.labeltext.text);
         return cell;
    }
    
   else if (indexPath.row == 8) {
        DobTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DobTableViewCell"];
        cell.labeltext.text = [arrayForUse objectAtIndex:indexPath.row];
        cell.dobtextlbl.tag = indexPath.row+1;
       NSLog(@"%@",cell.labeltext.text);
        return cell;
    }
    
    else if(indexPath.row==9){
      ActionsheetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActionsheetTableViewCell"];
        cell.labeltext.text = [arrayForUse objectAtIndex:indexPath.row];
        cell.actionTextfield.tag = indexPath.row+1;
        NSLog(@"----->%@",cell.labeltext.text);
        NSLog(@"%@",cell.labeltext.text);
        return cell;
    }
    
    else if(indexPath.row==10){
        ActionsheetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActionsheetTableViewCell"];
        cell.labeltext.text = [arrayForUse objectAtIndex:indexPath.row];
        cell.actionTextfield.tag = indexPath.row+1;
        NSLog(@"----->%@",cell.labeltext.text);
        return cell;
    }
    
   else if(indexPath.row==11){
        PhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PhotoTableViewCell"];
        cell.labeltext.text = [arrayForUse objectAtIndex:indexPath.row];
       NSLog(@"%@",cell.labeltext.text);
        return cell;
    }
    
    else {
        CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityTableViewCell"];
        cell.labeltext.text = [arrayForUse objectAtIndex:indexPath.row];
        cell.citytextfield.tag = indexPath.row+1;
        NSLog(@"%@",cell.labeltext.text);
        return cell;
    }
}


// UIimagepicker
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *img = info[UIImagePickerControllerOriginalImage];
   // [self.imageView setImage:img];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSData *data = UIImagePNGRepresentation(img);
    if(data){
    //    [self writeDataToImageFieName:@"Wallpaper" withData:data];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)openImagePickerController{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;//allow to edit
    
    picker.navigationBar.barStyle = UIBarStyleBlackOpaque;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//data picker
- (IBAction)DatePicker:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    NSString *formatedDate = [dateFormatter stringFromDate:self.datePicker.date];
    selectDate = formatedDate;
}


//- (IBAction)cancelBut_press:(id)sender {
//    selectDate = @"";
//    
//    [self.textfield resignFirstResponder];
//    
//    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
//        _BottonLayoutsubviewConstrain.constant = -300;
//        [[self view]layoutIfNeeded];
//        
//    } completion:^(BOOL finished) {
//        
//    }];
//    
//}
//
//- (IBAction)DoneBut_Press:(id)sender {
//    
//    if([selectDate length]){
//        self.textfield.text = selectDate;
//    }
//    else{
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//        [dateFormatter setDateFormat:@"MM/dd/yyyy"];
//        NSDate *date = [NSDate date];
//        NSString *stringDate = [dateFormatter stringFromDate:date];
//        selectDate = stringDate;
//        self.textfield.text = selectDate;
//        
//    }
//    
//    
//    [self.textfield resignFirstResponder];
//    
//    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
//        _BottonLayoutsubviewConstrain.constant = -300;
//        [[self view]layoutIfNeeded];
//        
//    } completion:^(BOOL finished) {
//        
//    }];
//}

@end
