//
//  Pattern.h
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

/*
move: element unitaire
Pattern: ensemble de siteswap
 */

#import <Cocoa/Cocoa.h>
#import "Movement.h"
#import "Hand.h"


@interface SSPattern : NSObject {
	NSString *identifier;
	NSMutableArray *movements;
	id controller;
}

-(NSString *)description;
-(void)addMovement:(Movement *)move;
-(id)define3Throw1Ball;
-(id)define3Throw2Ball;
-(id)define3bCascadePattern;
-(id)define3bWindmill;
-(id)define4bFoutain;
-(void)addMovement:(Movement *)move;
-(int)ballNumberNeeded;
-(int)relativeSsTimeForSsTime:(int)absSsTime;

//ball
-(void)preprocess;
-(void)juggleAtTime:(float)f;
-(Movement *)getMovementThrowedAtSsTime:(int)aSsTime;
-(void)catchBallsAtSsTime:(int)aSsTime;
-(void)throwBallsAtSsTime:(int)tSsAbsTime;
-(void)processCatchAndThrow;

-(void)juggleAtTime:(float)f;

// getter - setter
-(id)movements;
-(void)setController:(id)aController;
-(id)controller;


@end
