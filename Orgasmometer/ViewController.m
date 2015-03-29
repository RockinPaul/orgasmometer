//
//  ViewController.m
//  Orgasmometer
//
//  Created by Pavel on 26.03.15.
//  Copyright (c) 2015 Zitech Mobile LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.intensitySlider setThumbImage: [UIImage imageNamed:@"slider_thumb.png"] forState:UIControlStateNormal];
    UIImage *stetchLeftTrack = [[UIImage imageNamed:@"slider_bar.png"]
                                stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
    UIImage *stetchRightTrack = [[UIImage imageNamed:@"slider_bar.png"]
                                stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
    [self.intensitySlider setMinimumTrackImage:stetchLeftTrack forState:UIControlStateNormal];
    [self.intensitySlider setMaximumTrackImage:stetchRightTrack forState:UIControlStateNormal];
    self.intensitySlider.minimumValue = 0.0;
    self.intensitySlider.maximumValue = 100.0;
    self.intensitySlider.continuous = YES;
    self.intensitySlider.value = 50.0;
    
    [self showCount];
    
}

- (void)showCount {
    PFQuery *query = [PFQuery queryWithClassName:@"Orgasm"];
    [query fromLocalDatastore];
    [query whereKey:@"user" equalTo: [PFUser currentUser]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            [PFObject pinAll:objects];
            self.count = [objects count];
            [self.counterLabel setText: [NSString stringWithFormat:@"%li", self.count]];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    OrgasmData *orgasmData = [[OrgasmData alloc] init];
    [orgasmData setMonthDataForMonth:4];
//    [orgasmData setDayDataForStartDate:nil andEndDate:nil];
}


- (void)orgasm:(UIButton *)sender {
    
    self.count += 1;
    [self.counterLabel setText: [NSString stringWithFormat: @"%li", self.count]];
    NSInteger roundedSliderValue = round(self.intensitySlider.value);
    
    NSMutableArray *objects = [[NSMutableArray alloc] init];
    PFObject *orgasm = [PFObject objectWithClassName:@"Orgasm"];
    orgasm[@"intensity"] = [NSString stringWithFormat: @"%ld", roundedSliderValue];
    orgasm[@"user"] = [PFUser currentUser];
    [objects addObject:orgasm];
    [orgasm saveInBackground];
    [PFObject pinAll:objects];
    
    NSLog(@"orgasm");
    NSLog(@"%ld", (long)roundedSliderValue);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
