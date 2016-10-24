//
//  ZHArrayChange+UITableView.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 24.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZHArrayChange.h"

@interface ZHArrayChange (UITableView)

//sholuld be launched from child classes
- (void)applyToTableView:(UITableView *)tableView;

- (void)applyToTableView:(UITableView *)tableView withRowAnimation:(UITableViewRowAnimation)animation;

@end
