//
//  ZHSquareAnimatedView.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 12.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ZHLeftTopPosition       = 0,
    ZHRightTopPosition      = 1,
    ZHRightButtomPosition   = 2,
    ZHLeftButtomPosition    = 3,
    
    ZHCountPosition         = 4,
} ZHSquarePosition;

@interface ZHSquareAnimatedView : UIView
@property (nonatomic, strong) IBOutlet           UIView           *squareView;
@property (nonatomic, assign)                    ZHSquarePosition     position;
@property (nonatomic, assign, getter=isAnimated) BOOL                animated;



@end