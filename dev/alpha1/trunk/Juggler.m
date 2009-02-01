//
//  Juggler.m
//  juggle
//
//  Created by clem on 03/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Juggler.h"


@implementation Juggler



- (id)init
{
	[super init];
	NSLog(@"init Juggler");	
	ball = [[Throwable alloc] init];
	hRight = [[[Hand alloc] init] retain];
	hLeft = [[[Hand alloc] init] retain];
	[self setBeatTime:0.25];
	return self;
}

-(Hand *)rightHand
{
	NSLog (@"RH returned");
	return hRight;
}

-(Hand *)leftHand
{
	NSLog (@"LH returned");
	return hLeft;
}

-(float)beatTime
{
	return [self beatTime];
}

-(void)setBeatTime:(float)t;
{
	beatTime=t;
}

-(id)ballNumber:(int)num
{
	return ball;
}

@end
