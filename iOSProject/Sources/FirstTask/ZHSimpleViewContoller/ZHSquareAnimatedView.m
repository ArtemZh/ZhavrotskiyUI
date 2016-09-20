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
static const CGFloat    kZHAnimationButtonDelay     = 1.0f;

uint32_t ZHRandomWithCount(uint32_t count) {
    return arc4random_uniform(count);
}

@interface ZHSquareAnimatedView ()

- (CGPoint)squareWithType:(ZHSquarePosition)type;
- (ZHSquarePosition)nextSquarePosition;

- (void)setSquarePosition:(ZHSquarePosition)squarePosition animated:(BOOL)animated;
- (void)setSquarePosition:(ZHSquarePosition)squarePosition animated:(BOOL)animated complitionHandler:(ZHHandler)handler;

- (NSString *)changeTitle;

@end

@implementation ZHSquareAnimatedView

#pragma mark -
#pragma mark Accessors

//- (void)setAnimating:(BOOL)animating {
//    if (animating && !_shouldStop) {
//        [self startAnimation];
//    }
//
//    
//    if (_animating && !animating) {
//        _shouldStop = YES;
//    } else if (_animating && animating) {
//        _shouldStop = NO;
//    }
//    
//}

- (void)setSquarePosition:(ZHSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:YES];
}

#pragma mark -
#pragma mark Public Implementations

- (void)startAnimation {
    ZHWeakify(self);
    ZHSquarePosition position = [self nextSquarePosition];
    [self setSquarePosition:position animated:YES complitionHandler:^{
        ZHStrongify(self);
        if (self.shouldStop) {
            self.animating = NO;
            self.shouldStop = NO;
            
        }
        
        [self startAnimation];

    }];
}

- (void)moveToRandomPostion {
    uint32_t randomPosition = 0;
    ZHSquarePosition type = self.squarePosition;
    
    do {
        randomPosition = ZHRandomWithCount(ZHCountPosition);
        if (randomPosition != type) {
            break;
        }
    } while (YES);
    
    [self setSquarePosition:randomPosition];
}

#pragma mark -
#pragma mark Private Implementations

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
                             frame.origin = [self squareWithType:squarePosition];
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
    return (self.squarePosition + 1) % ZHCountPosition;
}

- (CGPoint)viewSize {
    CGRect viewBounds = [self bounds];
    CGRect squareView = [self.squareView bounds];
    
    CGFloat averageHeight = CGRectGetHeight(viewBounds) - CGRectGetHeight(squareView);
    CGFloat averageWidth = CGRectGetWidth(viewBounds) - CGRectGetWidth(squareView);
    
    return CGPointMake(averageWidth, averageHeight);
}

- (CGPoint)squareWithType:(ZHSquarePosition)type {
    CGPoint point = CGPointMake(0, 0);
    CGPoint maxPoint = [self viewSize];
    
    switch (type) {
        case ZHLeftTopPosition:
            point.x = maxPoint.x;
            break;
            
        case ZHRightTopPosition:
            point = maxPoint;
            break;
            
        case ZHRightButtonPosition:
            point.y = maxPoint.y;
            break;
            
        default:
            break;
    }
    
    return point;
}

- (void)changePlayButton {
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = kZHAnimationButtonDelay;
    [self.animatedButton.layer addAnimation:transition forKey:kCATransition];
    
    self.animatedButton.enabled = NO;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, kZHAnimationButtonDelay * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self.animatedButton.enabled = YES;
        [self.animatedButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
    });

    NSString  *title = self.changeTitle;
    [self.animatedButton setTitle:title forState:UIControlStateNormal];
    [self.animatedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}

- (NSString *)changeTitle {
    NSString *playTitle = @"Play";
    NSString *stopTitle = @"Stop";
    NSString *currentTitle = self.animatedButton.currentTitle;
    
    if (currentTitle == playTitle) {
        return stopTitle;
    }
    
    return playTitle;
}

@end