//
//  ZHTableView.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 23.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHTableView.h"

@implementation ZHTableView

- (void)editingMode {
    BOOL editing = self.usersTableView.editing;
    
    self.editButton.hidden = !editing;
    self.doneButton.hidden = editing;
    
    self.usersTableView.editing = !editing;
}

@end
