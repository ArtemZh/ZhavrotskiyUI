//
//  ZHUser.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>


@interface ZHUser : NSObject
@property (nonatomic, copy)     NSString *name;
@property (nonatomic, copy)     NSString *surname;
@property (nonatomic, readonly) NSString *fullName;
@property (nonatomic, readonly) UIImage  *image;

@end
