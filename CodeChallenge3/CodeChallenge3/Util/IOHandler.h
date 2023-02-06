//
//  IOHandler.h
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/3/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#ifndef IOHandler_h
#define IOHandler_h

/**
 * IOHandler handles input output data from this program. It provides methods to read input from console, parse the input to create a list of talks to be scheduled and to write final tracks on console
 *
 */

@interface IOHandler : NSObject


/**
 * Read from console text with talks data to be scheduled; Enter two empty lines to denote EOF.
 *
 * @return NSString with text read from console
 *
 */

-(NSString*) readInputScheduleFromConsole;

/**
 * Parse text read from Console to seperate title and duration and get a list of talks
 *
 * @param inputText - Input string read from console
 * @return Array List of talks
 *
 */

-(NSArray *) parseInputSchedule:(NSString*) inputText;

/**
 * Writes final output schedule into console
 *
 * @param trackList - List of tracks with talks
 *
 */
-(void) writeOutputScheduleToConsole:(NSArray*)trackList;

   
@end


#endif /* IOHandler_h */
