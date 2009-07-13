//
//  Object.h
//  juggle
//
//  Created by clem on 01/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Movement.h"


@interface Throwable : NSObject {
	NSNumber *number;
	NSNumber *x;
	NSNumber *y;
	NSNumber *vx;
	NSNumber *vy;
	Movement *movementAssigned;
	float relativeTime; //for dbging
	int ssTimeThrowed;
}

-(id)initWithNumber:(int)tNum;
-(void)positionAtTime:(float)aTime;
-(void)preprocess;
-(int)relativeSsTime;
-(float)relativeRealTime;

/* setter - getter */
-(void)setX:(float)tX;
-(float)x;
-(void)setY:(float)tY;
-(float)y;
-(id)controller;
-(id)setSpeedX:(float)speedX y:(float)speedY;
-(float)getSpeedX;
-(float)getSpeedY;
-(id)movementAssigned;
-(void)setMovementAssigned:(id)aMovement;
-(int)ssTimeThrowed;
-(void)setSsTimeThrowed:(int)aSsTime;

@end
