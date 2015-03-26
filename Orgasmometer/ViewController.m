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
    
    self.count = 0;
    
}

- (void)orgasm:(UIButton *)sender {
    
    NSLog(@"orgasm");
    self.count += 1;
    [self.counterLabel setText: [NSString stringWithFormat: @"%li", self.count]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
