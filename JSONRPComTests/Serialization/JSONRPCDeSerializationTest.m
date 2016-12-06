//
//  JSONRPCDeSerializationTest.m
//  JSONRPCom
//
//  Created by andrew batutin on 12/6/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JSONRPCDeSerialization.h"

@interface JSONRPCDeSerializationTest : XCTestCase

@end

@implementation JSONRPCDeSerializationTest

- (void)testDeserializtion{
    NSString* testData = @"{\"jsonrpc\": \"2.0\", \"method\": \"subtract\", \"params\": [42, 23], \"id\": 1}";
    NSDictionary* dict = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23], @"id": @"1"};
    NSError* error = nil;
    JSONRPCRequst* expectedResult = [MTLJSONAdapter modelOfClass:[JSONRPCRequst class] fromJSONDictionary:dict error:&error];
    XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    [JSONRPCDeSerialization deSerializeString:testData
                           withJSONRPCRequset:^(JSONRPCRequst *data) {
                               [expectation fulfill];
                               XCTAssertEqualObjects(data, expectedResult);
                           } orJSONRPCResponse:^(JSONRPCResponse *data) {
                               XCTFail(@"shouldn't be here");
                           } orJSONRPCNotification:^(JSONRPCNotification *data) {
                               XCTFail(@"shouldn't be here");
                           } orJSONRPCError:^(JSONRPCErrorResponse *data) {
                               XCTFail(@"shouldn't be here");
                           } serializationError:^(NSError *error) {
                               XCTFail(@"shouldn't be here");
                           }];
    [self waitForExpectationsWithTimeout:1 handler:^(NSError * _Nullable error) {
        NSLog(@"no callback was called");
    }];
}

@end
