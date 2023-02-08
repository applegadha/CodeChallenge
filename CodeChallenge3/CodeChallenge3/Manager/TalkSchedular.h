//
//  TalkSchedular.h
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/5/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#ifndef TalkSchedular_h
#define TalkSchedular_h
#import "TalkModel.h"
#import "TrackModel.h"

/**
 * TalkSchedular is a singleton class that schedules talks into tracks, and maintains final list of tracks
 *
 * @discussion tracks - Array to store final tracks, which will have talks
 */

@interface TalkSchedular : NSObject
@property (nonatomic, strong) NSMutableArray<TrackModel *> *tracks;


/**
 * Singleton nethod to get only instance of TalkSchedular
 *
 *
 */

+ (id)current;

/**
 * Schedule Talks into tracks and populates tracks Array.
 *
 * @param talksList List of talks to be scheduled
 *
 */
-(void) scheduleTalksIntoTracks:(NSArray *)talksList;

/**
 * Parse text read from Console to seperate title and duration and get a list of talks
 *
 * @param inputText - Input string read from console
 * @return Array List of talks
 *
 */

-(NSArray *) parseInputText:(NSString*) inputText;

@end

#endif /* TalkSchedular_h */
