//
//  PlotViewController.h
//  Orgasmometer
//
//  Created by Pavel on 28.03.15.
//  Copyright (c) 2015 Zitech Mobile LLC. All rights reserved.
//

#ifndef Orgasmometer_PlotViewController_h
#define Orgasmometer_PlotViewController_h
#endif

#import <UIKit/UIKit.h>
#import "JBBarChartView.h"
#import "JBLineChartView.h"
#import "JBChartView.h"
#include "JBLineChartFooterView.h"

@interface PlotViewController : UIViewController <JBLineChartViewDelegate, JBLineChartViewDataSource, NSCoding>

@property (nonatomic) BOOL isYear; //YES - if year chart should be presented. NO - if month chart

@property (nonatomic, strong) IBOutlet UIButton *monthButton;
@property (nonatomic, strong) IBOutlet UIButton *yearButton;

@property (nonatomic, strong) IBOutlet UIView *plotView;
@property (nonatomic, strong) JBLineChartView *chartView;

- (IBAction)monthButtonPressed:(UIButton *)sender;
- (IBAction)yearButtonPressed:(UIButton *)sender;
- (IBAction)statisticButtonPressed:(UIButton *)sender;

@end