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

- (NSArray *)setDayDataForStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate {
    
    self.day = [[NSArray alloc] init];
    
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
    
    return self.day;
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
