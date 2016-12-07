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

- (void)testSuccesfullDeserializtionOfRequest{
    NSString* testData = @"{\"jsonrpc\": \"2.0\", \"method\": \"subtract\", \"params\": [42, 23], \"id\": \"1\"}";
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

- (void)testUnSuccesfullDeserializtionOfRequestWithWrongParamType{
    NSString* testData = @"{\"jsonrpc\": \"2.0\", \"method\": \"subtract\", \"params\": [42, 23], \"id\": 1}";
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    [JSONRPCDeSerialization deSerializeString:testData
                           withJSONRPCRequset:^(JSONRPCRequst *data) {
                               XCTFail(@"shouldn't be here");
                           } orJSONRPCResponse:^(JSONRPCResponse *data) {
                               XCTFail(@"shouldn't be here");
                           } orJSONRPCNotification:^(JSONRPCNotification *data) {
                               XCTFail(@"shouldn't be here");
                           } orJSONRPCError:^(JSONRPCErrorResponse *data) {
                               XCTFail(@"shouldn't be here");
                           } serializationError:^(NSError *error) {
                               [expectation fulfill];
                               XCTAssertNotNil(error);
                           }];
    [self waitForExpectationsWithTimeout:1 handler:^(NSError * _Nullable error) {
        NSLog(@"no callback was called");
    }];
}

- (void)testUnSuccesfullDeserializtionOfRequestWithInvalidJson{
    NSString* testData = @"}\"jsonrpc\": \"2.0\", \"method\": \"subtract\", \"params\": [42, 23], \"id\": \"1\"}";
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    [JSONRPCDeSerialization deSerializeString:testData
                           withJSONRPCRequset:^(JSONRPCRequst *data) {
                               XCTFail(@"shouldn't be here");
                           } orJSONRPCResponse:^(JSONRPCResponse *data) {
                               XCTFail(@"shouldn't be here");
                           } orJSONRPCNotification:^(JSONRPCNotification *data) {
                               XCTFail(@"shouldn't be here");
                           } orJSONRPCError:^(JSONRPCErrorResponse *data) {
                               XCTFail(@"shouldn't be here");
                           } serializationError:^(NSError *error) {
                               [expectation fulfill];
                               XCTAssertNotNil(error);
                           }];
    [self waitForExpectationsWithTimeout:1 handler:^(NSError * _Nullable error) {
        NSLog(@"no callback was called");
    }];
}


- (void)testSuccesfullDeserializtionOfNotification{
    NSString* testData = @"{\"jsonrpc\": \"2.0\", \"method\": \"subtract\", \"params\": [42, 23]}";
    NSDictionary* dict = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23]};
    NSError* error = nil;
    JSONRPCNotification* expectedResult = [MTLJSONAdapter modelOfClass:[JSONRPCNotification class] fromJSONDictionary:dict error:&error];
    XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    [JSONRPCDeSerialization deSerializeString:testData
                           withJSONRPCRequset:^(JSONRPCRequst *data) {
                               XCTFail(@"shouldn't be here");
                           } orJSONRPCResponse:^(JSONRPCResponse *data) {
                               XCTFail(@"shouldn't be here");
                           } orJSONRPCNotification:^(JSONRPCNotification *data) {
                               [expectation fulfill];
                               XCTAssertEqualObjects(data, expectedResult);
                           } orJSONRPCError:^(JSONRPCErrorResponse *data) {
                               XCTFail(@"shouldn't be here");
                           } serializationError:^(NSError *error) {
                               XCTFail(@"shouldn't be here");
                           }];
    [self waitForExpectationsWithTimeout:1 handler:^(NSError * _Nullable error) {
        NSLog(@"no callback was called");
    }];
}

- (void)testSuccesfullDeserializtionOfResponse{
    NSString* testData = @"{\"jsonrpc\": \"2.0\", \"result\": 19, \"id\": \"1\"}";
    NSDictionary* dict = @{@"jsonrpc":@"2.0", @"result":@19, @"id":@"1"};
    NSError* error = nil;
    JSONRPCResponse* expectedResult = [MTLJSONAdapter modelOfClass:[JSONRPCResponse class] fromJSONDictionary:dict error:&error];
    XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    [JSONRPCDeSerialization deSerializeString:testData
                           withJSONRPCRequset:^(JSONRPCRequst *data) {
                               XCTFail(@"shouldn't be here");
                           } orJSONRPCResponse:^(JSONRPCResponse *data) {
                               [expectation fulfill];
                               XCTAssertEqualObjects(data, expectedResult);
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
