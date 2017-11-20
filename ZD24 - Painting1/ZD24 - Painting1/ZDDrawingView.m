//
//  ZDDrawingView.m
//  ZD24 - Painting1
//
//  Created by mac on 20.11.17.
//  Copyright © 2017 Dima Zgera. All rights reserved.
//

#import "ZDDrawingView.h"

@interface ZDDrawingView()

@property (assign, nonatomic) CGPoint lastPoint;
@property (strong, nonatomic) UIColor* drawColor;

@end

@implementation ZDDrawingView

- (void) startDrawingInPoint:(CGPoint) point{
    NSLog(@"Start drawing: %@", NSStringFromCGPoint(point));
    self.lastPoint = point;
    self.drawColor = [self randomColor];
}

- (void) continueDrawingInPoint:(CGPoint) point{
    NSLog(@"Continue drawing: %@", NSStringFromCGPoint(point));
    [self drawLineAtPoint:point];
}

- (void) endedDrawingInPoint:(CGPoint) point{
    NSLog(@"Ended drawing: %@", NSStringFromCGPoint(point));
    [self drawLineAtPoint:point];
}

# pragma mark - Drawing

- (void) drawLineAtPoint:(CGPoint) point{
    
    UIGraphicsBeginImageContext(self.frame.size);
    CGRect drawRect = CGRectMake(0.0f, 0.0f,
                                 self.frame.size.width,
                                 self.frame.size.height);
    [self.image drawInRect:drawRect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 5.0f);
    CGContextSetStrokeColorWithColor(context, [self.drawColor CGColor]);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, self.lastPoint.x, self.lastPoint.y);
    CGContextAddLineToPoint(context, point.x, point.y);
    CGContextStrokePath(context);
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.lastPoint = point;
}

# pragma mark - Randoms

- (UIColor*) randomColor {
    CGFloat r = (CGFloat)(arc4random_uniform(256))/255.f;
    CGFloat g = (CGFloat)(arc4random_uniform(256))/255.f;
    CGFloat b = (CGFloat)(arc4random_uniform(256))/255.f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}




@end
