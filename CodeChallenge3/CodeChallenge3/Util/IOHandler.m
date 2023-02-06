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

@implementation IOHandler



-(NSString*) readInputScheduleFromConsole{
    NSLog(@"Enter the program list; Add two empty line to signify the end");
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
        // Check for semi-colon:
    } while ([inputString rangeOfString:@"\n\n"].location == NSNotFound);
    
    return [inputString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}

-(void) writeOutputScheduleToConsole:(NSArray*)trackList
{
    
    if ([trackList count] == 0){
        return;
    }
    
    for ( id element in trackList) {
        if ([element isKindOfClass:[TrackModel class]]){
            TrackModel *track = (TrackModel *)element;
            NSLog(@"-----Track------\n%@",[track print]);
        }
    }
}


-(NSArray *) parseInputSchedule:(NSString*)inputText{
    //An mutable array to hold tasks list after parsing
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    
    NSArray *talks = [inputText componentsSeparatedByString: @"\n"];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9]+" options:NSRegularExpressionCaseInsensitive error:NULL];
    
    [talks enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL *stop) {
        
        TalkModel *talk = [[TalkModel alloc] init];
        
        NSArray *matches = [regex matchesInString:obj options:0 range:NSMakeRange(0, [obj length])];
        
        if ([matches count] > 0) {
            NSTextCheckingResult *result = [matches objectAtIndex:0];
            NSRange range = [result range];
            NSString *numberString = [obj substringWithRange:range];
            NSLog(@"The number in the string is: %d", numberString.intValue);
            talk.talkTitle = obj;
            talk.talkDurationInMins = numberString.intValue;
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
    return [mutableArray copy];

}


@end
