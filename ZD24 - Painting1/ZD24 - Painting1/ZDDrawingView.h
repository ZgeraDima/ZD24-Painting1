//
//  ZDDrawingView.h
//  ZD24 - Painting1
//
//  Created by mac on 20.11.17.
//  Copyright © 2017 Dima Zgera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDDrawingView : UIImageView

- (void) startDrawingInPoint:(CGPoint) point;
- (void) continueDrawingInPoint:(CGPoint) point;
- (void) endedDrawingInPoint:(CGPoint) point;


@end
