//
//  Object.h
//  juggle
//
//  Created by clem on 01/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Throwable : NSObject {
	float x;
	float y;
	float vx;
	float vy;
	NSMutableArray *trajectory;
}

- (float)posX;
- (float)posY;
//mettre les speed dans Hand
- (id)setSpeedX:(float)speedX y:(float)speedY;
- (float)getSpeedX;
- (float)getSpeedY;
- (NSMutableArray *)trajectory;
- (NSString *)showTrajectory;
- (id)deleteTrajectory;
@end
