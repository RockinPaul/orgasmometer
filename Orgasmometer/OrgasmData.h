//
//  OrgasmData.h
//  Orgasmometer
//
//  Created by Pavel on 29.03.15.
//  Copyright (c) 2015 Zitech Mobile LLC. All rights reserved.
//

#ifndef Orgasmometer_OrgasmData_h
#define Orgasmometer_OrgasmData_h
#endif

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "PlotViewController.h"

@interface OrgasmData : NSObject

@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *endDate;
@property (nonatomic, strong) NSMutableArray *dates;

@property (nonatomic, strong) NSMutableArray *month;
@property (nonatomic, strong) NSMutableArray *year;

@property (nonatomic, strong) NSMutableArray *monthIntensity;
@property (nonatomic, strong) NSMutableArray *yearIntensity;


- (long)getOrgasmsCountForStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;

- (void)setMonthDataForMonth:(int)month;
- (void)setYearData;

- (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

+ (OrgasmData *) sharedInstance;

@end