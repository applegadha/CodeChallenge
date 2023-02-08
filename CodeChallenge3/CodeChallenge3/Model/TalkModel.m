//
//  TalkModel.m
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/2/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#import "TalkModel.h"
#import "NSDateFormatter+DateTimeFormatter.h"

@implementation TalkModel

@synthesize talkTitle, talkDurationInMins, isLightning, assignedStatus, talkStartTime;

-(id) init{
    self = [super init];
    if (self != nil)
    {
        self.assignedStatus = FALSE;
    }
    return self;
        
}

-(void) markAsScheduled:(NSDate*) startTime{
    NSLog(@"mark talk as assigned");
    self.talkStartTime = startTime;
    self.assignedStatus = TRUE;
}

-(NSString *) print{
    return [NSString stringWithFormat:@"%@ %@ %dmin \n", [NSDateFormatter timeStringFromDate:self.talkStartTime],talkTitle, talkDurationInMins];
}


@end
