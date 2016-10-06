//
//  UITableView+ZHExtension.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "UITableView+ZHExtension.h"
#import "UINib+ZHExtension.h"
#import "ZHTableViewCell.h"

@implementation UITableView (Extension)

- (id)reusableCellfromNibWithClass:(Class)cls {
    NSString *identifire = NSStringFromClass(cls);
    ZHTableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifire];
    if (!cell) {
        UINib *nib = [UINib nibWithClass:cls];
        cell = [nib objectWithClass:[cls class]];
        
    }
    
    return cell;
}

@end
