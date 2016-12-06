//
//  JSONRPCRequsetTest.m
//  JSONRPCom
//
//  Created by andrew batutin on 11/12/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JSONRPCRequst.h"

@interface JSONRPCRequestTest : XCTestCase

@end

@implementation JSONRPCRequestTest

- (void)testRequestSerializationSuccess{
    //{"jsonrpc": "2.0", "method": "subtract", "params": [42, 23], "id": 1}
    NSDictionary* dict = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23], @"id": @"1"};
    NSError* error = nil;
    JSONRPCRequst* sut = [MTLJSONAdapter modelOfClass:[JSONRPCRequst class] fromJSONDictionary:dict error:&error];
    XCTAssertNil(error);
    XCTAssertTrue([sut.method isEqualToString:dict[@"method"]]);
    XCTAssertTrue([sut.version isEqualToString:dict[@"jsonrpc"]]);
    XCTAssertTrue([sut.jrpcId isEqualToString:dict[@"id"]]);
    XCTAssertTrue([sut.params isEqualToArray:dict[@"params"]]);
}

- (void)testRequestDeSerializationSuccess{
    //{"jsonrpc": "2.0", "method": "subtract", "params": [42, 23], "id": 1}
    NSDictionary* dict = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23], @"id": @"1"};
    NSError* error = nil;
    JSONRPCRequst* sut = [MTLJSONAdapter modelOfClass:[JSONRPCRequst class] fromJSONDictionary:dict error:&error];
    NSDictionary* realResult = [MTLJSONAdapter JSONDictionaryFromModel:sut error:&error];
    XCTAssertNil(error);
    XCTAssertEqualObjects(dict, realResult);
}

- (void)testInitSuccesfull{
    NSDictionary* dict = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23], @"id": @"1"};
    JSONRPCRequst* sut = [[JSONRPCRequst alloc] initWithMethod:dict[@"method"] params:dict[@"params"] version:dict[@"jsonrpc"] jrpcId:dict[@"id"]];
    XCTAssertNotNil(sut);
    XCTAssertTrue([sut.method isEqualToString:dict[@"method"]]);
    XCTAssertTrue([sut.version isEqualToString:dict[@"jsonrpc"]]);
    XCTAssertTrue([sut.jrpcId isEqualToString:dict[@"id"]]);
    XCTAssertTrue([sut.params isEqualToArray:dict[@"params"]]);
}

@end
