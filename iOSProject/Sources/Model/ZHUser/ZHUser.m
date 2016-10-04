//
//  ZHUser.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHUser.h"

#import "NSString+ZHExtensions.h"

@implementation ZHUser

@dynamic fullName;
@dynamic image;

#pragma mark -
#pragma mark Initializations and deallocations

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = [NSString randomName];
        self.surname = [NSString randomName];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (UIImage *)image {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ZHUserDefaultImage" ofType:@"png"];
    
    return [UIImage imageWithContentsOfFile:path];
}

@end

