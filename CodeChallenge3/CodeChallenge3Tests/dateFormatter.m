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
{
NSDateFormatter *testFormatter;
}
@end

@implementation dateFormatter

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    testFormatter = [[NSDateFormatter alloc] init];
    [testFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    [testFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_IN"]];
    

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

- (void)testTimeStringFromDateNil {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertEqual(@"",[NSDateFormatter timeStringFromDate:nil]);
    
}

- (void)testTimeStringFromDateEqual {
    
    
    NSDate *capturedStartDate = [testFormatter dateFromString: @"2012-01-11 09:00:00 IST"];
    NSLog(@"Captured Date %@", [capturedStartDate description]);

    NSString *expected = [NSDateFormatter timeStringFromDate:capturedStartDate];
    //NSLog(@"returned value=  %@",expected);
    XCTAssertEqualObjects(@"09:00 AM",expected,@"String are not equal");
    
}

- (void)testTimeDifferenceCalculations {
    
    NSDate *date1 = [testFormatter dateFromString: @"2012-01-11 09:00:00 IST"];
    NSLog(@"Captured Date %@", [date1 description]);

    NSDate *date2 = [testFormatter dateFromString: @"2012-01-11 10:00:00 IST"];
    NSLog(@"Captured Date %@", [date2 description]);
    
    int expected = [NSDateFormatter timeDifference:date1 endTime:date2 extension:0];
    //NSLog(@"returned value=  %d",expected);
    XCTAssertEqual(60,expected,@"Time difference calculation is incorrect");
    
}

- (void)testTimeDifferenceCalculationsWithExtension {
    NSDate *date1 = [testFormatter dateFromString: @"2012-01-11 09:00:00 IST"];
    NSLog(@"Captured Date %@", [date1 description]);
    
    NSDate *date2 = [testFormatter dateFromString: @"2012-01-11 10:00:00 IST"];
    NSLog(@"Captured Date %@", [date2 description]);
    
    int expected = [NSDateFormatter timeDifference:date1 endTime:date2 extension:60];
    //NSLog(@"returned value=  %d",expected);
    XCTAssertEqual(120,expected,@"Time difference calculation is incorrect");
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
