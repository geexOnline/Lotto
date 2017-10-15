//
//  dailiesViewController.m
//  TeamZero-Lotto
//
//  Created by user130164 on 10/11/17.
//  Copyright © 2017 paulc. All rights reserved.
//

#import "dailiesViewController.h"


@interface dailiesViewController ()
{
 
    NSInteger pix;
 
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segPicker;

@property (weak, nonatomic) IBOutlet UIPickerView *pkrNumberPicker;
@property (weak, nonatomic) IBOutlet UIButton *btnSelect;
@property (weak, nonatomic) IBOutlet UIButton *btnQuickPick;
@property (strong, nonatomic) NSArray * games;
@property (strong, nonatomic) NSArray * nbr01;
@property (strong, nonatomic) NSArray * nbr02;
@property (strong, nonatomic) NSArray * nbr03;
@property (strong, nonatomic) NSArray * nbr04;
@property (strong, nonatomic) NSArray * nbr05;




@end

@implementation dailiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    pix = 5;
    _games = @[@"Pick Two",
                      @"Pick 3",
                      @"Pick 4",
                      @"Pick 5"];
    _nbr01 = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    _nbr02 = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    _nbr03 = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    _nbr04 = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    _nbr05 = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
     self.pkrNumberPicker.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)segGamePicked:(id)sender {
    pix = _segPicker.selectedSegmentIndex +2;
    [_pkrNumberPicker reloadAllComponents];
     self.pkrNumberPicker.delegate = self;
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{return pix;}

//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{return _nbr01[row];}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{return _nbr01.count;}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return _nbr01[row];
    }
    else
    {
        return _nbr02[row];
    }

}

@end
