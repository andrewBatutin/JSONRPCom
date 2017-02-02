//
//  JSONRPCSerializationTest.m
//  JSONRPCom
//
//  Created by andrew batutin on 12/7/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JSONRPCSerialization.h"
#import "NSString+ToJSONDictionary.h"

@interface JSONRPCSerializationTest : XCTestCase

@end

@implementation JSONRPCSerializationTest

- (void)testSuccessfulRequestSerialization{
    NSString* expectedResult = @"{\"jsonrpc\": \"2.0\", \"method\": \"subtract\", \"params\": [42, 23], \"id\": \"1\"}";
    NSDictionary* dict = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23], @"id": @"1"};
    NSError* error = nil;
    JSONRPCRequest* entity = [MTLJSONAdapter modelOfClass:[JSONRPCRequest class] fromJSONDictionary:dict error:nil];
    NSString* realResult = [JSONRPCSerialization serializeEntity:entity withError:&error];
    XCTAssertEqualObjects([expectedResult toJSONDictionaryWithError:nil], [realResult toJSONDictionaryWithError:nil]);
}

- (void)testSuccessfulResponseSerialization{
    NSString* expectedResult = @"{\"jsonrpc\": \"2.0\", \"result\": 19, \"id\": \"1\"}";
    NSDictionary* dict = @{@"jsonrpc":@"2.0", @"result":@19, @"id":@"1"};
    NSError* error = nil;
    JSONRPCResponse* entity = [MTLJSONAdapter modelOfClass:[JSONRPCResponse class] fromJSONDictionary:dict error:nil];
    NSString* realResult = [JSONRPCSerialization serializeEntity:entity withError:&error];
    XCTAssertEqualObjects([expectedResult toJSONDictionaryWithError:nil], [realResult toJSONDictionaryWithError:nil]);
}

- (void)testSuccessfulNotificationSerialization{
    NSString* expectedResult = @"{\"jsonrpc\": \"2.0\", \"method\": \"subtract\", \"params\": [42, 23]}";
    NSDictionary* dict = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23]};
    NSError* error = nil;
    JSONRPCNotification* entity = [MTLJSONAdapter modelOfClass:[JSONRPCNotification class] fromJSONDictionary:dict error:nil];
    NSString* realResult = [JSONRPCSerialization serializeEntity:entity withError:&error];
    XCTAssertEqualObjects([expectedResult toJSONDictionaryWithError:nil], [realResult toJSONDictionaryWithError:nil]);
}

- (void)testSuccessfulErrorResponseSerialization{
    NSString* expectedResult = @"{\"jsonrpc\": \"2.0\", \"error\": {\"code\": -32601, \"message\": \"Method not found\", \"data\" : null}, \"id\": null}";
    NSDictionary* dict = @{@"jsonrpc":@"2.0", @"error": @{@"code": @(-32601), @"message": @"Method not found", @"data":[NSNull null]}, @"id":[NSNull null]};
    NSError* error = nil;
    JSONRPCErrorResponse* entity = [MTLJSONAdapter modelOfClass:[JSONRPCErrorResponse class] fromJSONDictionary:dict error:nil];
    NSString* realResult = [JSONRPCSerialization serializeEntity:entity withError:&error];
    XCTAssertEqualObjects([expectedResult toJSONDictionaryWithError:nil], [realResult toJSONDictionaryWithError:nil]);
}


@end
