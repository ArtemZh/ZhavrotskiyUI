//
//  ZHUsersList.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 06.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHUsersList.h"

@interface ZHUsersList()
@property (nonatomic, strong)   NSMutableArray  *mutableUsers;

@end


@implementation ZHUsersList

#pragma mark -
#pragma mark Initializations and deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableUsers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public implementations

- (void)addUser:(id)user {
    if (user) {
        [self.mutableUsers addObject:user];
    }
}

- (void)removeUser:(id)user {
    if (user) {
        [self.mutableUsers removeObject:user];
    }
}

- (void)addUsersArray:(NSArray *)array {
    if (array) {
        for (id array in array) {
            [self add:array];
        }
    }
    
}

- (id)userAtIndex:(NSUInteger)index {
    NSMutableArray *users = self.mutableUsers;
    
    if (index < users.count) {
        return [users objectAtIndex:index];
    }
    
    return nil;

    
}


@end
