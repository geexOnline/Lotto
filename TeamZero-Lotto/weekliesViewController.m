//
//  weekliesViewController.m
//  TeamZero-Lotto
//
//  Created by user130164 on 10/11/17.
//  Copyright © 2017 paulc. All rights reserved.
//

#import "weekliesViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface weekliesViewController ()
{
    UIColor *white;
    UIColor *blue;
    bool toggle[53];
    int picked[6];
    bool noBalls;
    int numBalls;
    int numPicks;
    int numGold;
}

@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *ball;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSMutableArray *lblPicked;
@property (weak, nonatomic) IBOutlet UIButton *btn01;
@property (weak, nonatomic) IBOutlet UIButton *btn02;
@property (weak, nonatomic) IBOutlet UIButton *btn03;
@property (weak, nonatomic) IBOutlet UIButton *btn04;
@property (weak, nonatomic) IBOutlet UIButton *btn05;
@property (weak, nonatomic) IBOutlet UIButton *btn06;
@property (weak, nonatomic) IBOutlet UIButton *btn07;
@property (weak, nonatomic) IBOutlet UIButton *btn08;
@property (weak, nonatomic) IBOutlet UIButton *btn09;
@property (weak, nonatomic) IBOutlet UIButton *btn10;
@property (weak, nonatomic) IBOutlet UIButton *btn11;
@property (weak, nonatomic) IBOutlet UIButton *btn12;
@property (weak, nonatomic) IBOutlet UIButton *btn13;
@property (weak, nonatomic) IBOutlet UIButton *btn14;
@property (weak, nonatomic) IBOutlet UIButton *btn15;
@property (weak, nonatomic) IBOutlet UIButton *btn16;
@property (weak, nonatomic) IBOutlet UIButton *btn17;
@property (weak, nonatomic) IBOutlet UIButton *btn18;
@property (weak, nonatomic) IBOutlet UIButton *btn19;
@property (weak, nonatomic) IBOutlet UIButton *btn20;
@property (weak, nonatomic) IBOutlet UIButton *btn21;
@property (weak, nonatomic) IBOutlet UIButton *btn22;
@property (weak, nonatomic) IBOutlet UIButton *btn23;
@property (weak, nonatomic) IBOutlet UIButton *btn24;
@property (weak, nonatomic) IBOutlet UIButton *btn25;
@property (weak, nonatomic) IBOutlet UIButton *btn26;
@property (weak, nonatomic) IBOutlet UIButton *btn27;
@property (weak, nonatomic) IBOutlet UIButton *btn28;
@property (weak, nonatomic) IBOutlet UIButton *btn29;
@property (weak, nonatomic) IBOutlet UIButton *btn30;
@property (weak, nonatomic) IBOutlet UIButton *btn31;
@property (weak, nonatomic) IBOutlet UIButton *btn32;
@property (weak, nonatomic) IBOutlet UIButton *btn33;
@property (weak, nonatomic) IBOutlet UIButton *btn34;
@property (weak, nonatomic) IBOutlet UIButton *btn35;
@property (weak, nonatomic) IBOutlet UIButton *btn36;
@property (weak, nonatomic) IBOutlet UIButton *btn37;
@property (weak, nonatomic) IBOutlet UIButton *btn38;
@property (weak, nonatomic) IBOutlet UIButton *btn39;
@property (weak, nonatomic) IBOutlet UIButton *btn40;
@property (weak, nonatomic) IBOutlet UIButton *btn41;
@property (weak, nonatomic) IBOutlet UIButton *btn42;
@property (weak, nonatomic) IBOutlet UIButton *btn43;
@property (weak, nonatomic) IBOutlet UIButton *btn44;
@property (weak, nonatomic) IBOutlet UIButton *btn45;
@property (weak, nonatomic) IBOutlet UIButton *btn46;
@property (weak, nonatomic) IBOutlet UIButton *btn47;
@property (weak, nonatomic) IBOutlet UIButton *btn48;
@property (weak, nonatomic) IBOutlet UIButton *btn49;
@property (weak, nonatomic) IBOutlet UIButton *btn50;
@property (weak, nonatomic) IBOutlet UIButton *btn51;
@property (weak, nonatomic) IBOutlet UIButton *btn52;
@property (weak, nonatomic) IBOutlet UIButton *btn53;
@property (weak, nonatomic) IBOutlet UIButton *btnPickForMe;
@property (weak, nonatomic) IBOutlet UILabel *lblDisplay;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segPickGame;

