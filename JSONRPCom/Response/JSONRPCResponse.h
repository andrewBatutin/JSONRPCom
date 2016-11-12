//
//  JSONRPCResponse.h
//  JSONRPCom
//
//  Created by andrew batutin on 11/12/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONRPC.h"
#import "Mantle.h"

@interface JSONRPCResponse : MTLModel <MTLJSONSerializing, JSONRPC>

@property (nonatomic, readonly, copy) id result;

@end
