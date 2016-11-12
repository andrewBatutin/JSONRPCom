//
//  JSONRPCRequset.m
//  JSONRPCom
//
//  Created by andrew batutin on 11/12/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import "JSONRPCRequset.h"

@implementation JSONRPCRequset

- (instancetype)initWithMethod:(NSString *)methodName params:(id)params version:(NSString*)version jrpcId:(NSString*)jrpcId{
    
    if (self == [super init]){
        _method = methodName;
        _version = version;
        _params = params;
        _jrpcId = jrpcId;
        
    }
    return self;
}
@end
