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
#import "OrgasmData.h"

@implementation PlotViewController

- (void)viewDidLoad {
    
    // ============================= PlotViewController state restoration =============================
    OrgasmData *orgasmData = [OrgasmData sharedInstance];
    if (orgasmData.monthButtonPressed) {
        [self monthButtonPressed:nil];
    } else {
        [self yearButtonPressed:nil];
    }
    
    if (orgasmData.intensityButtonPressed) {
        [self intensityButtonPressed:nil];
    } else {
        [self countButtonPressed:nil];
    }
    
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background_iphone5.png"]];
    self.view.backgroundColor = background;
    
    self.chartView = [[JBLineChartView alloc] init];
    self.chartView.delegate = self;
    self.chartView.dataSource = self;
    self.chartView.state = 0;
    self.chartView.backgroundColor = [UIColor clearColor];
    
    self.chartView.frame = CGRectMake(28, 120, 260, 150);
    
    [self.chartView setMinimumValue:1.0f];
    [self.chartView setMaximumValue:20.0f];
    
    [self.view addSubview:self.chartView];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(updateChart) userInfo:nil repeats:YES];
}


- (void)viewDidAppear:(BOOL)animated {
    
    OrgasmData *orgasmData = [OrgasmData sharedInstance];
    [orgasmData setYearData];
    [orgasmData setMonthDataForMonth:4];
}


- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.chartView forKey:@"chartView"];
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"SUPER");
        self.chartView = [aDecoder decodeObjectForKey:@"chartView"];
    }
    return self;
}


- (void)updateChart {
    
    OrgasmData *orgasmData = [OrgasmData sharedInstance];
    
    JBLineChartFooterView *footerView = [[JBLineChartFooterView alloc] initWithFrame:CGRectMake(0, 0, 325, 15)];
    footerView.backgroundColor = [UIColor clearColor];
    footerView.leftLabel.text = @"Sunday";
    footerView.leftLabel.textColor = [UIColor redColor];
    footerView.rightLabel.text = @"Saturday";
    footerView.rightLabel.textColor = [UIColor redColor];
    
    if (self.isYear) {
        footerView.sectionCount = [orgasmData.year count] + 1;
    } else {
        footerView.sectionCount = [orgasmData.month count] + 1;
    }
    
    footerView.footerSeparatorColor = [UIColor blackColor];
    
    self.chartView.footerView = footerView;

    [self.chartView reloadData];
}


- (void)monthButtonPressed:(UIButton *)sender {
    
    OrgasmData *orgasmData = [OrgasmData sharedInstance];
    orgasmData.monthButtonPressed = YES;
    
    self.yearButton.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"stat_trigger_nonactive.png"]];
    self.monthButton.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"stat_trigger_active.png"]];
    
    self.isYear = NO;
}


- (void)yearButtonPressed:(UIButton *)sender {
    
    OrgasmData *orgasmData = [OrgasmData sharedInstance];
    orgasmData.monthButtonPressed = NO;

    self.monthButton.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"stat_trigger_nonactive.png"]];
    self.yearButton.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"stat_trigger_active.png"]];
    
    self.isYear = YES;
}


- (void)intensityButtonPressed:(UIButton *)sender {
    
    OrgasmData *orgasmData = [OrgasmData sharedInstance];
    orgasmData.intensityButtonPressed = YES;
    
    self.countButton.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"stat_trigger_nonactive.png"]];
    self.intensityButton.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"stat_trigger_active.png"]];
    
    self.isIntensity = YES;
}


- (void)countButtonPressed:(UIButton *)sender {
    
    OrgasmData *orgasmData = [OrgasmData sharedInstance];
    orgasmData.intensityButtonPressed = NO;
    
    self.intensityButton.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"stat_trigger_nonactive.png"]];
    self.countButton.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"stat_trigger_active.png"]];
    
    self.isIntensity = NO;
}


- (void)statisticButtonPressed:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
    return 5.0;
}


// Line smooth
- (BOOL)lineChartView:(JBLineChartView *)lineChartView smoothLineAtLineIndex:(NSUInteger)lineIndex
{
    return YES;
}


// Number of vertical values
- (NSUInteger)lineChartView:(JBLineChartView *)lineChartView numberOfVerticalValuesAtLineIndex:(NSUInteger)lineIndex;
{
    OrgasmData *orgasmData = [OrgasmData sharedInstance];
    if (self.isYear) {
        return [orgasmData.year count];
    } else {
        return [orgasmData.month count];
    }

}


// Color for line
- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForLineAtLineIndex:(NSUInteger)lineIndex
{
    return [UIColor purpleColor];
}


// Vertical value for horizontal index
- (CGFloat)lineChartView:(JBLineChartView *)lineChartView verticalValueForHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex;
{
    OrgasmData *orgasmData = [OrgasmData sharedInstance];
    
    if (self.isYear)
    {
        NSNumber *value = (NSNumber *)[orgasmData.year objectAtIndex:horizontalIndex];
        value = [NSNumber numberWithInt:[value intValue] + 15]; // for footer padding
        return [value floatValue];
    }
    else
    {
        NSNumber *value = (NSNumber *)[orgasmData.month objectAtIndex:horizontalIndex];
        value = [NSNumber numberWithInt:[value intValue] + 4]; // for footer padding
        return [value floatValue];
    }
    
    return 0;
}

@end