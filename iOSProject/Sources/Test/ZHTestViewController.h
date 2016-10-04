//
//  ZHTestViewController.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 03.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZHUser;

@interface ZHTestViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)   ZHUser      *user;

@end
