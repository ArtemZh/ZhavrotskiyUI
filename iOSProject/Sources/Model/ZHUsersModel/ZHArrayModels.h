//
//  ZHArrayModels.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 11.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHObservableObject.h"

typedef enum {
    ZHEditingTypeAdd,
    ZHEditingTypeRemove,
    ZHEditingTypeMove
} ZHEditingType;


@interface ZHArrayModels : ZHObservableObject

@property (nonatomic, readonly) NSArray     *modelsArray;
@property (nonatomic, readonly) NSUInteger  count;

- (void)addUser:(id)user;
- (void)removeUser:(id)user;

- (void)addUsersArray:(NSArray *)array;

- (id)modelAtIndex:(NSUInteger)index;

- (void)insertModel:(id)user atIndex:(NSUInteger)index notify:(BOOL)notify;
- (void)removeModelAtIndex:(NSUInteger)index notify:(BOOL)notify;

- (void)moveModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;


@end
