//
//  talkSchedular.m
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/7/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TalkSchedular.h"

@interface talkSchedular : XCTestCase
{
    TalkSchedular *talkschedular;
}
@end

@implementation talkSchedular

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    talkschedular = [TalkSchedular current];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testScheduleTalksCount {
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++){
        TalkModel *tm = [[TalkModel alloc] init];
        tm.talkStartTime = [NSDate dateWithTimeIntervalSinceReferenceDate:i*600];
        tm.isLightning = FALSE;
        tm.talkTitle = [NSString stringWithFormat:@"Talk %d",i];
        [temp addObject:tm];
    }
    
    [talkschedular scheduleTalksIntoTracks:temp];
    
    int count = 0;
    for (id element in talkschedular.tracks){
        count = count + [element countTalksInTrack];
    }
    XCTAssertEqual(10, count, "Talks count doesn't match");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (int i = 0; i < 100; i++){
            TalkModel *tm = [[TalkModel alloc] init];
            tm.talkStartTime = [NSDate dateWithTimeIntervalSinceReferenceDate:i*600];
            tm.isLightning = FALSE;
            tm.talkTitle = [NSString stringWithFormat:@"Talk %d",i];
            [temp addObject:tm];
        }
        
        [talkschedular scheduleTalksIntoTracks:temp];
    }];
}

@end
