//
//  Hand.h
//  juggle
//
//  Created by clem on 01/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Throwable.h"
#import "Position.h"


@interface Hand : NSObject {
	NSNumber *x;
	NSNumber *y;
	Throwable *objThrowed;
}

- (id)throw:(Throwable *)obj to:(Hand *)hDest;
- (float)getPosX;
- (id)setPosX:(float)posX;
- (float)getPosY;
- (id)setPosY:(float)posY;
- (id)setThrowSpeed:(Hand *)hDest inSeconds:(float)t;
- (float)speedToGoToX:(float)posX inSeconds:(float)t;
- (float)speedToGoToY:(float)posY inSeconds:(float)t;
- (id)setPositionX:(float)posX positionY:(float)posY;

@end
