//
//  JSONRPCErrorModelTest.m
//  JSONRPCom
//
//  Created by Andrew Batutin on 11/13/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JSONRPCErrorModel.h"
#import "MTLJSONAdapter+Utils.h"

@interface JSONRPCErrorModelTest : XCTestCase

@end

@implementation JSONRPCErrorModelTest

- (void)testErrorModelSerializationSuccess{
    //{"jsonrpc": "2.0", "error": {"code": -32601, "message": "Method not found"}, "id": "1"}
    NSDictionary* dict =@{@"code": @-32601, @"message": @"Method not found", @"data":@"test_data"};
    NSError* error = nil;
    JSONRPCErrorModel* sut = [MTLJSONAdapter modelOfClass:[JSONRPCErrorModel class] fromJSONDictionary:dict error:&error];
    XCTAssertNil(error);
    XCTAssertTrue([sut.message isEqualToString:dict[@"message"]]);
    XCTAssertTrue([dict[@"code"] integerValue] == sut.code );
    XCTAssertTrue([sut.data isEqual:dict[@"data"]]);
}

- (void)testErrorModelDeSerializationSuccess{
    //{"jsonrpc": "2.0", "error": {"code": -32601, "message": "Method not found"}, "id": "1"}
    NSDictionary* dict =@{@"code": @-32601, @"message": @"Method not found", @"data":[NSURL URLWithString:@"www.google.com"]};
    NSError* error = nil;
    JSONRPCErrorModel* sut = [MTLJSONAdapter modelOfClass:[JSONRPCErrorModel class] fromJSONDictionary:dict error:&error];
    NSDictionary* realResult = [MTLJSONAdapter JSONDictionaryFromModel:sut error:&error];
    XCTAssertNil(error);
    XCTAssertEqualObjects(dict, realResult);
}

- (void)testErrorModelInitSuccess{
    //{"jsonrpc": "2.0", "error": {"code": -32601, "message": "Method not found"}, "id": "1"}
    NSDictionary* dict =@{@"code": @-32601, @"message": @"Method not found", @"data":@"test_data"};
    NSError* error = nil;
    JSONRPCErrorModel* sut = [[JSONRPCErrorModel alloc] initWithMessage:dict[@"message"] data:dict[@"data"] errorCode:(JSONRPCErrorModelError)[dict[@"code"] integerValue]];
    XCTAssertNil(error);
    XCTAssertTrue([sut.message isEqualToString:dict[@"message"]]);
    XCTAssertTrue([dict[@"code"] integerValue] == sut.code );
    XCTAssertTrue([sut.data isEqual:dict[@"data"]]);
}

@end
