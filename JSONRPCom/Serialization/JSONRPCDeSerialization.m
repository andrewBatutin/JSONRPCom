//
//  JSONRPCSerialization.m
//  JSONRPCom
//
//  Created by andrew batutin on 12/6/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import "JSONRPCDeSerialization.h"
#import "NSString+ToJSONDictionary.h"

@interface JSONRPCDeSerialization ()



@end

@implementation JSONRPCDeSerialization

+ (BOOL (^)(NSDictionary*))requestKey{
    return ^BOOL(NSDictionary* dict){
        return ( [[dict allKeys] containsObject:@"id"] && [[dict allKeys] containsObject:@"method"] );
    };
}

+ (BOOL (^)(NSDictionary*))notificationKey{
    return ^BOOL(NSDictionary* dict){
        return ( ![[dict allKeys] containsObject:@"id"] && [[dict allKeys] containsObject:@"method"] );
    };
}

+ (void (^)(NSDictionary*))requestValue:(void (^)(JSONRPCRequst* data))request serializationError:(void (^)(NSError* error))serializationError{
    return ^(NSDictionary* dict){
        [self parseJSON:dict forModel:[JSONRPCRequst class] withResult:^(id<JSONRPC> entity) {
            request((JSONRPCRequst*)entity);
        } serializationError:^(NSError *error) {
            serializationError(error);
        }];
    };
}

+ (void (^)(NSDictionary*))notificationValue:(void (^)(JSONRPCNotification* data))notification serializationError:(void (^)(NSError* error))serializationError{
    return ^(NSDictionary* dict){
        [self parseJSON:dict forModel:[JSONRPCNotification class] withResult:^(id<JSONRPC> entity) {
            notification((JSONRPCNotification*)entity);
        } serializationError:^(NSError *error) {
            serializationError(error);
        }];
    };
}

+ (void)deSerializeString:(NSString*)message withJSONRPCRequset:(void (^)(JSONRPCRequst* data))request
                                            orJSONRPCResponse:(void (^)(JSONRPCResponse* data))response
                                            orJSONRPCNotification:(void (^)(JSONRPCNotification* data))notification
                                            orJSONRPCError:(void (^)(JSONRPCErrorResponse* data))errorResponse
                                            serializationError:(void (^)(NSError* error))serializationError{
    
    
    NSError* parseError = nil;
    NSDictionary* messageDict = [message toJSONDictionaryWithError:&parseError];
    if (parseError){
        serializationError(parseError);
        return;
    }
    
    NSMutableDictionary* serializationMapping = @{}.mutableCopy;
    [serializationMapping setObject:[self requestValue:request serializationError:serializationError] forKey:[self requestKey]];
    [serializationMapping setObject:[self notificationValue:notification serializationError:serializationError] forKey:[self notificationKey]];
    
    for ( BOOL (^isKeyValidForMessage)(NSDictionary*) in [serializationMapping allKeys] ){
        if (isKeyValidForMessage(messageDict)){
            void (^serializationBlock)() = [serializationMapping objectForKey:isKeyValidForMessage];
            serializationBlock(messageDict);
            return;
        }
    }
}

+ (void)parseJSON:(NSDictionary*)json forModel:(Class)modelOfClass withResult:(void (^)(id<JSONRPC>entity))block
                                       serializationError:(void (^)(NSError* error))error{
    NSError* parseError = nil;
    JSONRPCRequst* result = [MTLJSONAdapter modelOfClass:modelOfClass fromJSONDictionary:json error:&parseError];
    if (!parseError){
        block(result);
    }else{
        error(parseError);
    }
}

@end
