//
//  ZHTableView.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 23.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHTableView : UIView
@property (nonatomic, strong) IBOutlet UITableView  *usersTableView;
@property (nonatomic, strong) IBOutlet UIButton     *doneButton;
@property (nonatomic, strong) IBOutlet UIButton     *addButton;
@property (nonatomic, strong) IBOutlet UIButton     *editButton;

- (void)editingMode;

@end
