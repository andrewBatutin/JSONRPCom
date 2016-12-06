//
//  NSDictionary+ToString.m
//  JSONRPCom
//
//  Created by andrew batutin on 12/6/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import "NSDictionary+ToString.h"

@implementation NSDictionary (ToString)

- (NSString*)toJsonString{
    if (![NSJSONSerialization isValidJSONObject:self]){
        return nil;
    }
    NSError* error = nil;
    NSData* data = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    if (error){
        return nil;
    }
    NSString* result =  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return result;
}

@end
