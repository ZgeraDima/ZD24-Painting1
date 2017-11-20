//
//  ViewController.m
//  ZD24 - Painting1
//
//  Created by mac on 20.11.17.
//  Copyright © 2017 Dima Zgera. All rights reserved.
//

#import "ViewController.h"
#import "ZDDrawingView.h"


@interface ViewController () <UIGestureRecognizerDelegate>

@property (assign, nonatomic) CGPoint lastPoint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:panGesture];
    panGesture.delegate = self;
}

# pragma mark - Orientation

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        //UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        
        [self.drawingView setNeedsDisplay];
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
    }];
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (UIInterfaceOrientationMask)  supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

# pragma mark - Drawing

- (void) handlePan:(UIPanGestureRecognizer*) panGesture {
    CGPoint point = [panGesture locationInView:self.drawingView];
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        [self.drawingView startDrawingInPoint:point];
    } else if (panGesture.state == UIGestureRecognizerStateChanged) {
        [self.drawingView continueDrawingInPoint:point];
        
    } else if (panGesture.state == UIGestureRecognizerStateEnded ||
               panGesture.state == UIGestureRecognizerStateCancelled) {
        [self.drawingView endedDrawingInPoint:point];
    }
}


@end
