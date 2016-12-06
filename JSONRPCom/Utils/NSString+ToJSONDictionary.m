//
//  NSString+ToJSONDictionary.m
//  JSONRPCom
//
//  Created by andrew batutin on 12/6/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import "NSString+ToJSONDictionary.h"

@implementation NSString (ToJSONDictionary)

- (NSDictionary*)toJSONDictionary{
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    if (!data){
        return nil;
    }
    id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if (!result){
        return nil;
    }
    
    if ( ![result isKindOfClass:NSDictionary.class] ){
        return nil;
    }
    
    return result;
}

@end
