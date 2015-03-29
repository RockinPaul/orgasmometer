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

- (void)getOrgasmsCountForStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate {
    
    // TEST OBJ
    startDate = [self dateWithYear:2015 month:3 day:22];
    endDate = [self dateWithYear:2015 month:3 day:30];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Orgasm"];
    //[query fromLocalDatastore];
    [query whereKey:@"user" equalTo:[PFUser currentUser]];
    [query whereKey:@"createdAt" greaterThan:startDate];
    [query whereKey:@"createdAt" lessThan:endDate];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            [PFObject pinAll:objects];
            NSLog(@"%lu", (unsigned long)[objects count]);
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

-  (void)setMonthDataForMonth:(int)month {
    
    // TODO: ADD YEAR CONTROLL
    NSDate *loopDate = [self dateWithYear:2015 month:month day:1]; // the start date you are looping from
    NSDate *endDate;
    
    // Changing days number in month
    if ((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10) || (month == 12)) {
       endDate = [self dateWithYear:2015 month:month day:31 + 1];
    } else if (month == 2) {
        endDate = [self dateWithYear:2015 month:month day:28 + 1];
    } else {
        endDate = [self dateWithYear:2015 month:month day:30 + 1];
    }
    
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    currentCalendar.firstWeekday = 1; // Sunday
    [currentCalendar rangeOfUnit:NSCalendarUnitDay startDate:&loopDate interval:NULL forDate:loopDate];
    
    NSDateComponents *oneDay = [NSDateComponents new];
    oneDay.day = 1;
    
    int i = 1;
    while ([loopDate compare: endDate] == NSOrderedAscending) {
        loopDate = [currentCalendar dateByAddingComponents:oneDay toDate:loopDate options:0];
        // Do something with the date
        NSLog(@"%@", loopDate);
        NSLog(@"%i", i++);
    }

}
     
- (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    return [calendar dateFromComponents:components];
}

@end
