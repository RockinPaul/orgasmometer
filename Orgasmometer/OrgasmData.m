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
    
    self.month = [[NSMutableArray alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:@"Orgasm"];
    //[query fromLocalDatastore];
    [query whereKey:@"user" equalTo:[PFUser currentUser]];

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            [PFObject pinAll:objects];
            NSLog(@"%lu dates", (unsigned long)[self.dates count]);
            for (NSDate* date in self.dates) {
                int i = 0;
                for (PFObject *object in objects) {
                    if ([self onlyDateFromDate:object.createdAt] == [self onlyDateFromDate:date]) {
                        NSLog(@"%i YES", i);
                        i++;
                    }
                }
                [self.month addObject:[NSNumber numberWithInt:i]];
            }
            NSLog(@"%lu", (unsigned long)[objects count]);
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        NSLog(@"%@", [self.month description]);
    }];
}


-  (void)setMonthDataForMonth:(int)month {
    
    self.dates = [[NSMutableArray alloc] init];
    
    // TODO: ADD YEAR CONTROLL
    NSDate *loopDate = [self dateWithYear:2015 month:month day:0]; // the start date you are looping from
    NSDate *endDate;
    
    // Changing days number in month
    if ((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10) || (month == 12)) {
       endDate = [self dateWithYear:2015 month:month day:31];
    } else if (month == 2) {
        endDate = [self dateWithYear:2015 month:month day:28];
    } else {
        endDate = [self dateWithYear:2015 month:month day:30];
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
        NSLog(@"%i", i);
        [self.dates addObject:loopDate];
        i++;
    }
    
    // Parse including
    [self getOrgasmsCountForStartDate:loopDate andEndDate:loopDate];

}

- (NSDate *)onlyDateFromDate:(NSDate *)date {
    unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSDateComponents* components = [calendar components:flags fromDate:date];
    NSDate* dateOnly = [calendar dateFromComponents:components];
    
    return dateOnly;
}
     
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

- (void)dealloc {
    // implement -dealloc & remove abort() when refactoring for
    // non-singleton use.
    abort();
}


@end
