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
#import "TechnicalSessionModel.h"
#import "BreakSessionModel.h"
#import "IOHandler.h"
#import "NSDateFormatter+DateTimeFormatter.h"
#import "constants.h"

@implementation TrackModel 
@synthesize sessions;

-(id) initTrack{
    self = [super init];
    if(self){
        //Morning Tech Session - 09:00 AM - 12:00 PM
        SessionModel *morning = [[SessionModel alloc] initSession:MORNING_SESSION openingTime:[NSDateFormatter dateFromTimeString:MORNING_OPENING_TIME] closingTime:[NSDateFormatter dateFromTimeString:MORNING_CLOSING_TIME]];
        
        TechnicalSessionModel *morningTechSession = [[TechnicalSessionModel alloc] initWithBaseSession:morning canBeExtended:FALSE extensionAllowed:0];
    
        //Afternoon TechSession - 01:00 PM - 04:00 PM (extensible till 5 PM)
        
        SessionModel *afternoon = [[SessionModel alloc] initSession:AFTERNOON_SESSION openingTime:[NSDateFormatter dateFromTimeString:AFTERNOON_OPENING_TIME] closingTime:[NSDateFormatter dateFromTimeString:AFTERNOON_CLOSING_TIME]];
        
        TechnicalSessionModel *afternoonTechSession = [[TechnicalSessionModel alloc] initWithBaseSession:afternoon canBeExtended:TRUE extensionAllowed:AFTERNOON_SESSION_EXTENSION_PERIOD];
        
        SessionModel *lunch = [[SessionModel alloc] initSession:LUNCH_SESSION openingTime:[NSDateFormatter dateFromTimeString:LUNCH_OPENING_TIME] closingTime:[NSDateFormatter dateFromTimeString:LUNCH_CLOSING_TIME]];
        
        BreakSessionModel *lunchBreakSession = [[BreakSessionModel alloc] initWithBaseSession:lunch title:@"LUNCH"];
        
        SessionModel *networking = [[SessionModel alloc] initSession:NETWORKING_SESSION openingTime:[NSDateFormatter dateFromTimeString:NETWORKING_OPENING_TIME] closingTime:[NSDateFormatter dateFromTimeString:NETWORKING_CLOSING_TIME]];
        
        BreakSessionModel *networkingBreakSession = [[BreakSessionModel alloc] initWithBaseSession:networking title:@"NETWORKING"];
        
        
        
        if (! self.sessions)
            self.sessions = [NSMutableArray arrayWithObjects:morningTechSession,lunchBreakSession,afternoonTechSession,networkingBreakSession, nil];
        
        [self observeSessionStatusChange];    
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
    if ([self checkHasEmptySlots]){
        for (id object in self.sessions){
            if ([object isKindOfClass:[TechnicalSessionModel class]]){
                TechnicalSessionModel *techsession = (TechnicalSessionModel *)object;
                if ([techsession hasEmptySlot] && !talk.assignedStatus)
                    [techsession addTalkToSession:talk];

                    }
        }
    }
}


-(NSString*) print{
        if ([self.sessions count] == 0){
        return @"";
    }
    
    NSMutableString *outputStr = [NSMutableString string];
    
    for ( id element in self.sessions) {
        if ([element isKindOfClass:[TechnicalSessionModel class]]){
            TechnicalSessionModel *session = (TechnicalSessionModel *)element;
            [outputStr appendString:[session print]];
        }
        
        else if ([element isKindOfClass:[BreakSessionModel class]]){
            BreakSessionModel *session = (BreakSessionModel *)element;
            [outputStr appendString:[session print]];
        }
    }
    return [NSString stringWithString:outputStr];
}

@end
