//
//  View.h
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface View : NSView {
	CGMutablePathRef *path;
	CALayer *layerBall;
	CGImageRef ballImg;	
}

- (id)loadThrowablePath;
-(void)createObject;
//-(void)moveLayer:(CALayer*)layer to:(CGPoint)point;
-(void)vibAnimation:(CALayer*)layer;

@end
