//
//  ZHUserData.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHUserData.h"

@interface ZHUserData ()

- (instancetype)initWithUserIndex:(NSUInteger)index;

@end

@implementation ZHUserData

#pragma mark -
#pragma mark Class methods

+ (instancetype)userDataWithUserIndex:(NSUInteger)index {
    return [[self alloc] initWithUserIndex:index];
}

#pragma mark -
#pragma mark Initializationa and deallocations

- (instancetype)initWithUserIndex:(NSUInteger)index {
    self = [super init];
    if (self) {
        self.userIndex = index;
    }
    
    return self;
}

@end

