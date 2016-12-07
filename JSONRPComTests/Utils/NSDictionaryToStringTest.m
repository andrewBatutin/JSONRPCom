//
//  NSDictionaryToStringTest.m
//  JSONRPCom
//
//  Created by andrew batutin on 12/6/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+ToString.h"

@interface NSDictionaryToStringTest : XCTestCase

@end

@implementation NSDictionaryToStringTest

- (void)testToStringConverionSuccess{
    NSString* input = @"{\"jsonrpc\":\"2.0\", \"method\": \"subtract\", \"params\": [42, 23], \"id\": 1}";
    NSDictionary* sut = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23], @"id": @1};
    
    NSDictionary* expectedResult = [NSJSONSerialization JSONObjectWithData:[input dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    NSDictionary* result = [NSJSONSerialization JSONObjectWithData:[[sut toJsonStringWithError:nil] dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    
    XCTAssertEqualObjects(expectedResult, result);
}

@end
