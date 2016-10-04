//
//  ZHTableViewCell.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHTableViewCell.h"

@implementation ZHTableViewCell




- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

@end
