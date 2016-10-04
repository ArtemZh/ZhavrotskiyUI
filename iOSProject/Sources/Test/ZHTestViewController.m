//
//  ZHTestViewController.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 03.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHTestViewController.h"
#import "ZHTestView.h"
#import "TestTableModel.h"
#import "ZHUserCell.h"
#import "UITableView+ZHExtension.h"
#import "UINib+ZHExtension.h"
#import "ZHUser.h"



#import "ZHMacros.h"

ZHViewControllerBaseViewPropertyWithGetter(ZHTestViewController, testView, ZHTestView)

@interface ZHTestViewController ()

@end

@implementation ZHTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.testView.tableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma makr -
#pragma makr UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSInteger count = [TestTableModel usersList].list.count;
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZHUserCell *cell = [tableView reusableCellfromNibWithClass:[ZHUserCell class]];
//    ZHUser * object = self.user[indexPath.row];
    
    
//    [cell fillInfoFromObject:object];
    
    return cell;
}

@end
