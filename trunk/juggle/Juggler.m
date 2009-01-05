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
	hRight = [[Hand alloc] init];
	hLeft = [[Hand alloc] init];
	NSLog(@"init Juggler");
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
@end