@property (weak, nonatomic) IBOutlet UILabel *lblPicked01;
@property (weak, nonatomic) IBOutlet UILabel *lblPicked02;
@property (weak, nonatomic) IBOutlet UILabel *lblPicked03;
@property (weak, nonatomic) IBOutlet UILabel *lblPicked04;
@property (weak, nonatomic) IBOutlet UILabel *lblPicked05;
@property (weak, nonatomic) IBOutlet UILabel *lblPicked06;
@property (weak, nonatomic) IBOutlet UILabel *lblPickedGold;

@end

@implementation weekliesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
        white = [[UIColor alloc] initWithRed:1.0 green: 1.0 blue: 1.0 alpha: 1.0];
        blue = [[UIColor alloc] initWithRed:0.1 green: 1.0 blue: 0.9 alpha: 1.0];
    _lblDisplay.text = @"First, Pick your game";
     //[_lblDisplay setBackgroundColor:white];
     [[_lblDisplay layer] setCornerRadius: 15];
     [[_lblDisplay layer] setBorderColor:[UIColor blackColor].CGColor];
     [[_lblDisplay layer] setBorderWidth:0.8f];
        noBalls = YES;
        numBalls = 53;
        numPicks = 6;
        numGold = 1;
    [[_ball[18] layer] setBorderColor:[UIColor blueColor].CGColor];
    
        [self gameSetUp];
    
    
    NSMutableArray *picked = [[NSMutableArray alloc]init];
    for (int x=0;x<numPicks;x++)
    {
        //[picked[x]=0];
        [picked addObject:@"  "];
        [_lblPicked[x] setText:picked[x]];
    }
    for (int y=0; y<numBalls; y++)
    {
        toggle[y] = NO;
        [_ball[y] setBackgroundColor:white];
        [[_ball[y] layer] setCornerRadius: 15];
        [[_ball[y] layer] setBorderColor:[UIColor blackColor].CGColor];
        [[_ball[y] layer] setBorderWidth:0.8f];
         [_ball[y] setEnabled: NO];
        [_ball[y] setHidden:YES];
    }

    [self basketOfPicked];
    //[self displayBasket];
    //[self killBalls];
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
-(void)resetPickers
{
    for (int x=0;x<numPicks;x++) {picked[x]=0;}
    noBalls = NO;
}
-(void)resetBalls
{
    for (int x=0;x<53;x++)
    {
        toggle[x]=NO;
        [_ball[x] setBackgroundColor:white];
        [_ball[x] setEnabled: NO];
        [_ball[x] setHidden:YES];
    }
}
-(void)killBalls
{
    if (noBalls)
    {
        for (int i=0;i<numBalls;i++)
        {
            if (!toggle[i])
            {[_ball[i] setEnabled: NO];
             [_ball[i] setHidden:YES];
            }
        }
    }
    else
    {
        for (int i=0;i<numBalls;i++)
        {
            if (!toggle[i])
            {[_ball[i] setEnabled: YES];
                [_ball[i] setHidden: NO];
            }
        }
    }
}
-(void)basketOfPicked
{
    [self resetPickers];
    NSLog(@"Basket Of Picked");
    int y=0;
    for (int x=0; x<numBalls-1; x++)
    {
        if (y==numPicks){
            noBalls = YES;
            return;}
        if (toggle[x])
        {
            picked[y]=x+1;
            NSLog(@"x:%d   y:%d   picked:%d",x,y,picked[y]);
            y++;
        }
        NSLog(@"x:%d   y:%d",x,y);
        
        
    }
    
}
-(void)displayBasket
{
    NSLog(@"Display Basket");

    for (int x=0;x<numPicks;x++)
    {
        if (picked[x]==0)
        {[_lblPicked[x] setText: [NSString stringWithFormat:@"  "]];
        }
        else
        {
        [_lblPicked[x] setText: [NSString stringWithFormat:@"%02d",picked[x]]];
        }
    }
}
-(void) gameSetUp{
        NSMutableArray *ballSet = [[NSMutableArray alloc] initWithObjects:
                            _btn01,
                            _btn02,
                            _btn03,
                            _btn04,
                            _btn05,
                            _btn06,
                            _btn07,
                            _btn08,
                            _btn09,
                            _btn10,
                            _btn11,
                            _btn12,
                            _btn13,
                            _btn14,
                            _btn15,
                            _btn16,
                            _btn17,
                            _btn18,
                            _btn19,
                            _btn20,
                            _btn21,
                            _btn22,
                            _btn23,
                            _btn24,
                            _btn25,
                            _btn26,
                            _btn27,
                            _btn28,
                            _btn29,
                            _btn30,
                            _btn31,
                            _btn32,
                            _btn33,
                            _btn34,
                            _btn35,
                            _btn36,
                            _btn37,
                            _btn38,
                            _btn39,
                            _btn40,
                            _btn41,
                            _btn42,
                            _btn43,
                            _btn44,
                            _btn45,
                            _btn46,
                            _btn47,
                            _btn48,
                            _btn49,
                            _btn50,
                            _btn51,
                            _btn52,
                            _btn53,
                            nil];
    for (int i=0;i<53;i++)
    {
        _ball [i] = ballSet[i];
    }
    NSMutableArray *lblPickedSet = [[NSMutableArray alloc] initWithObjects:
                                 _lblPicked01,
                                 _lblPicked02,
                                 _lblPicked03,
                                 _lblPicked04,
                                 _lblPicked05,
                                 _lblPicked06,
                                 nil];
    for (int j=0;j<6;j++)
    {
        _lblPicked[j] = lblPickedSet[j];
    }}
