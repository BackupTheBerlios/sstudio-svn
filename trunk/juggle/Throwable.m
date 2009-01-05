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
	/*x = [NSNumber numberWithFloat:0];
	x = [NSNumber numberWithFloat:0];;
	vx = [NSNumber numberWithFloat:0];
	vy = [NSNumber numberWithFloat:0];*/
	x=1;
	y=0;
	vx=0;
	vy=0;
	NSLog(@"x:%f",x);
	trajectory = [[NSMutableArray alloc] init];
	NSLog(@"init");
	return self;
}

- (NSString *)description
{
	NSString *str = [[NSString alloc] initWithFormat: @"position:%d",x ];
	return str;
}

- (id)setSpeedX:(float)speedX y:(float)speedY
{
	vx = speedX;
	vy = speedY;
	NSLog(@"x:%f y:%f",x,y);
	return self;
}

- (float)getSpeedX
{
	return vx;
}

- (float)getSpeedY
{
	return vy;
}

- (id)trajectory
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
	return result;
}

- (id)deleteTrajectory
{
	[trajectory removeAllObjects];
	return self;
}

@end
