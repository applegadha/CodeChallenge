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
#import "NSDateFormatter+DateTimeFormatter.h"
#import "TalkModel.h"

@implementation SessionModel
@synthesize hasEmptySlot, remainingDuration, talksList, currentMarker;

- (id)initSession:(SessionType)type openingTime:(NSDate *)opensAt closingTime:(NSDate *)closesAt canBeExtendedBy:(NSTimeInterval) extensionMins
{
    self = [super init];
    if (self != nil) {
        _sessiontype = type;
        _closingTime = closesAt;
        _openingTime = opensAt;
        _extensionMins = extensionMins;
        
        if (_extensionMins > 0)
            _canBeExtended = TRUE;
        else
            _canBeExtended = FALSE;
        
        self.hasEmptySlot = TRUE; //SET AS TRUE by default
        
        self.currentMarker = self.openingTime; //By default Current marker is positioned at session opening time
        
        self.remainingDuration = [NSDateFormatter timeDifference:self.openingTime endTime:self.closingTime extension:_extensionMins];
        
       // [self addObserver:self forKeyPath:NSStringFromSelector(@selector(remainingDuration)) options:NSKeyValueObservingOptionNew context:NULL];
        
        if (!self.talksList)
            self.talksList = [[NSMutableArray alloc] init];
        
    }
    
    return self;
}


//- (void)handleTalkStatusChange:(NSNotification *)notification {
//    TalkModel *talk = (TalkModel *)notification.object;
//    NSLog(@"Talk Status changed: %d", talk.assignedStatus);
//}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(currentMarker))]) {
        
        NSLog(@"New talk added to afternoon Session , adjust marker for networking session");
        
        SessionModel *afternoonsession = (SessionModel *)object;
        NSLog(@"%@ ----- %@",afternoonsession.currentMarker, self.currentMarker);
        
        if([afternoonsession.currentMarker timeIntervalSinceReferenceDate] > [self.currentMarker timeIntervalSinceReferenceDate])
            self.currentMarker = afternoonsession.currentMarker;
    }
}



- (BOOL)addTalkToSession:(TalkModel *)talk{
    @synchronized (talk){
    if (talk.talkDurationInMins <= self.remainingDuration)
    {
        [talk markAsScheduled:self.currentMarker];
        
        self.currentMarker = [self.currentMarker dateByAddingTimeInterval:talk.talkDurationInMins*60];
        
        self.remainingDuration = self.remainingDuration - talk.talkDurationInMins;
        
        if(remainingDuration > 0)
            self.hasEmptySlot=TRUE;
        else
            self.hasEmptySlot=FALSE;
        
        [self.talksList addObject:talk];
        return TRUE;
    }
    else
    {
        NSLog(@"Unable to add talk to current session");
        return FALSE;
    }
  }
}


- (void)removeTalkFromSession:(TalkModel *)talk{
    [self.talksList removeObject:talk];
    //self.remainingDuration = self.remainingDuration + talk.talkDurationInMins;
    self.currentMarker = [self.currentMarker dateByAddingTimeInterval:-1*talk.talkDurationInMins*60];
}


- (NSString*) getSessionTitle
{
    SessionType type = self.sessiontype;
    
    switch(type){
        case MORNING_SESSION:
            return @"MORNING SESSION";
            
        case LUNCH_SESSION:
            return @"LUNCH";
            
        case AFTERNOON_SESSION:
            return @"AFTERNOON SESSION";
            
        case NETWORKING_SESSION:
            return @"NETWORKING";
            
    }
    return @"";
}

-(BOOL) isTechSession{
    SessionType type = self.sessiontype;
    
    if (type == MORNING_SESSION | type == AFTERNOON_SESSION)
        return TRUE;
    return FALSE;
}


-(NSString*) print{
    
    
    NSMutableString *outputStr = [NSMutableString string];
    
    if ([self isTechSession]){
        
        for ( id element in self.talksList) {
            if ([element isKindOfClass:[TalkModel class]]){
                TalkModel *talk = (TalkModel *)element;
                [outputStr appendString:[NSString stringWithFormat:@"%@",[talk print]]];
            }
        }
    }
    else
    {
        [outputStr appendString:[NSString stringWithFormat:@"%@ %@ \n",[NSDateFormatter timeStringFromDate:self.currentMarker],[self getSessionTitle]]];
    }
    
    return [NSString stringWithString:outputStr];
}


@end
