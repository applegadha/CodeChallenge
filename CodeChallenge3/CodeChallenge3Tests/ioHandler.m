//
//  ioHandler.m
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/7/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IOHandler.h"

@interface ioHandler : XCTestCase{
IOHandler *iohandler;
}
@end

@implementation ioHandler

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    iohandler = [[IOHandler alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testParseInputScheduleForNULL {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSArray *actual = [iohandler parseInputSchedule:nil];
    XCTAssertEqual(actual,nil);
    
}

- (void)testParseInputScheduleForBadFormat {
    // This is an example of a functional test case.
    NSString *sampleTalk = @"Sample Talk \n Sample Talk";
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSArray *actual = [iohandler parseInputSchedule:sampleTalk];
    XCTAssertEqual(actual,nil);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
