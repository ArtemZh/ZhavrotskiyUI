//
//  ZHUserCell.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHUserCell.h"

#import "ZHUser.h"

@implementation ZHUserCell

#pragma mark -
#pragma mark Initialization and deallocation

- (void)awakeFromNib {
    [super awakeFromNib];
}


#pragma mark -
#pragma mark Accessors

- (void)setUser:(ZHUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithModel:user];
    }
}

#pragma mark -
#pragma mark Public Implementations

- (void)fillWithModel:(ZHUser *)user {
    NSString * text =[user fullName];
    text = @"test";
    self.userName.text = text;
    self.userName.text = self.user.fullName;
    self.userImageView.image = user.image;
    
    [self customizeUserPicture];
}

#pragma mark -
#pragma mark Private methods

- (void)customizeUserPicture {
    UIImageView *picture = self.userImageView;
    
    picture.layer.cornerRadius = picture.frame.size.height /2;
    picture.layer.masksToBounds = YES;
    
    self.userImageView.backgroundColor = self.backgroundColor;
}


@end
