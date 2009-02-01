//
//  View.h
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Throwable.h"

@interface View : NSView {
	CGMutablePathRef path;
	CALayer *mainLayer;
	CALayer *layerBall;
	CGImageRef ballImg;
}

- (id)loadThrowablePath:(Throwable*) throwObj;
-(CALayer *)mainLayer;
-(void)loadGraphics;
-(void)loadGraphicsFromURL;
-(void)createObject;
-(void)animateTrajectory:(Throwable *)objThrowed;
//-(void)animateTrajectoryToLayer:(CALayer *)layer;
-(void)basicAnimationForLayer;
//-(void)moveLayer:(CALayer*)layer to:(CGPoint)point;
-(void)initAnimation:(CALayer*)layer;

@end