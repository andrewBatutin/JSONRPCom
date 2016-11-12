//
//  JSONRPCRequsetTest.m
//  JSONRPCom
//
//  Created by andrew batutin on 11/12/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JSONRPCRequset.h"

@interface JSONRPCRequestTest : XCTestCase

@end

@implementation JSONRPCRequestTest

- (void)testRequestSerializationSuccess{
    //{"jsonrpc": "2.0", "method": "subtract", "params": [42, 23], "id": 1}
    NSDictionary* dict = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23], @"id": @"1"};
    NSError* error = nil;
    JSONRPCRequset* sut = [MTLJSONAdapter modelOfClass:[JSONRPCRequset class] fromJSONDictionary:dict error:&error];
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
    JSONRPCRequset* sut = [MTLJSONAdapter modelOfClass:[JSONRPCRequset class] fromJSONDictionary:dict error:&error];
    NSDictionary* realResult = [MTLJSONAdapter JSONDictionaryFromModel:sut error:&error];
    XCTAssertNil(error);
    XCTAssertEqualObjects(dict, realResult);
}


@end
