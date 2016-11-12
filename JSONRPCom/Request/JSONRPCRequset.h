//
//  JSONRPCRequset.h
//  JSONRPCom
//
//  Created by andrew batutin on 11/12/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONRPC.h"
#import "Mantle.h"

@interface JSONRPCRequset : MTLModel <MTLJSONSerializing, JSONRPC>

@property (nonatomic, readonly, copy) NSString* method;
@property (nonatomic, readonly, strong) id params;


- (instancetype)initWithMethod:(NSString *)methodName params:(id)params version:(NSString*)version jrpcId:(NSString*)jrpcId;

@end
