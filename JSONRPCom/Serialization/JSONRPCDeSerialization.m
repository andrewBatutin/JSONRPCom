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

+ (void)serializeString:(NSString*)message  withJSONRPCRequset:(void (^)(JSONRPCRequst* data))request
                                            orJSONRPCResponse:(void (^)(JSONRPCResponse* data))response
                                            orJSONRPCNotification:(void (^)(JSONRPCNotification* data))notification
                                            orJSONRPCError:(void (^)(JSONRPCErrorResponse* data))errorResponse
                                            serializationError:(void (^)(NSError* error))error{
}

@end
