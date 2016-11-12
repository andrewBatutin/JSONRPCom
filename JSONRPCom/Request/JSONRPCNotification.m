//
//  JSONRPCNotification.m
//  JSONRPCom
//
//  Created by andrew batutin on 11/12/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import "JSONRPCNotification.h"

@implementation JSONRPCNotification

@synthesize method = _method;
@synthesize params = _params;
@synthesize version = _version;

+ (NSDictionary*)JSONKeyPathsByPropertyKey{
    return @{@"params":@"params",
             @"version":@"jsonrpc",
             @"method":@"method"};
}



@end
