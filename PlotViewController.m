//
//  PlotViewController.m
//  Orgasmometer
//
//  Created by Pavel on 28.03.15.
//  Copyright (c) 2015 Zitech Mobile LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlotViewController.h"
#import "GridView.h"

@implementation PlotViewController

- (void)viewDidLoad {
    
    self.chartView = [[JBLineChartView alloc] init];
    self.chartView.delegate = self;
    self.chartView.dataSource = self;
    self.chartView.state = 0;
    self.chartView.backgroundColor = [UIColor clearColor];
    
    [self initData];
    
    self.chartView.frame = CGRectMake(28, 94, 320, 250);
    
    JBLineChartFooterView *footerView = [[JBLineChartFooterView alloc] initWithFrame:CGRectMake(0, 100, 320, 15)];
    footerView.backgroundColor = [UIColor clearColor];
    footerView.leftLabel.text = @"Sunday";
    footerView.leftLabel.textColor = [UIColor redColor];
    footerView.rightLabel.text = @"Saturday";
    footerView.rightLabel.textColor = [UIColor redColor];
    footerView.sectionCount = [self.testArray1 count];
    footerView.footerSeparatorColor = [UIColor clearColor];
    
    self.chartView.footerView = footerView;
    
    [self.chartView setMinimumValue:1.0f];
    [self.chartView setMaximumValue:20.0f];
    
    
    // TODO set grid for various tabs
    GridView *gridView = [[GridView alloc] initWithFrame:CGRectMake(30, 94, 320, 250)];
    gridView.numberOfColumns = 8;
    gridView.numberOfRows = 0;
    [gridView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:gridView];
    [gridView setNeedsDisplay];

    //    [self.view addSubview:_informationView];
    
    [self.view addSubview:self.chartView];
    [self.chartView reloadData];
    [super viewDidLoad];
}


- (void) initData
{
    self.testArray1 = @[@(1), @(2), @(3), @(4), @(5), @(6), @(7), @(8), @(9), @(10)];
    self.testArray2 = @[@(1), @(2), @(3), @(4), @(5), @(6), @(7), @(8), @(9), @(20)];
}

// Number of lines on plot
- (NSUInteger)numberOfLinesInLineChartView:(JBChartView *)chartView;
{
    return 1;
}


// Line style
- (JBLineChartViewLineStyle)lineChartView:(JBLineChartView *)lineChartView lineStyleForLineAtLineIndex:(NSUInteger)lineIndex
{
    return JBLineChartViewLineStyleSolid;
}

// Line width
- (CGFloat)lineChartView:(JBLineChartView *)lineChartView widthForLineAtLineIndex:(NSUInteger)lineIndex
{
    return 8.0;
}

// Line smooth
- (BOOL)lineChartView:(JBLineChartView *)lineChartView smoothLineAtLineIndex:(NSUInteger)lineIndex
{
    return YES;
}


// Number of vertical values
- (NSUInteger)lineChartView:(JBLineChartView *)lineChartView numberOfVerticalValuesAtLineIndex:(NSUInteger)lineIndex;
{
    return self.testArray1.count;
}


// Color for line
- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForLineAtLineIndex:(NSUInteger)lineIndex
{
    return [UIColor purpleColor];
}


// Vertical value for horizontal index
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