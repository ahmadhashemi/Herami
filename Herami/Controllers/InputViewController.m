//
//  ViewController.m
//  Herami
//
//  Created by Ahmad on 12/27/14.
//  Copyright (c) 2014 Ahmad. All rights reserved.
//

#import "InputViewController.h"
#import "ResultViewController.h"

@interface InputViewController ()

@property (weak, nonatomic) IBOutlet UITextField *first;
@property (weak, nonatomic) IBOutlet UITextField *remain;
@property (weak, nonatomic) IBOutlet UITextField *add;
@property (weak, nonatomic) IBOutlet UITextField *till;
@property (weak, nonatomic) IBOutlet UILabel *tillLabel;
@property (weak, nonatomic) IBOutlet UIView *calculateView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@end

@implementation InputViewController

- (IBAction)segment:(id)sender {
    if (self.segment.selectedSegmentIndex == 1) {
        self.till.text = @"";
        self.tillLabel.text = @"تا چند ماه بریم جلو؟";
    } else if (self.segment.selectedSegmentIndex == 0) {
        self.till.text = @"";
        self.tillLabel.text = @"چقدر جمعیت میخوای؟";
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.first resignFirstResponder];
    [self.remain resignFirstResponder];
    [self.add resignFirstResponder];
    [self.till resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.segment setSelectedSegmentIndex:1];
    self.tillLabel.text = @"تا چند ماه بریم جلو؟";

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ResultViewController *resultVC = [segue destinationViewController];
    resultVC.n = self.till.text.floatValue;
    resultVC.A = self.first.text.floatValue;
    resultVC.B = self.remain.text.floatValue;
    resultVC.C = self.add.text.floatValue;
    resultVC.P = self.till.text.floatValue;
    resultVC.index = (int)self.segment.selectedSegmentIndex;
    
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    BOOL shoudOrNot = YES;
    
    if ([self.first.text isEqualToString:@""] ||
        [self.add.text isEqualToString:@""] ||
        [self.till.text isEqualToString:@""] ||
        [self.remain.text isEqualToString:@""]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"با اطلاعات ناقص؟" delegate:nil cancelButtonTitle:@"تکمیل اطلاعات" otherButtonTitles:nil, nil];
        [alert show];
        shoudOrNot = NO;
        
    } else {
        
        [self.view endEditing:YES];
        
    }
    
    return shoudOrNot;
}

@end
