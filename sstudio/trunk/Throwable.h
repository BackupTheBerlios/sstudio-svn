//
//  Object.h
//  juggle
//
//  Created by clem on 01/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Throwable : NSObject {
	NSNumber *number;
	NSNumber *x;
	NSNumber *y;
	NSNumber *vx;
	NSNumber *vy;
	NSMutableArray *trajectory;
}

- (id)initWithNumber:(int)tNum;
- (void)positionAtTime:(NSNumber *)time;
- (NSString *)showTrajectory;
- (id)deleteTrajectory;

/*getter - setter*/
 - (void)setX:(float)tX;
 - (float)x;
 - (void)setY:(float)tY;
 - (float)y;
- (id)setSpeedX:(float)speedX y:(float)speedY;
- (float)getSpeedX;
- (float)getSpeedY;
- (NSMutableArray *)trajectory;

@end
