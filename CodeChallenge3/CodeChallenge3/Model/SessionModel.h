//
//  SessionModel.h
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/3/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#ifndef SessionModel_h
#define SessionModel_h
#import <Foundation/Foundation.h>

#import "TalkModel.h"

typedef enum Session_Types
{
    MORNING_SESSION,
    LUNCH_SESSION,
    AFTERNOON_SESSION,
    NETWORKING_SESSION
} SessionType;


/**
 * SessionModel is a base model class for session within Tracks. Session is an abstract class and objects of derived classes TechincalSession or BreakSession should be created.
 *
 * Every Session should have a opening time and closing time. hasEmptySlot keeps a flag to check if session has empty slots if any.
 */


@interface SessionModel : NSObject

@property (nonatomic,readonly) SessionType sessiontype;
@property (nonatomic,readonly) NSDate *openingTime;
@property (nonatomic,readonly) NSDate *closingTime;
@property (nonatomic, assign) BOOL hasEmptySlot;

/**
 * Initializes a session by setting its opening and closing time. By default, new session is not open for booking. subclasses should overide and open it for booking.
 *
 * returns self
 *
 */

- (id)initSession:(SessionType)type openingTime:(NSDate *)opensAt closingTime:(NSDate *)closesAt;

@end

#endif /* SessionModel_h */
