//
//  testSiteswap.m
//  juggle
//
//  Created by clem on 01/02/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "testSiteswap.h"
#include "SSPattern.h"
#import "Movement.h"


@implementation testSiteswap

-(void)testInputSiteswap
{
	STAssertEquals(YES, YES, @"Erreur");
}

-(void)testSiteswapDuration;
{
	SSPattern *aPattern;
	aPattern = [[SSPattern alloc] init];
	[aPattern defineTestPattern]; //cascade
	STAssertEquals([aPattern ssBeatDuration], 1, @"SsBeatDuration");
}

@end
