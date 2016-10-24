//
//  ZHTableViewController.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 23.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHTableViewController.h"
#import "ZHTableView.h"
#import "ZHUserCell.h"
#import "ZHUserData.h"
#import "UITableView+ZHExtension.h"
#import "ZHArrayChange+UITableView.h"
#import "UINib+ZHExtension.h"
#import "ZHUser.h"
#import "ZHUsers.h"
#import "ZHArrayModels.h"
#import "ZHArrayChange.h"
#import "ZHObservableObject.h"




#import "ZHMacros.h"

static NSString * const kZHTableTitle = @"Minion List";

ZHViewControllerBaseViewPropertyWithGetter(ZHTableViewController, usersView, ZHTableView)

@interface ZHTableViewController ()
@property NSMutableArray *objectsCell;
@property (nonatomic, strong)   ZHUsers      *users;

@end

@implementation ZHTableViewController

#pragma mark -
#pragma mark Initalizations and deallocations

- (void)dealloc {
    [self.users removeObserver:self];
}

- (void)loadView {
    [super loadView];
    
    ZHUsers *users = [[ZHUsers alloc] init];
    [users addObserver:self];
    self.users = users;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark TableViewDelegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

#pragma mark -
#pragma mark TableViewDataSource


- (void)        tableView:(UITableView *)tableView
       commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.users removeModelAtIndex:indexPath.row notify:YES];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return kZHTableTitle;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZHUserCell *cell = [tableView reusableCellfromNibWithClass:[ZHUserCell class]];
    cell.user = [self.users modelAtIndex:indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath {
    [self.users moveModelFromIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}


- (void)collection:(id)collection didUpdateWithArrayChangeModel:(ZHArrayChange *)changeModel {
    [changeModel applyToTableView:self.usersView.usersTableView];
}

@end
