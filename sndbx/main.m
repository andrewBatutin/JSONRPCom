//
//  main.m
//  sndbx
//
//  Created by andrew batutin on 11/12/16.
//  Copyright © 2016 HomeOfRisingSun. All rights reserved.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    
    NSString* (^testBlock)(int a) = ^NSString*(int a){ return @"TEST"; };
    NSString* result = testBlock(2);
    
    return 0;
}
