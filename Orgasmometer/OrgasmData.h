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

@interface OrgasmData : NSObject

@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *endDate;

@property (nonatomic, strong) NSMutableArray *day;
@property (nonatomic, strong) NSMutableArray *month;
@property (nonatomic, strong) NSMutableArray *year;

@property (nonatomic, strong) NSMutableArray *dayIntensity;
@property (nonatomic, strong) NSMutableArray *monthIntensity;
@property (nonatomic, strong) NSMutableArray *yearIntensity;


- (void)getOrgasmsCountForStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;

- (void)setMonthDataForMonth:(int)month;
- (NSArray *)setYearDataForStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;

- (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end