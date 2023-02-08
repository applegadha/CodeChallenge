//
//  TalkSchedular.m
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/5/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TalkSchedular.h"
#import "TalkModel.h"
#import "TrackModel.h"
#import "constants.h"


static TalkSchedular *current = nil;

@implementation TalkSchedular


+ (id)current {
    @synchronized(self) {
        if (current == nil)
            current = [[super alloc] init];
    }
    return current;
}

- (id)init {
    if ((self = [super init])) {
        
        if (! self.tracks)
            self.tracks = [[NSMutableArray alloc] init];
        
    }
    return self;
}

/*
 This method takes a list of talks as Input and then recursively add talks to tracks, till all the talks get assigned
 */

-(void) scheduleTalksIntoTracks:(NSArray *)talksList{
    
    if ([talksList count] == 0){
        return;
    }
    
    NSMutableArray *subset = [NSMutableArray array];
    for (id obj in talksList){
        TalkModel *talk = (TalkModel *)obj;
        if (!talk.assignedStatus)
            [subset addObject:talk];
        
    }
    
    if ([subset count] == 0) {
        NSLog(@"All elements matched the condition");
        return;
    }
    else
    {
        NSLog(@"Elements not matching condition: %ld", [subset count]);
        TrackModel *track = [[TrackModel alloc] initTrack];
        for (id obj in subset)
            [track addTalkToTrack:obj];
        
        [self.tracks addObject:track];
    }
    
    [self scheduleTalksIntoTracks:subset];
}


-(NSArray *) parseInputText:(NSString*)inputText{
    
    if (!inputText)
        return nil;
    
    //An mutable array to hold tasks list after parsing
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    
    NSArray *talks = [inputText componentsSeparatedByString: @"\n"];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9]+[ ]*min" options:NSRegularExpressionCaseInsensitive error:NULL];
    
    [talks enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL *stop) {
        
        TalkModel *talk = [[TalkModel alloc] init];
        
        NSArray *matches = [regex matchesInString:obj options:0 range:NSMakeRange(0, [obj length])];
        
        if ([matches count] > 0) {
            NSTextCheckingResult *result = [matches objectAtIndex:0];
            NSRange range = [result range];
            
            //Ideally, we should use NSSScanner to first check if the string can be converted to int
            NSString *title = [obj substringToIndex:range.location];
            NSString *numberString = [obj substringWithRange:range];
            
            NSLog(@"The talk duration in the title %@ is : %d", numberString, numberString.intValue);
            talk.talkTitle = title;
            
            if (numberString.intValue > MAX_TALK_DURATION) {
                talk.talkDurationInMins = MAX_TALK_DURATION;
            } else {
                talk.talkDurationInMins = numberString.intValue;
            }
            
            talk.isLightning = FALSE;
            [mutableArray addObject:talk];
            
            
        } else if ([obj containsString:@"lightning"]){
            //Check for lightening talk instead
            NSLog(@"Talk title contains word lightning");
            talk.talkTitle = obj;
            talk.talkDurationInMins = 5;
            talk.isLightning = TRUE;
            [mutableArray addObject:talk];
            
        }
        else{
            NSLog(@"Neither duration nor lightning word found in %@",obj);
        }
    }];
    return mutableArray.count > 0 ? [mutableArray copy] : nil;
    
}



@end
