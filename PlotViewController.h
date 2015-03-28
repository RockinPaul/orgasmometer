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
#import <AmChartsMobile/AmCharts.h>

@interface PlotViewController : UIViewController

//@property (nonatomic, strong) IBOutlet UIView *plotView;
@property (nonatomic, strong) AmMobileChartView *chartView;

@end