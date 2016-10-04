//
//  UINib+ZHExtension.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "UINib+ZHExtension.h"

@implementation UINib (Extension)

+ (UINib *)nibWithClass:(Class)cls {
    return [self nibWithNibName:NSStringFromClass(cls) bundle:nil];
}

- (id)objectWithClass:(Class)cls {
    NSArray *elements = [self instantiateWithOwner:nil options:nil];
    for (id element in elements) {
        if ([element isMemberOfClass:cls]) {
            return element;
        }
    }
    
    return nil;
}

@end
