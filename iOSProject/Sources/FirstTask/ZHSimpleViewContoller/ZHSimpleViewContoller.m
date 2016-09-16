//
//  ZHSimpleViewContollerViewController.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 12.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHSimpleViewContollerViewController.h"

#import "ZHSquareAnimatedView.h"

#import "ZHMacros.h"

ZHViewControllerBaseViewPropertyWithGetter(ZHSimpleViewContollerViewController, squareAnimatedView, ZHSquareAnimatedView)

@implementation ZHSimpleViewContollerViewController

#pragma mark -
#pragma Interface Handling

- (IBAction)onAutoButton:(id)sender {
    ZHSquareAnimatedView *squareAnimatedView = self.squareAnimatedView;
    squareAnimatedView.animating = !squareAnimatedView.animating;
}

- (IBAction)onRandomButton:(id)sender {
    [self.squareAnimatedView randomSquarePostion];
}

- (IBAction)animatedButtom:(id)sender {
    [self.squareAnimatedView changePlayButtom];
}

@end
