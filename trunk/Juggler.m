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
	hRight = [[Hand alloc] init];
	hLeft = [[Hand alloc] init];
	[self setBeatTime:1.0];
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

-(id)setBeatTime:(float)t;
{
	beatTime=t;
}

@end
