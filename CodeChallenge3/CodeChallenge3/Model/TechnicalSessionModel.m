//
//  TechnicalSessionModel.m
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/4/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TechnicalSessionModel.h"
#import "IOHandler.h"
#import "TalkModel.h"
#import "NSDateFormatter+DateTimeFormatter.h"

@implementation TechnicalSessionModel
@synthesize canBeExtended, extensionAllowed, hasEmptySlot, talksList, remainingDuration, currentMarker;


- (id)initWithBaseSession:(SessionModel *)base canBeExtended:(BOOL)extensionflag extensionAllowed:(NSTimeInterval)extension {
    self = [super initSession:base.sessiontype openingTime:base.openingTime closingTime:base.closingTime];
    if (self != nil) {
        self.hasEmptySlot = TRUE;
        self.canBeExtended = extensionflag;
        self.extensionAllowed = extension;
        self.currentMarker = self.openingTime;
        self.remainingDuration = [NSDateFormatter timeDifference:self.openingTime endTime:self.closingTime extension:self.extensionAllowed];
        
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(remainingDuration)) options:NSKeyValueObservingOptionNew context:NULL];
        
        if (!self.talksList) self.talksList = [[NSMutableArray alloc] init];
        
    }
    
    
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(remainingDuration))]) {
        
        NSLog(@"Update Session Status whenever any new talk gets added or removed");
        
        if(remainingDuration >= 0)
            self.hasEmptySlot=TRUE;
        else
            self.hasEmptySlot=FALSE;
        
    }
}






- (BOOL)addTalkToSession:(TalkModel *)talk{
    if (talk.talkDurationInMins <= self.remainingDuration)
    {
        [talk markAsScheduled:self.currentMarker];
        self.currentMarker = [self.currentMarker dateByAddingTimeInterval:talk.talkDurationInMins*60];
        
        self.remainingDuration = self.remainingDuration - talk.talkDurationInMins;
        
        //self.remainingDuration = [NSDateFormatter timeDifference:self.currentMarker endTime:self.closingTime extension:self.extensionAllowed];
        

        [self.talksList addObject:talk];
        return TRUE;
    }
    else
    {
        NSLog(@"Unable to add talk to current session");
        return FALSE;
    }
}

- (void)removeTalkFromSession:(TalkModel *)talk{
    [self.talksList removeObject:talk];
    //self.remainingDuration = self.remainingDuration + talk.talkDurationInMins;
    self.currentMarker = [self.currentMarker dateByAddingTimeInterval:-1*talk.talkDurationInMins*60];
}

-(NSString*) print{
    
    if ([self.talksList count] == 0){
        return @"";
    }
    
    NSMutableString *outputStr = [NSMutableString string];
    
    for ( id element in self.talksList) {
        if ([element isKindOfClass:[TalkModel class]]){
            TalkModel *talk = (TalkModel *)element;
            [outputStr appendString:[NSString stringWithFormat:@"%@",[talk print]]];
        }
    }
    return [NSString stringWithString:outputStr];
}


@end
