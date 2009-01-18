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
	hRight = [[Hand alloc] init];
	hLeft = [[Hand alloc] init];
	[self setBeatTime:0.25];
	return self;
}

-(id)rightHand
{
	NSLog (@"RH returned");
	return hRight;
}

-(id)leftHand
{
	NSLog (@"RH returned");
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