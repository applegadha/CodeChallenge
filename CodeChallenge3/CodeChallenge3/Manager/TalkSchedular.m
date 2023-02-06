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
        NSLog(@"Elements not matching condition: %@", subset);
        TrackModel *track = [[TrackModel alloc] initTrack];
        for (id obj in subset)
            [track addTalkToTrack:obj];
        
        [self.tracks addObject:track];
    }
    
    [self scheduleTalksIntoTracks:subset];
}


@end
