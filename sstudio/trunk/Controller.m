//
//  Controller.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"
#import "Juggler.h"


@implementation Controller

-(id)init;
{
	aJuggler = [[Juggler alloc] init];
	return self;
}

-(IBAction)juggleButtonClick:(id)sender
{
	NSLog(@"juggle started");
	[oglShow setPattern:[aJuggler aPattern]];	
	[aJuggler setASSView: oglShow];	
	[aJuggler startSimulation];
}

-(IBAction)showTestView:(id)sender;
{
	if (!aCtrlUnitTest) {
		aCtrlUnitTest = [[ControllerUnitTest alloc] init];
	}
	[aCtrlUnitTest showWindow:self];
}

@end