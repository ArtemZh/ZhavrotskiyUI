//
//  ZHArrayChange.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 11.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHArrayChange.h"

@implementation ZHArrayChange

#pragma mark -
#pragma mark Class methods

+ (instancetype)addingObjectWithIndex:(NSUInteger)index{
    return [[ZHAddingObject alloc] initWithIndex:index];
}

+ (instancetype)removingObjectWithIndex:(NSUInteger)index {
    return [[ZHRemovingObject alloc] initWithIndex:index];
}

+ (instancetype)movingObjectwithIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex {
    return [[ZHMovingObject alloc] initWithIndex:index fromIndex:fromIndex];
}

@end
