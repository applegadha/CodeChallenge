//
//  inputparser.m
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/3/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IOHandler.h"
#import "constants.h"
#import "TalkModel.h"
#import "TrackModel.h"

static IOHandler *current = nil;

@implementation IOHandler

+ (id)current {
    @synchronized(self) {
        if (current == nil)
            current = [[super alloc] init];
    }
    return current;
}

-(NSString*) readInputScheduleFromConsole{
    NSLog(@"Enter the text with the talk details; Press enter twice to denote end of text");
    
    NSFileHandle *inputFile = [NSFileHandle fileHandleWithStandardInput];
    NSMutableString *inputString = [NSMutableString string];
    
    do {
        // Read from stdin, check for EOF:
        NSData *data = [inputFile availableData];
        if ([data length] == 0) {
            NSLog(@"EOF");
            break;
        }
        // Convert to NSString, replace newlines by spaces, append to current input:
        NSMutableString *tmp = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [inputString appendString:tmp];
        // [tmp replaceOccurrencesOfString:@"\n\n" withString:@"" options:0 range:NSMakeRange(0, [tmp length])];
        
        // Check for two empty lines:
    } while ([inputString rangeOfString:@"\n\n"].location == NSNotFound);
    
    return [inputString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}

-(void) writeOutputScheduleToConsole:(NSArray*)trackList
{
    
    if ([trackList count] == 0){
        NSLog(@"No Talk to Schedule.");
    }
    
    NSMutableString *outputStr = [NSMutableString string];
    
    [trackList enumerateObjectsUsingBlock:^(id element, NSUInteger idx, BOOL *stop) {
        if ([element isKindOfClass:[TrackModel class]]){
            TrackModel *track = (TrackModel *)element;
            [outputStr appendString:[NSString stringWithFormat:@"\n----- Track %lu -----\n%@",idx+1,[track print]]];
        }
    }];
    
    NSLog(@"%@",[NSString stringWithString:outputStr]);
    
}




@end
