//
//  TechnicalSessionModel.h
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/4/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#ifndef TechnicalSessionModel_h
#define TechnicalSessionModel_h
#import "TalkModel.h"
#import "SessionModel.h"

@protocol TechSessionProtocol <NSObject>

@property (nonatomic, assign) BOOL canBeExtended;
@property (nonatomic, assign) NSTimeInterval extensionAllowed;
@property (nonatomic, assign) int remainingDuration;
@property (nonatomic, retain) NSMutableArray *talksList;
@property (nonatomic,strong)  NSDate *currentMarker;

-(BOOL)addTalkToSession:(TalkModel *)talk;
-(NSString *) print;

@end

/**
 * TechnicalSessionModel is a derived class of base class SessionModel. It is used to add talks into technical sessions
 * Should implement TechSessionProtocol to provide methods to add talk to Session and print talk details
 *
 */

@interface TechnicalSessionModel : SessionModel <TechSessionProtocol>

- (id)initWithBaseSession:(SessionModel *)base canBeExtended:(BOOL)extensionflag extensionAllowed:(NSTimeInterval)extension;

@end

#endif /* TechnicalSessionModel_h */
