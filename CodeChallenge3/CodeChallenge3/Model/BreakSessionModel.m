//
//  BreakSessionModel.m
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/5/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionModel.h"
#import "BreakSessionModel.h"
#import "NSDateFormatter+DateTimeFormatter.h"

@implementation BreakSessionModel
@synthesize sessionTitle, canBeExtended;

- (id)initWithBaseSession:(SessionModel *)base title:(NSString *)title
{
    self = [super initSession:base.sessiontype openingTime:base.openingTime closingTime:base.closingTime];
    if (self != nil) {
        self.canBeExtended = FALSE;
        self.hasEmptySlot = FALSE;
        self.sessionTitle = title;
    }
        return self;
}

- (NSString *) print
{
  return [NSString stringWithFormat:@"%@ %@ \n",[NSDateFormatter timeStringFromDate:self.openingTime],sessionTitle];
}

@end

