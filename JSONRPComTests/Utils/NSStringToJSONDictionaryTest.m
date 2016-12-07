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
    NSDictionary* realResult = [input toJSONDictionaryWithError:nil];
    XCTAssertEqualObjects(expectedResult, realResult);
}

- (void)testInvalidJSONReturnsNil{
    NSString* input = @"}\"jsonrpc\":\"2.0\", \"method\": \"subtract\", \"params\": [42, 23], \"id\": 1}";
    NSDictionary* realResult = [input toJSONDictionaryWithError:nil];
    XCTAssertNil(realResult);
}

- (void)testInvalidJSONReturnsError{
    NSString* input = @"}\"jsonrpc\":\"2.0\", \"method\": \"subtract\", \"params\": [42, 23], \"id\": 1}";
    NSError* error = nil;
    NSDictionary* realResult = [input toJSONDictionaryWithError:&error];
    XCTAssertNil(realResult);
    XCTAssertNotNil(error);
}

- (void)testArrayJSONReturnsNil{
    NSString* input = @"[\"http://localhost:9000/chat\"]";
    NSDictionary* realResult = [input toJSONDictionaryWithError:nil];
    XCTAssertNil(realResult);
}

- (void)testArrayJSONReturnsError{
    NSString* input = @"[\"http://localhost:9000/chat\"]";
    NSError* error = nil;
    NSDictionary* realResult = [input toJSONDictionaryWithError:&error];
    XCTAssertNil(realResult);
    XCTAssertNotNil(error);
}


@end
