//
//  TalkModel.h
//  CodeChallenge3
//
// A simple model class to store talk properties
//  Created by SHIVAM SINHA on 2/2/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#ifndef TalkModel_h
#define TalkModel_h

#import <Foundation/Foundation.h>

/**
 *  Talk is a model class for individual talks. Every talk has properties like duration, title, lightning talk, assignedstatus.
 *
 * @discussion
 *  markAsScheduled - When a talk gets scheduled into a session, it is marked as assigned
 *  talkDurationInMins - If Lightning is 5 mins else is extracted from the talk title input by user
 *  print - Handles the formatting required for printing this talk information
 */

@interface TalkModel : NSObject

@property (nonatomic,retain) NSString *talkTitle;
@property (nonatomic,strong) NSDate  *talkStartTime;
@property (nonatomic,assign) int  talkDurationInMins;
@property (nonatomic,assign) BOOL  isLightning;
@property (nonatomic,assign) BOOL assignedStatus;

-(id) init;
-(NSString *) print;
-(void) markAsScheduled:(NSDate*) startTime;
@end


#endif /* TalkModel_h */
