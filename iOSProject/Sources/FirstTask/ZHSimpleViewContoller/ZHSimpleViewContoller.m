//
//  ZHSimpleViewContoller.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 12.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHSimpleViewContoller.h"

#import "ZHSquareAnimatedView.h"

#import "ZHMacros.h"

ZHViewControllerBaseViewPropertyWithGetter(ZHSimpleViewContoller, squareAnimatedView, ZHSquareAnimatedView)

@implementation ZHSimpleViewContoller

#pragma mark -
#pragma Interface Handling

- (IBAction)onAutoButton:(id)sender {
    ZHSquareAnimatedView *squareAnimatedView = self.squareAnimatedView;
    [self.squareAnimatedView startAnimation];
    squareAnimatedView.animating = !squareAnimatedView.animating;
}

- (IBAction)onRandomButton:(id)sender {
    [self.squareAnimatedView moveToRandomPostion];
}

- (IBAction)animatedButton:(id)sender {
    [self.squareAnimatedView changePlayButton];
}

@end
