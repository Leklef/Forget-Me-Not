//
//  TableViewSingleTon.m
//  Forget-Me-Not
//
//  Created by Ленар on 22.08.16.
//  Copyright © 2016 LeNComp. All rights reserved.
//

#import "TableViewSingleTon.h"
@interface TableViewSingleTon()

@end
@implementation TableViewSingleTon

+ (instancetype)sharedInstance {
    static TableViewSingleTon *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TableViewSingleTon alloc] init];
    });
    return sharedInstance;
}

@end
