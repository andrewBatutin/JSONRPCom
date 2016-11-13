//
//  JSONRPCError.m
//  JSONRPCom
//
//  Created by andrew batutin on 11/12/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import "JSONRPCError.h"

@implementation JSONRPCError

@synthesize jrpcId = _jrpcId;
@synthesize version = _version;

- (instancetype)initWithError:(id)error version:(NSString*)version jrpcId:(NSString*)jrpcId{
    if (self == [super init]){
        _version = version;
        _error = error;
        _jrpcId = jrpcId;
    }
    return self;
}


+ (NSDictionary*)JSONKeyPathsByPropertyKey{
    return @{@"jrpcId":@"id",
             @"error":@"error",
             @"version":@"jsonrpc"};
}

@end
