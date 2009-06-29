//
//  Hand.m
//  juggle
//
//  Created by clem on 01/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "Controller.h"
#import "Hand.h"
#import "SSPattern.h"
#import "SSPosition.h"

@class SSPosition;

@implementation Hand

- (id)init
{
	[super init];
	[self setHandPos: [[SSPosition alloc] initX:0.0 Y:0.0]];
	heldBalls = [[[NSMutableArray alloc] initWithCapacity:0] retain];
	return self;
}

-(NSString *)description
{
	NSMutableString *str = [[[NSMutableString alloc] init] autorelease];
	NSUInteger tCount = [heldBalls count];
	[str appendFormat:@"x=%2.2f y=%2.2f heldBalls:%ld\n", [[self handPos] getX], [[self handPos] getY], tCount];
	return [[NSString alloc] initWithString: str];
}

-(id)heldBalls;
{
	return heldBalls;
}

- (float)getPosX
{
	return [[self handPos] getX];
}

- (id)setPosX:(float)posX
{
	[[self handPos] setX: posX];
	return self;
}

- (id)setPosY:(float)posY
{
	[[self handPos] setY: posY];
	return self;
}

- (float)getPosY
{
	return [[self handPos] getY];
}

- (void)setObjThrowed:(Throwable *)tBall;
{
	objThrowed = tBall;
}

-(void)prepareThrowSiteForMove:(Movement *)move;
{
	if ( [[move valueForKey:@"thrSite"] isEqual: @"R"])
	{
		[self setPositionX:0.5f positionY:0.0f];
	}
	if ( [[move valueForKey:@"thrSite"]  isEqual: @"L"])
	{
		[self setPositionX: -0.5f positionY:0.0f];
	}
}

- (id)setThrowSpeed:(SSPosition *)destPosition inSeconds:(float)timing
{
	NSLog(@"setThrowSpeed (time=%f)\n"), timing;
	float speedx = [self speedToGoToX:[destPosition getX] inSeconds:timing];
	//NSLog(@"speedx: %f", speedx);
	float speedy = [self speedToGoToY:[destPosition getY] inSeconds:timing];
	//NSLog(@"speedy: %f", speedy);
	[objThrowed setSpeedX:speedx y:speedy ];
	return self;
}

//equation du mouvement sur X
- (float)speedToGoToX:(float)posX inSeconds:(float)t
{
	if(t==0){
		NSLog(@"Erreur: speedToGoToX t=0\n");
		return 0;
	}
	return ( (posX/t)-[objThrowed x]/t);
}

//TODO: division par 0 
//equation du mouvement sur Y
- (float)speedToGoToY:(float)posY inSeconds:(float)t
{
	if(t==0){
		NSLog(@"Erreur: speedToGoToY t=0\n");
		return 0;
	}
	return (posY/t+(0.5*9.81*t)-([objThrowed y]/t));
}

//
-(id)setPositionX:(float)posX positionY:(float)posY
{
	/*
	[x release];
	x = [NSNumber numberWithFloat: posX];
	[x retain];
	[y release];
	y = [NSNumber numberWithFloat: posY];
	[y retain];
	 */
	[[self handPos] setX:posX];
	[[self handPos] setY:posY];
	return self;
}

//positionne la main a la position representée par la lettre
- (id)placeAtPos:(NSString*)tMark
{
	if ([tMark isEqualToString:@"m"])
	{
		[self setPositionX:0.0f positionY:0.0f];
	}
	if ([tMark isEqualToString:@"r"])
	{
		[self setPositionX:0.5f positionY:0.0f];
	}
	if ([tMark isEqualToString:@"l"])
	{
		[self setPositionX:-0.5f positionY:0.0f];
	}
	return self;
}

//met une balle dans la main
-(void)putBall:(Throwable *)aBall;
{
	[aBall setSsTimeThrowed:0];
	[heldBalls insertObject:aBall atIndex:0];
}

//retire la balle de la main
-(Throwable *)getBall;
{
	Throwable *aBall;
	if ([heldBalls count] > 0){
		aBall = [heldBalls lastObject];
		[heldBalls removeLastObject];
		NSLog(@"Ball throwed by getBall - retainCount:%d", [heldBalls retainCount]);
		return aBall;
	}
	else{
		NSLog(@"getBall: erreur");
		return nil;
	}
}

- (SSPosition *) handPos {
  return handPos;
}

- (void) setHandPos: (SSPosition *) newValue {
  [handPos autorelease];
  handPos = [newValue retain];
}

@end
