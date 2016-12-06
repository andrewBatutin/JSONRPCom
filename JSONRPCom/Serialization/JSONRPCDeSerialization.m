//
//  JSONRPCSerialization.m
//  JSONRPCom
//
//  Created by andrew batutin on 12/6/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import "JSONRPCDeSerialization.h"

@implementation JSONRPCDeSerialization

+ (NSDictionary*)rpcMapping{
    //return @{@"error":JSONRPCErrorResponse.class, @"result":JSONRPCResponse.class, @"method":JSONRPCRequset.class};
    return nil;
}

+ (void)deSerializeString:(NSString*)message  withJSONRPCRequset:(void (^)(JSONRPCRequst* data))request
                                            orJSONRPCResponse:(void (^)(JSONRPCResponse* data))response
                                            orJSONRPCNotification:(void (^)(JSONRPCNotification* data))notification
                                            orJSONRPCError:(void (^)(JSONRPCErrorResponse* data))errorResponse
                                            serializationError:(void (^)(NSError* error))error{
    NSDictionary* dict = @{@"jsonrpc": @"2.0", @"method": @"subtract", @"params": @[@42, @23], @"id": @"1"};
    JSONRPCRequst* expectedResult = [MTLJSONAdapter modelOfClass:[JSONRPCRequst class] fromJSONDictionary:dict error:nil];
    request(expectedResult);
}

@end
