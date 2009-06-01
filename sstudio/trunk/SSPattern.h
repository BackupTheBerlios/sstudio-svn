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
-(id)defineTestPattern;
-(void)addMovement:(Movement *)move;
-(id)movements;
-(int)ballNumberNeeded;
-(int)relativeSsTimeForSsTime:(int)absSsTime;

//hand

//ball
-(Movement *)movementForAbsSiteswapTime;
-(void)preprocess;
-(void)juggleAtTime:(float)f;
-(Movement *)getMovementThrowedAtSsTime:(int)aSsTime;
-(void)processCatchAndThrow;

-(void)setController:(id)aController;
-(id)controller;


@end
