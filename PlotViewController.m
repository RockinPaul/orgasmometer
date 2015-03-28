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
    
    [self.view addSubview:self.chartView];
    
    AmPieChart *pieChart = [[AmPieChart alloc] init];
    pieChart.type = @"pie";
    pieChart.theme = @"none";
    NSMutableArray *dataProvider = [[NSMutableArray alloc] init];
    [dataProvider addObject:@{@"country" : @"Lithuania", @"litres" : @(501.9)}];
    [dataProvider addObject:@{@"country" : @"Czech Republic", @"litres" : @(301.9)}];
    [dataProvider addObject:@{@"country" : @"Ireland", @"litres" : @(201.1)}];
    pieChart.dataProvider = dataProvider;
    
    pieChart.valueField = @"litres";
    pieChart.titleField = @"country";
    
    // where self.chartView references an AmChartView *
    [self.chartView setChart:pieChart];
    [self.chartView drawChart];
    
}


@end