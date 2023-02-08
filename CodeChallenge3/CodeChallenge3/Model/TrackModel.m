//
//  TrackModel.m
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/3/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrackModel.h"
#import "SessionModel.h"
#import "IOHandler.h"
#import "NSDateFormatter+DateTimeFormatter.h"
#import "constants.h"

@implementation TrackModel 
@synthesize sessions;

-(id) initTrack{
    self = [super init];
    if(self){
        //Morning Tech Session - 09:00 AM - 12:00 PM
        SessionModel *morning = [[SessionModel alloc] initSession:MORNING_SESSION openingTime:[NSDateFormatter dateFromTimeString:MORNING_OPENING_TIME] closingTime:[NSDateFormatter dateFromTimeString:MORNING_CLOSING_TIME] canBeExtendedBy:0];
        
        //Afternoon TechSession - 01:00 PM - 04:00 PM (extensible till 5 PM)
        SessionModel *afternoon = [[SessionModel alloc] initSession:AFTERNOON_SESSION openingTime:[NSDateFormatter dateFromTimeString:AFTERNOON_OPENING_TIME] closingTime:[NSDateFormatter dateFromTimeString:AFTERNOON_CLOSING_TIME] canBeExtendedBy:AFTERNOON_SESSION_EXTENSION_PERIOD];
        
        //Lunch Session - 12:00 PM - 1:00 PM
        SessionModel *lunch = [[SessionModel alloc] initSession:LUNCH_SESSION openingTime:[NSDateFormatter dateFromTimeString:LUNCH_OPENING_TIME] closingTime:[NSDateFormatter dateFromTimeString:LUNCH_CLOSING_TIME] canBeExtendedBy:0];
        
        //NETWORKING Session - 05:00 PM - 06:00 PM
        SessionModel *networking = [[SessionModel alloc] initSession:NETWORKING_SESSION openingTime:[NSDateFormatter dateFromTimeString:NETWORKING_OPENING_TIME] closingTime:[NSDateFormatter dateFromTimeString:NETWORKING_CLOSING_TIME] canBeExtendedBy:0];
        
        [afternoon addObserver:networking forKeyPath:NSStringFromSelector(@selector(currentMarker)) options:NSKeyValueObservingOptionNew context:NULL];
        
        if (! self.sessions)
            self.sessions = [NSMutableArray arrayWithObjects:morning,lunch,afternoon,networking, nil];
        
        
        
        //[self observeSessionStatusChange];
    }
    return self;
}

- (void)observeSessionStatusChange {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleSessionStatusChange:) name:@"SessionStatusChanged" object:nil];
}

- (void)handleSessionStatusChange:(NSNotification *)notification {
    SessionModel *session = (SessionModel *)notification.object;
    NSLog(@"Status changed: %d", session.hasEmptySlot);
}

-(BOOL) checkHasEmptySlots
{
    for (id object in self.sessions) {
        SessionModel *session = (SessionModel *)object;
        if (session.hasEmptySlot)
            return TRUE;
        else
            continue;
    }
    return FALSE;
}

-(void) addTalkToTrack:(TalkModel *)talk{
        for (SessionModel* object in self.sessions){
            NSLog(@"Adding talk to track");
            if ([object isTechSession] && [object hasEmptySlot] && !talk.assignedStatus)
                    [object addTalkToSession:talk];
        }
}


-(NSString*) print{
        if ([self.sessions count] == 0){
        return @"";
    }
    
    NSMutableString *outputStr = [NSMutableString string];
    
    for ( SessionModel* element in self.sessions) {
            [outputStr appendString:[element print]];
    }
    
    return [NSString stringWithString:outputStr];
}



- (int) countTalksInTrack{
    unsigned long count = 0;
    for (SessionModel* element in self.sessions) {
            count = count + [element.talksList count];
        }
    
    return (int)count;
}

@end
