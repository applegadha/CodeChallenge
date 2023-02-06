//
//  main.m
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/2/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IOHandler.h"
#import "TalkModel.h"
#import "TrackModel.h"
#import "TalkSchedular.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Code Challenge 3");
        IOHandler *ip = [[IOHandler alloc] init];
        
        //Read Text from Console, with talks data
        NSString* schedule = [ip readInputScheduleFromConsole];
        NSLog(@"User input schedule = %@", schedule);
        
        //Parse Input data to get a list of talks to be scheduled
        NSArray  *talkslist = [ip parseInputSchedule:schedule];
        
        //Schedule Talks into different tracks
        [[TalkSchedular current] scheduleTalksIntoTracks:talkslist];
        
        //Write Output Tracks into Console
        [ip writeOutputScheduleToConsole: [[TalkSchedular current] tracks]];
        
    }
    return 0;

}

