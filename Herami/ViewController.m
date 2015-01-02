//
//  ViewController.m
//  Herami
//
//  Created by Ahmad on 12/27/14.
//  Copyright (c) 2014 Ahmad. All rights reserved.
//

#import "ViewController.h"
#import "Detail.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *first;
@property (weak, nonatomic) IBOutlet UITextField *remain;
@property (weak, nonatomic) IBOutlet UITextField *add;
@property (weak, nonatomic) IBOutlet UITextField *till;
@property (weak, nonatomic) IBOutlet UILabel *tillLabel;
@property (weak, nonatomic) IBOutlet UIView *calculateView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@end

@implementation ViewController

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
    Detail *data = [segue destinationViewController];
    data.n = self.till.text.floatValue;
    data.A = self.first.text.floatValue;
    data.B = self.remain.text.floatValue;
    data.C = self.add.text.floatValue;
    data.P = self.till.text.floatValue;
    data.index = (int)self.segment.selectedSegmentIndex;
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    BOOL shoudOrNot = YES;
    if ([self.first.text isEqualToString:@""] || [self.add.text isEqualToString:@""] || [self.till.text isEqualToString:@""] || [self.remain.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"با اطلاعات ناقص؟" delegate:nil cancelButtonTitle:@"تکمیل اطلاعات" otherButtonTitles:nil, nil];
        [alert show];
        shoudOrNot = NO;
    }
    return shoudOrNot;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
