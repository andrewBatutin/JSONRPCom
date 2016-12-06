//
//  NSStringToJSONDictionaryTest.m
//  JSONRPCom
//
//  Created by andrew batutin on 12/6/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+ToJSONDictionary.h"

@interface NSStringToJSONDictionaryTest : XCTestCase

@end

@implementation NSStringToJSONDictionaryTest

- (void)testSuccessfulConvertion{
    NSDictionary* expectedResult = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23], @"id": @1};
    NSString* input = @"{\"jsonrpc\":\"2.0\", \"method\": \"subtract\", \"params\": [42, 23], \"id\": 1}";
    NSDictionary* realResult = [input toJSONDictionary];
    XCTAssertEqualObjects(expectedResult, realResult);
}

- (void)testInvalidJSONReturnsNil{
    NSString* input = @"}\"jsonrpc\":\"2.0\", \"method\": \"subtract\", \"params\": [42, 23], \"id\": 1}";
    NSDictionary* realResult = [input toJSONDictionary];
    XCTAssertNil(realResult);
}

- (void)testArrayJSONReturnsNil{
    NSString* input = @"[\"http://localhost:9000/chat\"]";
    NSDictionary* realResult = [input toJSONDictionary];
    XCTAssertNil(realResult);
}


@end
