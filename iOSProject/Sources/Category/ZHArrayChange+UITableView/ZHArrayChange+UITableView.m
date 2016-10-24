//
//  ZHArrayChange+UITableView.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 24.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHArrayChange+UITableView.h"

@implementation ZHArrayChange (UITableView)

- (void)applyToTableView:(UITableView *)tableView {
    [self applyToTableView:tableView withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)applyToTableView:(UITableView *)tableView withRowAnimation:(UITableViewRowAnimation)animation {
    
}

@end
