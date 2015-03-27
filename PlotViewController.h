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
#import "JBChartView.h"
#import "JBBarChartView.h"
#import "JBLineChartView.h"

@interface PlotViewController : JBBarChartView

@property (nonatomic, strong) IBOutlet UIView *plotView;

@end