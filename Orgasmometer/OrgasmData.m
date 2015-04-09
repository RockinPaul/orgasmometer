//
//  OrgasmData.m
//  Orgasmometer
//
//  Created by Pavel on 29.03.15.
//  Copyright (c) 2015 Zitech Mobile LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrgasmData.h"

@implementation OrgasmData

- (void)setYearData {
    
    self.year = [[NSMutableArray alloc] init];
    NSLog(@"%@",[self.year description]);
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]]; // current date
    long currentYear = [components year]; // current year
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        int nextMonth = 2;
        for (int i = 1; i < 12; i++) {
            
            NSDate *startDate = [self dateWithYear:currentYear month:i day:1];
            NSDate *endDate = [self dateWithYear:currentYear month:nextMonth day:1];
            nextMonth++;
            
            long orgasmsCount = [self getOrgasmsCountForStartDate:startDate andEndDate:endDate];
            [self.year addObject: [NSNumber numberWithLong:orgasmsCount]];
            
        }
        NSLog(@"%@", [self.year description]);
    });
}

- (long)getOrgasmsCountForStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Orgasm"];
    [query whereKey:@"createdAt" greaterThanOrEqualTo:startDate];
    [query whereKey:@"createdAt" lessThanOrEqualTo:endDate];
    NSLog(@"%lil start - %@, end - %@", (long)[query countObjects], startDate, endDate);
    return [query countObjects];
}


- (void)setMonthDataForMonth:(int)month {
    
    
    self.dates = [[NSMutableArray alloc] init];
    self.month = [[NSMutableArray alloc] init];
    [self.month addObject:[NSNumber numberWithInt:0]];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]]; // current date
    long currentYear = [components year]; // current year

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
    NSDate *loopDate = [self dateWithYear:currentYear month:month day:1]; // the start date you are looping from
    NSDate *endDate;
    
    // Select the days number in month
    if ((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10) || (month == 12)) {
       endDate = [self dateWithYear:currentYear month:month day:31];
    } else if (month == 2) {
        endDate = [self dateWithYear:currentYear month:month day:28];
    } else {
        endDate = [self dateWithYear:currentYear month:month day:30];
    }
    
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    currentCalendar.firstWeekday = 1; // Sunday
    [currentCalendar rangeOfUnit:NSCalendarUnitDay startDate:&loopDate interval:NULL forDate:loopDate];
    
    NSDateComponents *oneDay = [NSDateComponents new];
    oneDay.day = 1;
    
    int i = 2;
    while ([loopDate compare: endDate] == NSOrderedAscending) {
        loopDate = [currentCalendar dateByAddingComponents:oneDay toDate:loopDate options:0];
        // Do something with the date
        [self.dates addObject:loopDate];
        i++;
        
        NSDate *nextDay = [self dateWithYear:currentYear month:month day:i];
        NSNumber *numberForDates = [NSNumber numberWithLong:[self getOrgasmsCountForStartDate:loopDate andEndDate:nextDay]];
        [self.month addObject:numberForDates];
    }
    });
    NSLog(@"%@", [self.month description]);
}


// Return date without time
- (NSDate *)onlyDateFromDate:(NSDate *)date {
    unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSDateComponents* components = [calendar components:flags fromDate:date];
    NSDate* dateOnly = [calendar dateFromComponents:components];
    
    return dateOnly;
}

// Return NSDate object with target year, month and day
- (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    
    return [calendar dateFromComponents:components];
}


// Singleton implementation
+(OrgasmData *) sharedInstance {
    static dispatch_once_t pred;
    static OrgasmData *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[OrgasmData alloc] init];
    });
    return sharedInstance;
}


@end
