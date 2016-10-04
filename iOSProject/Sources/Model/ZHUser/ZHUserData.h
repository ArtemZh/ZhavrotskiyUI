//
//  ZHUserData.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZHUser;

@interface ZHUserData : NSObject
@property (nonatomic, assign)   NSUInteger  userIndex;

+ (instancetype)userDataWithUserIndex:(NSUInteger)index;

@end
