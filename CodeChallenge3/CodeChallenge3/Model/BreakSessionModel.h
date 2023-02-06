//
//  BreakSessionModel.h
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/5/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#ifndef BreakSessionModel_h
#define BreakSessionModel_h

@protocol BreakSessionProtocol <NSObject>
@property (nonatomic, assign) BOOL canBeExtended;
@property (nonatomic, retain) NSString *sessionTitle;
-(NSString *) print;
@end

/**
 * BreakSessionModel is a derived class of base class SessionModel. It is used to handle any logic related to break sessions like lunch/networking and should implement BreakSessionProtocol
 *
 */

@interface BreakSessionModel : SessionModel <BreakSessionProtocol>

- (id)initWithBaseSession:(SessionModel *)base title:(NSString *)title;

@end


#endif /* BreakSessionModel_h */
