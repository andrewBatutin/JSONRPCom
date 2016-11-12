//
//  JSONRPCResponse.m
//  JSONRPCom
//
//  Created by andrew batutin on 11/12/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import "JSONRPCResponse.h"

@implementation JSONRPCResponse

@synthesize jrpcId = _jrpcId;
@synthesize version = _version;

+ (NSDictionary*)JSONKeyPathsByPropertyKey{
    return @{@"jrpcId":@"id",
             @"result":@"result",
             @"version":@"jsonrpc"};
}


@end
