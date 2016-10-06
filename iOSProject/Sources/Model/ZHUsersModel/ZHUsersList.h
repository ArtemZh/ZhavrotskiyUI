//
//  ZHUsersList.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 06.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHUsersList : NSObject

@property (nonatomic, readonly) NSArray     *usersArray;
@property (nonatomic, readonly) NSUInteger  count;

- (void)addUser:(id)user;
- (void)removeUser:(id)user;

- (void)addUsersArray:(NSArray *)array;

- (id)userAtIndex:(NSUInteger)index;

@end
