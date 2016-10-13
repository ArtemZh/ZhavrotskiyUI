//
//  ZHTableViewController.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 23.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHTableViewController.h"
#import "ZHUserCell.h"
#import "ZHUserData.h"
#import "UITableView+ZHExtension.h"
#import "UINib+ZHExtension.h"
#import "ZHUser.h"
#import "ZHArrayModels.h"
#import "ZHArrayChange.h"



#import "ZHMacros.h"



@interface ZHTableViewController ()
@property NSMutableArray *objectsCell;
@property (nonatomic, strong)   ZHUser      *user;

@end

@implementation ZHTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




- (void)addNewObject:(id)sender {
    NSString *title = @"test";
    if (!self.objectsCell) {
        self.objectsCell = [[NSMutableArray alloc] init];
    }
//    ZHUser *user = [ZHUser init];
    
    [self.objectsCell insertObject:title atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.user.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    
//    NSString *object = self.objectsCell[indexPath.row];
//    cell.textLabel.text = [object description];
//
    ZHUserCell *cell = [tableView reusableCellfromNibWithClass:[ZHUserCell class]];
    ZHUser * object = [ZHUser new];
    
    
    [cell fillWithModel:object];
//    cell.userName.text = self.user.name;
    return cell;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objectsCell removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


@end
