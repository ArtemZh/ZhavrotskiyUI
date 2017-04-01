//
//  ZHTwoIndexArrayChange.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 01.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHTwoIndexArrayChange.h"

#import "NSIndexPath+ZHExtensions.h"

@implementation ZHTwoIndexArrayChange

@dynamic fromIndexPath;

#pragma mark -
#pragma mark Initializations and deallocations


- (instancetype)initWithIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex {
    self = [super initWithIndex:index];
    if (self) {
        self.fromIndex = fromIndex;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSIndexPath *)fromIndexPath {
    return [NSIndexPath indexPathForRow:self.fromIndex];
}

@end
