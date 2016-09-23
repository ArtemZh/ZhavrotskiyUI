//
//  ZHSquareAnimatedView.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 12.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHSquareAnimatedView.h"

#import "ZHMacros.h"

#import "ZHSimpleViewContoller.h"

static const CGFloat    kZHAnimationDuration        = 0.8f;
static const CGFloat    kZHAnimationDelay           = 0.0f;

static NSString * const kZHPlayTitle = @"Start";
static NSString * const kZHStopTitle  = @"Stop";


uint32_t ZHRandomWithCount(uint32_t count) {
    return arc4random_uniform(count);
}

@interface ZHSquareAnimatedView ()
@property (nonatomic, assign) BOOL      shouldStop;


- (void)setAnimating:(BOOL)animating;
- (void)animate;

- (CGPoint)squarePathWithType:(ZHSquarePosition)type;
- (ZHSquarePosition)nextSquarePosition;

- (void)setSquarePosition:(ZHSquarePosition)squarePosition animated:(BOOL)animated;
- (void)setSquarePosition:(ZHSquarePosition)squarePosition animated:(BOOL)animated complitionHandler:(ZHHandler)handler;

- (void)changePlayButtonTitle;

@end

@implementation ZHSquareAnimatedView

#pragma mark -
#pragma mark Accessors

- (void)setAnimating:(BOOL)animating {
    if (_animating) {
        self.shouldStop = !self.shouldStop;
    } else {
        _animating = YES;
        [self animate];
    }
    
//    [self changePlayButtonTitle];
}

- (void)setSquarePosition:(ZHSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:YES];
}

#pragma mark -
#pragma mark Public Implementations


- (void)moveToRandomPostion {
    uint32_t randomPosition = 0;
    ZHSquarePosition type = self.squarePosition;
    
    do {
        randomPosition = ZHRandomWithCount(ZHSquarePositionCount);
        if (randomPosition != type) {
            break;
        }
    } while (YES);
    
    [self setSquarePosition:randomPosition];
}

#pragma mark -
#pragma mark Private Implementations

- (void)animate {
    ZHWeakify(self);
    
    ZHSquarePosition position = [self nextSquarePosition];
    [self setSquarePosition:position animated:YES complitionHandler:^{
        ZHStrongify(self);
        if (self.shouldStop) {
            _animating = NO;
            self.shouldStop = NO;
            
        } else {
            [self animate];
        }
    }];
}


- (void)setSquarePosition:(ZHSquarePosition)squarePosition animated:(BOOL)animated {
    [self setSquarePosition:squarePosition animated:animated complitionHandler:nil];
}

- (void)setSquarePosition:(ZHSquarePosition)squarePosition animated:(BOOL)animated complitionHandler:(ZHHandler)completion {
    if (_squarePosition != squarePosition) {
        [UIView animateWithDuration:animated ? kZHAnimationDuration : 0
                              delay:kZHAnimationDelay
                            options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             CGRect frame = self.squareView.frame;
                             frame.origin = [self squarePathWithType:squarePosition];
                             self.squareView.frame = frame;
                         }
                         completion:^(BOOL shouldFinish) {
                             _squarePosition = squarePosition;
                             if (completion) {
                                 completion();
                             }
                         }];
    }
}

- (ZHSquarePosition)nextSquarePosition {
    return (self.squarePosition + 1) % ZHSquarePositionCount;
}

- (CGPoint)squarePath {
    CGRect viewBounds = [self bounds];
    CGRect squareView = [self.squareView bounds];
    
    CGFloat averageHeight = CGRectGetHeight(viewBounds) - CGRectGetHeight(squareView);
    CGFloat averageWidth = CGRectGetWidth(viewBounds) - CGRectGetWidth(squareView);
    
    return CGPointMake(averageWidth, averageHeight);
}

- (CGPoint)squarePathWithType:(ZHSquarePosition)type {
    CGPoint point = CGPointMake(0, 0);
    CGPoint maxPoint = [self squarePath];
    
    switch (type) {
        case ZHSquarePositionRightTop:
            point.x = maxPoint.x;
            break;
            
        case ZHSquarePositionRightBottom:
            point = maxPoint;
            break;
            
        case ZHSquarePositionLeftBottom:
            point.y = maxPoint.y;
            break;
            
        default:
            break;
    }
    
    return point;
}


- (void)changePlayButtonTitle {
    NSString *buttonPlayTitle = _animating ? kZHStopTitle : kZHPlayTitle;
    [self.autoAnimation setTitle:buttonPlayTitle forState:UIControlStateNormal];
}

@end