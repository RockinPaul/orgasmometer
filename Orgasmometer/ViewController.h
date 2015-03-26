//
//  ViewController.h
//  Orgasmometer
//
//  Created by Pavel on 26.03.15.
//  Copyright (c) 2015 Zitech Mobile LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView *mainView;
@property (nonatomic, strong) IBOutlet UIButton *orgasmButton;
@property (nonatomic, strong) IBOutlet UISlider *intensitySlider;
@property (nonatomic, strong) IBOutlet UIButton *menuButton;
@property (nonatomic, strong) IBOutlet UIButton *statisticsButton;
@property (nonatomic, strong) IBOutlet UILabel *counterLabel;
@property (nonatomic) long count;

- (IBAction)orgasm:(UIButton *)sender;

@end

