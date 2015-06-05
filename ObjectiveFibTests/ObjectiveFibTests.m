//
//  ObjectiveFibTests.m
//  ObjectiveFibTests
//
//  Created by Rick Windham on 6/2/15.
//  Copyright (c) 2015 Rick Windham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Fibber.h"

@interface ObjectiveFibTests : XCTestCase
@property (strong, nonatomic) Fibber *fibber;
@end

@implementation ObjectiveFibTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _fibber = [[Fibber alloc] init];
    [_fibber loadTestData];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
// the Diamond option
- (void)testFib {
    for (int i=0; i<40; i++) {
        XCTAssertEqual([_fibber fib:i], [_fibber getFibFor:i]);
    }
}

- (void)testFibber {
    for (int i=0; i<40; i++) {
        XCTAssertEqual([_fibber tellAFib:i], [_fibber getFibFor:i]);
    }
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
