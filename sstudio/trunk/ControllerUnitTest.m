//
//  ControllerUnitTest.m
//  juggle
//
//  Created by clem on 20/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ControllerUnitTest.h"
#import "Controller.h"

@class SSPattern;


@implementation ControllerUnitTest

-(id)init
{
	if (![super initWithWindowNibName:@"SSUnitTest"])
		return nil;
	
	return self;
}

-(IBAction)launchTest:(id)sender;
{
	NSLog(@"Test lancé");
	[self testBasicThrow];
}

-(void)testBasicThrow;
{
	SSPattern *basicPattern;
	testJuggler = [[Juggler alloc] init];
	//definit le pattern
	basicPattern = [[SSPattern alloc] init];
	[basicPattern define3Throw];
	[testJuggler initWithPattern:basicPattern];
	[testJuggler setASSView:aTestView];
	[[testJuggler aSSView] setPattern:basicPattern];
	[testJuggler startSimulation];
}

@end
