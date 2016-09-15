//
//  ZHSquareAnimatedView.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 12.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ZHLeftTopPosition,
    ZHLeftButtomPosition,
    ZHRightButtomPosition,
    ZHRightTopPosition,
    
    ZHCountPosition,
} ZHSquarePosition;

typedef void(^ZHHandler)(void);

@interface ZHSquareAnimatedView : UIView
@property (nonatomic, strong) IBOutlet UIView           *squareView;
@property (nonatomic, readwrite) IBOutlet UIButton         *autoAnimation;
@property (nonatomic, strong) IBOutlet UIButton         *randomSquarePosition;

@property (nonatomic, assign) ZHSquarePosition          squarePosition;

@property (nonatomic, assign) BOOL                      shouldStop;

@property (nonatomic, assign, getter=isAnimating) BOOL  animating;

- (void)startAutoAnimation;
- (void)randomSquarePostion;

@end