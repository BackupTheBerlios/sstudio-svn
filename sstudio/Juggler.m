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

-(void)prepareHandForMove:(Movement *)move;
{
	/*if ( [[move valueForKey:@"thrSite"]  ] @"R")
	{
		[hRight setPositionX:0.5f positionY:0.0f];
	}*/
}

-(void)jugglePattern:(SSPattern *)pat;
{
	//place les mains
	int iMove=0;
	Movement *move;
	for (iMove =0; [[pat arrMovements] count]; iMove++)
	{
		move = [[pat arrMovements] objectAtIndex:iMove];
	}
}

@end
