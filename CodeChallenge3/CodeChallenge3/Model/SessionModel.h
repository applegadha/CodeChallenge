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



@protocol SessionProtocol <NSObject>

@property (nonatomic, assign) int remainingDuration;
@property (nonatomic, strong) NSMutableArray *talksList;
@property (nonatomic,strong)  NSDate *currentMarker;

-(BOOL)addTalkToSession:(TalkModel *)talk;
-(NSString *) print;

@end

/**
 * SessionModel is a  model class for session within Tracks.  *
 * Every Session should have a opening time and closing time. hasEmptySlot keeps a flag to check if session has empty slots if any.
 */


@interface SessionModel : NSObject <SessionProtocol>

@property (nonatomic,readonly) SessionType sessiontype;
@property (nonatomic,strong) NSDate *openingTime;
@property (nonatomic,strong) NSDate *closingTime;
@property (nonatomic, assign) NSTimeInterval extensionMins;
@property (nonatomic, assign) BOOL hasEmptySlot;
@property (nonatomic, assign) BOOL canBeExtended;
@property (nonatomic, strong) NSString *sessionTitle;

/**
 * Initializes a session by setting its opening and closing time. By default, new session is not open for booking. subclasses should overide and open it for booking.
 *
 * returns self
 *
 */

- (id)initSession:(SessionType)type openingTime:(NSDate *)opensAt closingTime:(NSDate *)closesAt canBeExtendedBy:(NSTimeInterval) extensionMins;

-(BOOL) isTechSession;

@end

#endif /* SessionModel_h */
