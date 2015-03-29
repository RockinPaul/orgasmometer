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

- (void)viewDidLoad {
    
    self.chartView = [[JBLineChartView alloc] init];
    self.chartView.delegate = self;
    self.chartView.dataSource = self;
    self.chartView.state = 0;
    self.chartView.backgroundColor = [UIColor whiteColor];
    
    [self initData];
    self.chartView.frame = CGRectMake(-10, 94, 320, 300);
    
    // THIS IS THE VIEW WHEN THE USER INTERACTS WITH THE CHART
    /*
     _informationView = [[JBChartInformationView alloc] initWithFrame:CGRectMake(0, 0, 40, 300)];
     [_informationView setBackgroundColor:[UIColor grayColor]];*/
    
    
    [self.chartView setMinimumValue:1.0f];
    [self.chartView setMaximumValue:20.0f];
    
    //    [self.view addSubview:_informationView];
    
    [self.plotView addSubview:self.chartView];
    [self.chartView reloadData];
    [super viewDidLoad];
}

- (void) initData
{
    self.testArray1 = @[@(1), @(2), @(3), @(4), @(5), @(6), @(7), @(8), @(9), @(10)];
    self.testArray2 = @[@(11), @(12), @(13), @(14), @(15), @(16), @(17), @(18), @(19), @(20)];
    NSLog(@"Number");
}

- (NSUInteger)numberOfLinesInLineChartView:(JBChartView *)chartView;
{
    return 1;
}

- (BOOL)lineChartView:(JBLineChartView *)lineChartView showsDotsForLineAtLineIndex:(NSUInteger)lineIndex;
{
    return NO;
}


- (NSUInteger)lineChartView:(JBLineChartView *)lineChartView numberOfVerticalValuesAtLineIndex:(NSUInteger)lineIndex;
{
    return self.testArray1.count;
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView verticalValueForHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex;
{
    if (lineIndex == 1)
    {
        NSNumber *value = (NSNumber *)[self.testArray1 objectAtIndex:horizontalIndex];
        return [value floatValue];
    }
    else
    {
        NSNumber *value = (NSNumber *)[self.testArray2 objectAtIndex:horizontalIndex];
        return [value floatValue];
    }

    return 0;
}

@end