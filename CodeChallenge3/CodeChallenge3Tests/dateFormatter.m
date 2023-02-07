//
//  dateFormatter.m
//  CodeChallenge3
//
//  Created by SHIVAM SINHA on 2/7/23.
//  Copyright © 2023 SHIVAM SINHA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDateFormatter+DateTimeFormatter.h"

@interface dateFormatter : XCTestCase

@end

@implementation dateFormatter

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDateFromTimeStringNil {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertNil([NSDateFormatter dateFromTimeString:nil]);
    
}

- (void)testDateFromTimeStringBadFormat {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertNil([NSDateFormatter dateFromTimeString:@"abc-09:00-am"]);
    XCTAssertNotNil([NSDateFormatter dateFromTimeString:@"09:00 am"]);
    XCTAssertNil([NSDateFormatter dateFromTimeString:@"2022-02-02T09:00:30 am"]);
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
