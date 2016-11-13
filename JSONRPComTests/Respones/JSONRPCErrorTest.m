//
//  JSONRPCErrorTest.m
//  JSONRPCom
//
//  Created by andrew batutin on 11/12/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JSONRPCErrorResponse.h"
#import "MTLJSONAdapter+Utils.h"

@interface JSONRPCErrorTest : XCTestCase

@end

@implementation JSONRPCErrorTest

- (void)testErrorSerializationSuccess{
    //{"jsonrpc": "2.0", "error": {"code": -32601, "message": "Method not found"}, "id": "1"}
    NSDictionary* dict =@{@"jsonrpc":@"2.0", @"error": @{@"code": @-32601, @"message": @"Method not found"}, @"id": @"1"};
    NSError* error = nil;
    JSONRPCErrorResponse* sut = [MTLJSONAdapter modelOfClass:[JSONRPCErrorResponse class] fromJSONDictionary:dict error:&error];
    XCTAssertNil(error);
    XCTAssertTrue([sut.version isEqualToString:dict[@"jsonrpc"]]);
    XCTAssertTrue([sut.jrpcId isEqualToString:dict[@"id"]]);
    XCTAssertTrue([[MTLJSONAdapter JSONDictionaryFromModelNoNil:sut.error error:nil] isEqual:dict[@"error"]]);
}

- (void)testErrorDeSerializationSuccess{
    //{"jsonrpc": "2.0", "error": {"code": -32601, "message": "Method not found"}, "id": "1"}
    NSDictionary* dict =@{@"jsonrpc":@"2.0", @"error": @{@"code": @-32601, @"message": @"Method not found"}, @"id": @"1"};
    NSError* error = nil;
    JSONRPCErrorResponse* sut = [MTLJSONAdapter modelOfClass:[JSONRPCErrorResponse class] fromJSONDictionary:dict error:&error];
    error = nil;
    NSDictionary* realResult = [MTLJSONAdapter JSONDictionaryFromModelNoNil:sut error:&error];
    XCTAssertNil(error);
    XCTAssertEqualObjects(dict, realResult);
}

- (void)testErrorInitSuccess{
    //{"jsonrpc": "2.0", "error": {"code": -32601, "message": "Method not found"}, "id": "1"}
    NSDictionary* dict =@{@"jsonrpc":@"2.0", @"error": @{@"code": @-32601, @"message": @"Method not found"}, @"id": @"1"};
    NSError* error = nil;
    JSONRPCErrorResponse* sut = [[JSONRPCErrorResponse alloc] initWithError:dict[@"error"] version:dict[@"jsonrpc"] jrpcId:dict[@"id"]];
    XCTAssertNil(error);
    XCTAssertTrue([sut.version isEqualToString:dict[@"jsonrpc"]]);
    XCTAssertTrue([sut.jrpcId isEqualToString:dict[@"id"]]);
    XCTAssertTrue([sut.error isEqual:dict[@"error"]]);
}


@end
