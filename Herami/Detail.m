//
//  Detail.m
//  Herami
//
//  Created by Ahmad on 12/27/14.
//  Copyright (c) 2014 Ahmad. All rights reserved.
//

#import "Detail.h"

@interface Detail ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation Detail {
    NSInteger nonProfitMonthes;
    NSInteger rows;
}

- (IBAction)segmentSelected:(id)sender {
    [self.tableview reloadData];
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.index == 0) {
        
        float result = 0;
        float A=self.A;
        float B=self.B;
        float C=self.C;
        float P=self.P;
        
        float count = 0;
        
        while (result < P ) {
            if (count > self.B) {
                result = A*(powf(C+1, count-B-1)*(pow(C+1, B+1) + (C)*B - (C)*count));
            } else {
                result = A*pow(C+1, count);
            }
            count++;
        }
        count--;
        rows = count;
        
    } else {
        
        rows = self.n;
        
    }
    
    return rows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    float result;
    float A=self.A;
    float B=self.B;
    float C=self.C;
    float n=indexPath.row+1;
    
    if (self.segment.selectedSegmentIndex == 1) {
        
        if (indexPath.row+1 > self.B) {
            
            result = A*(powf(C+1, n-B-1)*(pow(C+1, B+1) + (C)*B - (C)*n));
            NSNumberFormatter *testi = [[NSNumberFormatter alloc] init];
            NSString *number = [NSString stringWithFormat:@"%f",result];
            [testi setMaximumFractionDigits:0];
            NSNumber *tester= [testi numberFromString:number];
            cell.textLabel.text = [NSString stringWithFormat:@"%@",tester];
            if ([cell.textLabel.text isEqualToString:@"(null)"]) {
                cell.textLabel.text = @"خیلی نفر";
            }
            cell.detailTextLabel.text = [NSString stringWithFormat:@"ماه %i",(int)indexPath.row+1];
            
        } else {
            
            result = A*pow(C+1, n);
            
            NSNumberFormatter *testi = [[NSNumberFormatter alloc] init];
            NSString *number = [NSString stringWithFormat:@"%f",result];
            [testi setMaximumFractionDigits:0];
            NSNumber *tester= [testi numberFromString:number];
            
            cell.textLabel.text = [NSString stringWithFormat:@"%@",tester];
            if ([cell.textLabel.text isEqualToString:@"(null)"]) {
                cell.textLabel.text = @"خیلی نفر";
            }
            cell.detailTextLabel.text = [NSString stringWithFormat:@"ماه %i",(int)indexPath.row+1];
            
        }
    } else if (self.segment.selectedSegmentIndex == 0) {
        
        if (n > nonProfitMonthes - 1) {
            
            n = n-nonProfitMonthes;
            
            if (n > self.B) {
                
                result = A*(powf(C+1, n-B-1)*(pow(C+1, B+1) + (C)*B - (C)*n));
                NSNumberFormatter *testi = [[NSNumberFormatter alloc] init];
                NSString *number = [NSString stringWithFormat:@"%f",result];
                [testi setMaximumFractionDigits:0];
                NSNumber *tester= [testi numberFromString:number];
                cell.textLabel.text = [NSString stringWithFormat:@"%@",tester];
                if ([cell.textLabel.text isEqualToString:@"(null)"]) {
                    cell.textLabel.text = @"خیلی نفر";
                }
                cell.detailTextLabel.text = [NSString stringWithFormat:@"ماه %i",(int)indexPath.row+1];
                
            } else {
                
                result = A*pow(C+1, n);
                NSNumberFormatter *testi = [[NSNumberFormatter alloc] init];
                NSString *number = [NSString stringWithFormat:@"%f",result];
                [testi setMaximumFractionDigits:0];
                NSNumber *tester= [testi numberFromString:number];
                cell.textLabel.text = [NSString stringWithFormat:@"%@",tester];
                if ([cell.textLabel.text isEqualToString:@"(null)"]) {
                    cell.textLabel.text = @"خیلی نفر";
                }
                cell.detailTextLabel.text = [NSString stringWithFormat:@"ماه %i",(int)indexPath.row+1];
                
            }
            
        } else {
            
            cell.textLabel.text = [NSString stringWithFormat:@"0"];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"ماه %i",(int)indexPath.row+1];
        }
    }
    
    return cell;
    
}

-(void)viewDidLoad {
    
    rows = 0;
    
    [self.segment setSelectedSegmentIndex:1];
    
    nonProfitMonthes = 4;
    NSInteger finder = 1;
    NSInteger reachProfit = 0;
    
    float A=self.A;
    float B=self.B;
    float C=self.C;
    
    while (reachProfit < 6) {
        if (finder > self.B) {
            reachProfit = A*(powf(C+1, finder-B-1)*(pow(C+1, B+1) + (C)*B - (C)*finder)) - 1;
        } else {
            reachProfit = A*pow(C+1, finder) - 1;
        }
        finder++;
    }
    
    finder--;
    
    nonProfitMonthes = nonProfitMonthes + finder;
    
}


@end
