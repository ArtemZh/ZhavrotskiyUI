//
//  ZHSquareAnimatedView.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 12.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHSquareAnimatedView.h"

static const NSTimeInterval ZHAnimatioDuration = 1;


@interface ZHSquareAnimatedView ()
@property (nonatomic, assign)                    ZHSquarePosition     nextPosition;
@property (nonatomic, assign, getter=isAnimated) BOOL                 animated;

@end

@implementation ZHSquareAnimatedView

#pragma mark -
#pragma mark Accsessors

- (void)setPosition:(ZHSquarePosition)position {
    if (_position != position) {
        _position = position;
        
        
    }
}




#pragma mark -
#pragma mark Private

//- (CGPoint)switchSquarePosition:(ZHSquarePosition)position {
//    switch (position)
//    
//}
//

@end