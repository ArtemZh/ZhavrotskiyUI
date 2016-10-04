//
//  TestTableModel.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 03.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TestTableModel : NSObject

+(TestTableModel*)usersList;

@property (nonatomic, retain) NSMutableArray *list;




@end
