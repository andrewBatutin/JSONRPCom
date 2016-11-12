//
//  JSONRPCRequset.h
//  JSONRPCom
//
//  Created by andrew batutin on 11/12/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface JSONRPCRequset : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString* version;
@property (nonatomic, readonly, copy) NSString* method;
@property (nonatomic, readonly, strong) id params;
@property (nonatomic, readonly, copy) NSString* jrpcId;

- (instancetype)initWithMethod:(NSString *)methodName params:(id)params version:(NSString*)version jrpcId:(NSString*)jrpcId;

@end
