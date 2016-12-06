//
//  JSONRPCSerialization.m
//  JSONRPCom
//
//  Created by andrew batutin on 12/6/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import "JSONRPCDeSerialization.h"
#import "NSString+ToJSONDictionary.h"

@implementation JSONRPCDeSerialization

+ (NSDictionary*)rpcMapping{
    //return @{@"error":JSONRPCErrorResponse.class, @"result":JSONRPCResponse.class, @"method":JSONRPCRequset.class};
    return nil;
}

+ (void)deSerializeString:(NSString*)message withJSONRPCRequset:(void (^)(JSONRPCRequst* data))request
                                            orJSONRPCResponse:(void (^)(JSONRPCResponse* data))response
                                            orJSONRPCNotification:(void (^)(JSONRPCNotification* data))notification
                                            orJSONRPCError:(void (^)(JSONRPCErrorResponse* data))errorResponse
                                            serializationError:(void (^)(NSError* error))error{
    
    
    NSDictionary* dict = [message toJSONDictionary];
    if ( [[dict allKeys] containsObject:@"id"] && [[dict allKeys] containsObject:@"method"]){
        NSError* parseError = nil;
        JSONRPCRequst* expectedResult = [MTLJSONAdapter modelOfClass:[JSONRPCRequst class] fromJSONDictionary:dict error:&parseError];
        if (!parseError){
            request(expectedResult);
        }else{
            error(parseError);
        }
    }
    
}



@end
