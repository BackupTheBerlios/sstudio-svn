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
-(id)define3bCascadePattern;
-(void)addMovement:(Movement *)move;
-(int)ballNumberNeeded;
-(int)relativeSsTimeForSsTime:(int)absSsTime;

//ball
-(void)preprocess;
-(void)juggleAtTime:(float)f;
-(Movement *)getMovementThrowedAtSsTime:(int)aSsTime;
-(void)processCatchAndThrow;


// getter - setter
-(id)movements;
-(void)setController:(id)aController;
-(id)controller;


@end
