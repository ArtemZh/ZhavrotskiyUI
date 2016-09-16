//
//  ZHSquareAnimatedView.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 12.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHSquareAnimatedView.h"

#import "ZHMacros.h"

#import "ZHSimpleViewContollerViewController.h"


static const CGFloat    kZHSquareSideSize           = 80.f;
static const CGFloat    kZHAnimationDuration        = 0.8f;
static const CGFloat    kZHAnimationDelay           = 0.0f;
static const CGFloat    kZHAnimationButtomDelay     = 1.0f;
static const NSUInteger kZHCornersCount             = 4;

uint8_t ZHRandomNextPosition() {
     uint8_t result = arc4random_uniform(2)-1;
    return result ;
}

uint32_t ZHRandomWithCount(uint32_t count) {
    return arc4random_uniform(count);
}

@interface ZHSquareAnimatedView ()

- (CGRect)squareWithType:(ZHSquarePosition)type;
- (ZHSquarePosition)nextSquarePosition;

- (void)setSquarePosition:(ZHSquarePosition)squarePosition animated:(BOOL)animated;
- (void)setSquarePosition:(ZHSquarePosition)squarePosition animated:(BOOL)animated complitionHandler:(ZHHandler)handler;

- (NSString *)changeTitle;

@end

@implementation ZHSquareAnimatedView

#pragma mark -
#pragma mark Accessors

- (void)setAnimating:(BOOL)animating {
    if (_animating && !animating) {
        _shouldStop = YES;
    } else if (_animating && animating) {
        _shouldStop = NO;
    }
    
    if (animating && !_shouldStop) {
        [self startAutoAnimation];
    }
}

- (void)setSquarePosition:(ZHSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:YES];
}

#pragma mark -
#pragma mark Public Implementations

- (void)startAutoAnimation {
    ZHWeakify(self);
    ZHSquarePosition position = [self nextSquarePosition];
    [self setSquarePosition:position animated:YES complitionHandler:^{
        ZHStrongify(self);
        if (self.shouldStop) {
            self.animating = NO;
            self.shouldStop = NO;
        } else {
            [self startAutoAnimation];
        }
    }];
}

- (void)randomSquarePostion {
    uint32_t randomPosition = 0;
    ZHSquarePosition type = self.squarePosition;
    
    do {
        //randomPosition = self.squarePosition - ZHRandomNextPosition();
        randomPosition = ZHRandomWithCount(kZHCornersCount);
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

- (void)setSquarePosition:(ZHSquarePosition)squarePosition animated:(BOOL)animated complitionHandler:(ZHHandler)complition {
    if (_squarePosition != squarePosition) {
        
        [UIView animateWithDuration:animated ? kZHAnimationDuration : 0
                              delay:kZHAnimationDelay
                            options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut
                         animations:^{ self.squareView.frame = [self squareWithType:squarePosition]; }
                         completion:^(BOOL finished) {
                             _squarePosition = squarePosition;
                             if (complition && self.animating) {
                                 complition();
                             }
                         }];
    }
}

- (ZHSquarePosition)nextSquarePosition {
    ZHSquarePosition type = self.squarePosition;
    
    return type = (type == ZHRightTopPosition) ? ZHLeftTopPosition : type + 1;
}

- (CGRect)squareWithType:(ZHSquarePosition)type {
    CGRect sqaure = CGRectMake(0, 0, kZHSquareSideSize, kZHSquareSideSize);
    CGRect frame = self.frame;
    
    switch (type) {
        case ZHLeftTopPosition:
            break;
            
        case ZHRightButtomPosition:
        case ZHRightTopPosition:
            sqaure.origin.x = CGRectGetWidth(frame) - kZHSquareSideSize;
            if (type == ZHRightTopPosition) {
                break;
            }
            
        case ZHLeftButtomPosition:
            sqaure.origin.y = CGRectGetHeight(frame) - kZHSquareSideSize;
            break;
            
        default:
            break;
    }
    
    return sqaure;
}

- (void)changePlayButtom {
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = kZHAnimationButtomDelay;
    [self.animatedButtom.layer addAnimation:transition forKey:kCATransition];
    
    self.animatedButtom.enabled = NO;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, kZHAnimationButtomDelay * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self.animatedButtom.enabled = YES;
        [self.animatedButtom setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
    });

    NSString  *title = self.changeTitle;
    [self.animatedButtom setTitle:title forState:UIControlStateNormal];
    [self.animatedButtom setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}

- (NSString *)changeTitle {
    NSString *playTitle = @"Play";
    NSString *stopTitle = @"Stop";
    NSString *currentTitle = self.animatedButtom.currentTitle;
    
    if (currentTitle == playTitle) {
        return stopTitle;
    }
    
    return playTitle;
}

@end