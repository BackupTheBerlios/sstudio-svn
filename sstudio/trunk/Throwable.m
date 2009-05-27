//
//  Object.m
//  juggle
//
//  Created by clem on 01/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Throwable.h"


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
	NSString *str = [[NSString alloc] initWithFormat: @"position:%d",x ];
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

-(void)positionAtTime:(NSNumber *)time
{
	[self setX: ([self getSpeedX]*[time floatValue])];
	[self setY: (([self getSpeedY]*[time floatValue]) - (0.5*9.81*[time floatValue]*[time floatValue])+[self y])];
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

-(void)throwAccordingMovement:(Movement*)aMove;
{
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
	return [self movementAssigned];
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
