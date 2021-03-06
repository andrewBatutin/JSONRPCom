//
//  JSONRPCResponseTest.m
//  JSONRPCom
//
//  Created by Andrew Batutin on 11/12/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JSONRPCResponse.h"
#import "MTLJSONAdapter+Utils.h"

@interface JSONRPCResponseTest : XCTestCase

@end

@implementation JSONRPCResponseTest

- (void)testResponseSerializationSuccess{
    //{"jsonrpc": "2.0", "result": 19, "id": 1}
    NSDictionary* dict =@{@"jsonrpc":@"2.0", @"result": @19, @"id": @"1"};
    NSError* error = nil;
    JSONRPCResponse* sut = [MTLJSONAdapter modelOfClass:[JSONRPCResponse class] fromJSONDictionary:dict error:&error];
    XCTAssertNil(error);
    XCTAssertTrue([sut.version isEqualToString:dict[@"jsonrpc"]]);
    XCTAssertTrue([sut.jrpcId isEqualToString:dict[@"id"]]);
    XCTAssertTrue([sut.result isEqual:dict[@"result"]]);
}

- (void)testResponseSerializationForErrorResponseSuccess{
    //{"jsonrpc": "2.0", "result": 19, "id": 1}
    NSDictionary* dict =@{@"jsonrpc":@"2.0", @"result": @19, @"id": @"1"};
    NSError* error = nil;
    JSONRPCResponse* sut = [MTLJSONAdapter modelOfClass:[JSONRPCResponse class] fromJSONDictionary:dict error:&error];
    XCTAssertNil(error);
    XCTAssertTrue([sut.version isEqualToString:dict[@"jsonrpc"]]);
    XCTAssertTrue([sut.jrpcId isEqualToString:dict[@"id"]]);
    XCTAssertTrue([sut.result isEqual:dict[@"result"]]);
}

- (void)testInitSuccesfull{
    NSDictionary* dict =@{@"jsonrpc":@"2.0", @"result": @19, @"id": @"1"};
    JSONRPCResponse* sut = [[JSONRPCResponse alloc] initWithResult:dict[@"result"] version:dict[@"jsonrpc"] jrpcId:dict[@"id"]];
    XCTAssertNotNil(sut);
    XCTAssertTrue([sut.version isEqualToString:dict[@"jsonrpc"]]);
    XCTAssertTrue([sut.jrpcId isEqualToString:dict[@"id"]]);
    XCTAssertTrue([sut.result isEqual:dict[@"result"]]);
}


@end
