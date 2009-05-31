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
	//NSArray *hands;
	//NSArray *balls;
	id controller;
}

-(NSString *)description;
-(id)defineTestPattern;
-(void)addMovement:(Movement *)move;
-(id)movements;
-(int)ballNumberNeeded;
-(int)ssBeatDuration;
-(int)relativeSsTimeForSsTime:(int)absSsTime;

//hand

//ball
-(Throwable *)ballNumber:(int)num;
-(Movement *)movementForAbsSiteswapTime;
-(void)preprocess;
-(void)juggleAtTime:(float)f;
-(Movement *)isThrowAtSsTime:(int)aSsTime;
-(void)processCatchAndThrow;

-(void)setController:(id)aController;
-(id)controller;


@end
