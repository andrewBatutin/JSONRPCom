//
//  JSONRPCNotificationTest.m
//  JSONRPCom
//
//  Created by andrew batutin on 11/13/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <XCTest/XCTest.h>
#include "JSONRPCNotification.h"

@interface JSONRPCNotificationTest : XCTestCase

@end

@implementation JSONRPCNotificationTest

- (void)testNotificationSerializationSuccess{
    //{"jsonrpc": "2.0", "method": "subtract", "params": [42, 23], "id": 1}
    NSDictionary* dict = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23]};
    NSError* error = nil;
    JSONRPCNotification* sut = [MTLJSONAdapter modelOfClass:[JSONRPCNotification class] fromJSONDictionary:dict error:&error];
    XCTAssertNil(error);
    XCTAssertTrue([sut.method isEqualToString:dict[@"method"]]);
    XCTAssertTrue([sut.version isEqualToString:dict[@"jsonrpc"]]);
    XCTAssertTrue([sut.params isEqualToArray:dict[@"params"]]);
}

- (void)testNotificationDeSerializationSuccess{
    //{"jsonrpc": "2.0", "method": "subtract", "params": [42, 23], "id": 1}
    NSDictionary* dict = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23]};
    NSError* error = nil;
    JSONRPCNotification* sut = [MTLJSONAdapter modelOfClass:[JSONRPCNotification class] fromJSONDictionary:dict error:&error];
    NSDictionary* realResult = [MTLJSONAdapter JSONDictionaryFromModel:sut error:&error];
    XCTAssertNil(error);
    XCTAssertEqualObjects(dict, realResult);
}

- (void)testInitSuccesfull{
    NSDictionary* dict = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23], @"id": @"1"};
    JSONRPCNotification* sut = [[JSONRPCNotification alloc] initWithMethod:dict[@"method"] params:dict[@"params"] version:dict[@"jsonrpc"]];
    XCTAssertNotNil(sut);
    XCTAssertTrue([sut.method isEqualToString:dict[@"method"]]);
    XCTAssertTrue([sut.version isEqualToString:dict[@"jsonrpc"]]);
    XCTAssertTrue([sut.params isEqualToArray:dict[@"params"]]);
}

@end
