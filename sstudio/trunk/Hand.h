//
//  Hand.h
//  juggle
//
//  Created by clem on 01/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Throwable.h"
#import "Movement.h"
#import "SSPosition.h"


@interface Hand : NSObject {
	id controller;
	//NSNumber *x;
	//NSNumber *y;
	NSString *identifier;
	SSPosition *handPos;
	Throwable *objThrowed;
	NSMutableArray *heldBalls;
}

-(id)initWithIdentifier:(NSString *)aIdentifier;
-(float)speedToGoToX:(float)posX inSeconds:(float)timing;
-(float)speedToGoToY:(float)posY inSeconds:(float)t;
-(id)placeAtPos:(NSString*)tMark;
-(void)prepareThrowSiteForMove:(Movement *)move;
-(void)putBall:(Throwable *)aBall;
-(Throwable *)getBall;

/* getter - setter */
-(id)heldBalls;
-(float)getPosX;
-(id)setPosX:(float)posX;
-(float)getPosY;
-(id)setPosY:(float)posY;
-(void)setObjThrowed:(Throwable *)tBall;
-(id)setThrowSpeed:(SSPosition *)destPosition inSeconds:(float)t;
-(id)setPositionX:(float)posX positionY:(float)posY;

- (SSPosition *) handPos;
- (void) setHandPos: (SSPosition *) newValue;
@end
