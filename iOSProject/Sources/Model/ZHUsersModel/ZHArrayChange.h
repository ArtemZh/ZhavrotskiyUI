//
//  ZHArrayChange.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 11.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "UIKit/UIKit.h"

#import <Foundation/Foundation.h>

@interface ZHArrayChange : NSObject

+ (instancetype)removingObjectWithIndex:(NSUInteger)index;
+ (instancetype)addingObjectWithIndex:(NSUInteger)index;
+ (instancetype)movingObjectwithIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex;

@end
