//
//  NSDateFormatter+DateTimeFormatter.m
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/6/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#import "NSDateFormatter+DateTimeFormatter.h"

@implementation NSDateFormatter (DateTimeFormatter)

+ (NSDate *) dateFromTimeString:(NSString *)time{
    
    if(!time)
        return nil;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"hh:mm a";
    NSDate* date = [dateFormatter dateFromString:time];
    if (date == nil)
        return nil;
    return date;
}


+ (NSString *) timeStringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"hh:mm a";
    if (date == nil)
        return @"";
    
    return [dateFormatter stringFromDate:date];
}

+ (int) timeDifference:(NSDate *)startTime endTime:(NSDate *)endTime extension:(NSTimeInterval)extendedTime{
    NSTimeInterval secs = [endTime timeIntervalSinceDate:startTime];
    return secs/60 + extendedTime;
}




@end
