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

@property (nonatomic, strong) NSArray *day;
@property (nonatomic, strong) NSArray *month;
@property (nonatomic, strong) NSArray *year;

@property (nonatomic, strong) NSArray *dayCount;
@property (nonatomic, strong) NSArray *monthCount;
@property (nonatomic, strong) NSArray *yearCount;

@property (nonatomic, strong) NSArray *dayIntensity;
@property (nonatomic, strong) NSArray *monthIntensity;
@property (nonatomic, strong) NSArray *yearIntensity;


- (NSArray *)setDayDataForStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;
- (NSArray *)setMonthDataForStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;
- (NSArray *)setYearDataForStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;

- (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end