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

@interface PlotViewController : UIViewController <JBChartViewDelegate, JBChartViewDataSource>

//@property (nonatomic, strong) IBOutlet UIView *plotView;
@property (nonatomic, strong) IBOutlet UIView *plotView;
@property (nonatomic, strong) JBChartView *chartView;
@property (nonatomic, strong) NSArray *testArray1;
@property (nonatomic, strong) NSArray *testArray2;

@end