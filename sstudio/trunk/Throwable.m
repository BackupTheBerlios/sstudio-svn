//
//  Object.m
//  juggle
//
//  Created by clem on 01/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"
#import "Throwable.h"
#import "Hand.h"
#import "SSPosition.h"


@implementation Throwable

- (id)init
{
	[super init];
	x = [NSNumber numberWithFloat:0];
	[x retain];
	y = [NSNumber numberWithFloat:0];
	[y retain];
	vx = [NSNumber numberWithFloat:1.0f];
	[vx retain];
	vy = [NSNumber numberWithFloat:2.0f];
	[vy retain];
	trajectory = [[NSMutableArray alloc] init];
	return self;
}

-(void)dealloc;
{
	NSLog(@"Throwable dealloc \n");
	[x release];
	[y release];
	[vx release];
	[vy release];
	[super dealloc];
}

- (id)initWithNumber:(int)tNum
{
	[self init];
	number = [NSNumber numberWithInt:tNum];
	[number retain];
	return self;
}


- (NSString *)description
{
	NSMutableString *str = [[NSMutableString alloc] init];
	[str appendFormat:@"Ball %@ - X=%3.2f - Y=%3.2f ", number, [self x], [self y]];
	[str appendFormat:@" ssTThred:%d relTime:%f", ssTimeThrowed, relativeTime];
	return str;
}



- (void)setX:(float)tX;{
	[x release];
	x = [NSNumber numberWithFloat:tX];
	[x retain];	
}
- (float)x{
	return [x floatValue];
}

- (void)setY:(float)tY;{
	[y release];
	y = [NSNumber numberWithFloat:tY];
	[y retain];	
}
- (float)y{
	return [y floatValue];
}

-(id)controller;
{
	return [movementAssigned controller];
}

- (id)setSpeedX:(float)speedX y:(float)speedY
{
	[vx release];
	[vy release];
	vx = [NSNumber numberWithFloat:speedX];	
	vy = [NSNumber numberWithFloat:speedY];	
	[vx retain];
	[vy retain];	
	return self;
}

- (float)getSpeedX
{
	return [vx floatValue];
}

- (float)getSpeedY
{
	return [vy floatValue];
}

-(void)positionAtTime:(float)aTime;
{
	float newY, newX;
	Hand *throwHand;
	throwHand = [movementAssigned throwHand];
	relativeTime = [self relativeRealTime];//aTime - ssTimeThrowed * [[self controller] beatTime];
	aTime = relativeTime;
	//NSLog("%@", self);
	if (aTime >= 0.0f && (aTime <= [[[self movementAssigned] airTimeInSeconds] floatValue])){
		newY = ([self getSpeedY]*aTime) - (0.5*9.81*aTime*aTime)+[[movementAssigned throwHand] getPosY];
		newX = [self getSpeedX]*aTime + [[movementAssigned throwHand] getPosX];
		//NSLog(@"%f;%f", newX, newY);
		[self setX:newX];
		[self setY:newY];
	}
}

- (NSMutableArray *)trajectory
{
	return trajectory;
}

- (NSString *)showTrajectory
{
	int i;
	NSMutableString *result= [[NSMutableString alloc] init];
	NSString *str;
	for ( i=0; i < [trajectory count]; i++)
	{
		str = [[NSString alloc] initWithFormat: @"%@", [trajectory objectAtIndex:i]];
		[result appendString:str];
	}
	return str;
}

//place la main et la balle prete etre lancé
-(void)preprocess;
{
	Hand *throwHand;
	SSPosition *aDestPos;
	float tBeat;
	aDestPos = [[SSPosition alloc] init];
	//place les mains pr calcul speed
	throwHand = [[self movementAssigned] throwHand];
	[[throwHand handPos] placeAtPos: [movementAssigned valueForKey:@"thrPos"]];	
	[aDestPos placeAtPos: [movementAssigned valueForKey:@"catPos"]];

	[self setX:[throwHand getPosX]];
	[self setY:[throwHand getPosY]];
	[throwHand setObjThrowed:self];
	tBeat = [[movementAssigned controller] beatTime];
	[throwHand setThrowSpeed:aDestPos inSeconds: tBeat*[[movementAssigned valueForKey:@"ssBase"] intValue]]; //temps total de la trajectoire
}

//retourne le ss relatif (cad comme s'il n'y avait qu'un cycle)
-(int)relativeSsTime;
{
	int tBeatLenght;
	int tSsAbsTime;
	/*
	 tBeatLenght = [[self controller] ssAbsTime];
	tSsAbsTime = [[[self movementAssigned] sourcePattern] beatLenght];
	return ( tBeatLenght % tSsAbsTime);
	 */
	return [[self controller] ssAbsTime]-[self ssTimeThrowed];
}

-(float)relativeRealTime;
{
	/*
	int tBeatTime, fullSsCyclesElapsed;
	float rTFullCyclesElapsed;
	tBeatTime =[[self controller] beatTime];
	//nombre de cycles entier
	fullSsCyclesElapsed = [[self controller] ssAbsTime] / [[self sourcePattern] beatLenght];
	
	//temps reel ecoulée en full cycles
	rTFullCyclesElapsed = fullSsCyclesElapsed * tBeatTime;
	//on ajoute le tps du cycle non termine
	rTFullCyclesElapsed += [self relativeSsTime]*tBeatTime;
	
	return [[self controller] realTime]-rTFullCyclesElapsed;
	 */
	float t;
	if ( [self relativeSsTime]){
		t = [[self controller] realTime] - [[self controller] ssAbsTime]*[[self controller] beatTime];
		return [self relativeSsTime]*[[self controller] beatTime]+t;
	}
	else{
		return 0.0f;
	}
}

-(void)catchBall;
{
}

- (id)deleteTrajectory
{
	[trajectory removeAllObjects];
	return self;
}

-(id)movementAssigned;
{
	if (movementAssigned == nil){
		NSLog(@"movementAssigned = nil\n");
	}
	return movementAssigned;
}

-(void)setMovementAssigned:(id)aMovement;
{
	movementAssigned = aMovement;
}

-(int)ssTimeThrowed;
{
	return ssTimeThrowed;
}

-(void)setSsTimeThrowed:(int)aSsTime;
{
	ssTimeThrowed = aSsTime;
}

@end
