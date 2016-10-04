//
//  ZHUserCell.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHTableViewCell.h"

@class ZHUser;

@interface ZHUserCell : UITableViewCell
@property (nonatomic, strong)  IBOutlet UILabel         *userName;
@property (nonatomic, strong)  IBOutlet UIImageView     *userImageView;

@property (nonatomic, strong) ZHUser *user;

- (void)fillWithModel:(ZHUser *)user;

@end
