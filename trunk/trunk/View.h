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
	CGMutablePathRef *path;
	CALayer *layerBall;
	CGImageRef ballImg;
}

//getter
-(CGMutablePathRef *)path;
-(void)setPath:(CGMutablePathRef *)newPath;
- (id)loadThrowablePath:(Throwable*) throwObj;
-(void)loadGraphics;
-(void)createObject;
//-(void)moveLayer:(CALayer*)layer to:(CGPoint)point;
-(void)initAnimation:(CALayer*)layer;

@end