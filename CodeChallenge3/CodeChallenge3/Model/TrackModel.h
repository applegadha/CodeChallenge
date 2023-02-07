//
//  TrackModel.h
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/3/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#ifndef TrackModel_h
#define TrackModel_h
#import "SessionModel.h"

/**
 * TrackModel is a model class for tracks. Every track has a list of sessions - Morning, Afternoon, Lunch and Networking, which gets created before talks are assigned to individual sessions
 *
 * @discussion
    addTalkToTrack - Adds a talk to this track object
 *  checkHasEMptySlots - Checks if any slot is still open in any of the sessions
 *  print - Handles the formatting required for printing this track information
 */


@interface TrackModel : NSObject 

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, strong) NSMutableArray<SessionModel *> *sessions;


/**
 * Initializes a track by creating placeholder sessions , with their opening, closing time and extension period.
 *
 * returns self
 *
 */

-(id) initTrack;

/**
 * Checks whether the track still has any empty slot for adding more talks
 *
 * @return True if there are empty slots, False otherwise
 *
 */

-(BOOL) checkHasEmptySlots;

/**
 * Adds a talk to this track based on available slot and marks talk as assigned, else does nothing
 *
 * @param talk - Talk Object
 *
 */

-(void) addTalkToTrack:(TalkModel *)talk;

/**
 * Prints Track with required output format. Traverses all sessions and each talks within sessions to create string
 *
 * @return NSString with scheduled track  details
 *
 */

- (NSString*) print;

/**
 * Counts total talks within this track across sessions
 *
 * @return count
 *
 */

- (int) countTalksInTrack;
@end


#endif /* TrackModel_h */
