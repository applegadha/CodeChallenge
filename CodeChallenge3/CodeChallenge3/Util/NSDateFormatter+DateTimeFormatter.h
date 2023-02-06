//
//  NSDateFormatter+DateTimeFormatter.h
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/6/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * DateTimeFormatter is a category that extends NSDateFormatter with static methods to format Date into the format we require for our program
 *
 * @discussion We require only certain components of Date object - mainly @"hh:mm a"
 */

@interface NSDateFormatter (DateTimeFormatter)

/**
 * dateFromTimeString converts a time string into NSDate format.
 * @param time - time in "hh:mm a" format like "09:00 AM"
 * @return NSDate - Date object
 *
 */

+ (NSDate *) dateFromTimeString:(NSString *)time;

/**
 * timeStringFromDate - Convert a Date object into time string.
 * @param date - A NSDate object
 * @return NSString - String with time format
 *
 */

+ (NSString *) timeStringFromDate:(NSDate *)date;

/**
 * Calculates time difference between start time and end time objects, taking into consideration extendedtime, if there.
 *
 * @param startTime - Date Object which represents startTime
 * @param endTime - Date Object which represents endTime
 * extendedTime - Extension (in mins) from endTime
 * @return int time difference in mins.
 *
 */

+ (int) timeDifference:(NSDate *)startTime endTime:(NSDate *)endTime extension:(NSTimeInterval)extendedTime;


@end