- (IBAction)toggle_btn01:(id)sender
{
    for (int i=0;i<numBalls;i++){NSLog(@"%d: toggle=%d    Button=%@",i,toggle[i],_ball[i]);}
    NSInteger zz = [[(UIButton *)sender currentTitle] integerValue] -1;
    //NSLog(@"title: %@   zz:%ld",title,(long)zz);
    if(toggle[zz])
    {
        NSLog(@"Yep");
        toggle[zz]=NO;
        [_ball[zz] setBackgroundColor:white];
    }
    else
    {
        NSLog(@"Nope");
        toggle[zz]=YES;NSLog(@"Toggle Worked");
        NSLog(@"Button is %@",_ball[zz]);
        [_ball[zz] setBackgroundColor:blue];NSLog(@"BlueButton worked");
    }
    NSLog(@"Got To basketOfPicked");
    [self basketOfPicked];
    NSLog(@"Got To displayBasket");
    [self displayBasket];
    [self killBalls];
    
}
- (IBAction)segPickGame:(id)sender {
    _lblDisplay.text = @"Now, Pick your numbers or let me pick them for you";
    numBalls = 53;
    numPicks = 6;
    [self resetPickers];
    [self basketOfPicked];
    [self displayBasket];
    [self resetBalls];
    numBalls = 0;
    numPicks = 0;
    
    switch(_segPickGame.selectedSegmentIndex)
    {
        case 0: //Fantasy 5
            numBalls = 36;
            numPicks = 5;
            numGold = 0;
            break;
        case 1: //Lucky Money
            numBalls = 47;
            numPicks = 4;
            numGold = 17;
            break;
        case 2: //Lotto
            numBalls = 53;
            numPicks = 6;
            numGold = 0;
            break;
        default:
            break;
    }
    noBalls = NO;
    for (int i=0;i<numBalls;i++)
    {
            [_ball[i] setHidden:NO];
            [_ball[i] setEnabled:YES];
    }
}

@end

