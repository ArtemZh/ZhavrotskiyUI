//
//  UINib+ZHExtension.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (Extension)

+ (UINib *)nibWithClass:(Class)cls;

- (id)objectWithClass:(Class)cls;

@end
