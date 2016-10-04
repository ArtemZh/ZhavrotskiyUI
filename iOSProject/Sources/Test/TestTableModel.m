//
//  TestTableModel.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 03.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "TestTableModel.h"

static TestTableModel* __nameList;

@implementation TestTableModel

+(TestTableModel*)usersList {
    if (__nameList == nil) {
        __nameList =  [TestTableModel new];
        __nameList.list = [NSMutableArray new];
    }
    
    return __nameList;
}

@end
