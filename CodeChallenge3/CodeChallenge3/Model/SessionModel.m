//
//  SessionModel.m
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/3/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionModel.h"
#import "IOHandler.h"

@implementation SessionModel
@synthesize hasEmptySlot;

- (id)initSession:(SessionType)type openingTime:(NSDate *)opensAt closingTime:(NSDate *)closesAt {
    self = [super init];
    if (self != nil) {
        _sessiontype = type;
        _closingTime = closesAt;
        _openingTime = opensAt;

        self.hasEmptySlot = FALSE; //FALSE by default
    }
    
    return self;
}


- (void)handleTalkStatusChange:(NSNotification *)notification {
    TalkModel *talk = (TalkModel *)notification.object;
    NSLog(@"Talk Status changed: %d", talk.assignedStatus);
}


//- (void)addTalkToSession:(TalkModel *)talk;
//- (void)removeTalkFromSession:(TalkModel *)talk;
//- (NSArray *)getAssignedTalks;
//- (BOOL) isSessionOpen;
//- (int) getRemainingDuration;

@end
