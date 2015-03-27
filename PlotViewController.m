//
//  PlotViewController.m
//  Orgasmometer
//
//  Created by Pavel on 28.03.15.
//  Copyright (c) 2015 Zitech Mobile LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlotViewController.h"

@implementation PlotViewController

- (void)viewDidAppear:(BOOL)animated {
    [self viewDidAppear:YES];
    
    JBBarChartView *barChartView = [[JBBarChartView alloc] init];
    barChartView.dataSource = self;
    barChartView.delegate = self;
    [self addSubview:barChartView];
}


@end