//
//  ZHArrayModels.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 11.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHArrayModels.h"
#import "ZHArrayChange.h"



@interface ZHArrayModels ()
@property (nonatomic, strong)   NSMutableArray  *mutableModels;

@end

@implementation ZHArrayModels


@dynamic modelsArray;
@dynamic count;

#pragma mark -
#pragma mark Initializations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableModels = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)models {
    return [self.mutableModels copy];
}

- (NSUInteger)count {
    return [self.mutableModels count];
}

#pragma mark -
#pragma mark Public implementations

- (void)addModel:(id)model {
    if (model) {
        [self.mutableModels addObject:model];
        [self notifyOfState:ZHEditingTypeAdd withObject:[ZHArrayChange addingObjectWithIndex:[self indexOfModel:model]]];
    }
}

- (void)removeModel:(id)user {
    if (user) {
        [self.mutableModels removeObject:user];
    }
}

- (void)addModels:(NSArray *)models {
    if (models) {
        for (id model in models) {
            [self addModel:model];
        }
    }
}

- (id)modelAtIndex:(NSUInteger)index {
    NSMutableArray *models = self.mutableModels;
    
    if (index < models.count) {
        return [models objectAtIndex:index];
    }
    
    return nil;
}

- (void)moveModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    id model = [self modelAtIndex:fromIndex];
    BOOL notify = NO;
    [self removeModelAtIndex:fromIndex notify:notify];
    [self insertModel:model atIndex:toIndex notify:notify];
    [self notifyOfState:ZHEditingTypeMove
             withObject:[ZHArrayChange movingObjectwithIndex:toIndex
                                                    fromIndex:fromIndex]];
}

- (void)insertModel:(id)user atIndex:(NSUInteger)index notify:(BOOL)notify {
    if (user) {
        [self.mutableModels insertObject:user atIndex:index];
        if (notify) {
            [self notifyOfState:ZHEditingTypeAdd withObject:[ZHArrayChange addingObjectWithIndex:index]];
        }
    }
}

- (void)removeModelAtIndex:(NSUInteger)index notify:(BOOL)notify {
    [self.mutableModels removeObjectAtIndex:index];
    if (notify) {
        [self notifyOfState:ZHEditingTypeRemove withObject:[ZHArrayChange removingObjectWithIndex:index]];
    }
}

- (NSUInteger)indexOfModel:(id)model {
    return [self.mutableModels indexOfObject:model];
}

#pragma mark -
#pragma mark Redefinition of parent methods

- (SEL)selectorForState:(NSUInteger)state {
    return @selector(collection:didUpdateWithArrayChangeModel:);
}




@end
