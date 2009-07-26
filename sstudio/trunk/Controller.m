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
	//patternArrayCtrl = [[NSArrayController alloc] init];
	return self;
}

-(void)dealloc;
{
	[aJuggler release];
	[super dealloc];
}

-(void)awakeFromNib;
{
	NSLog(@"controller awake");
	//[patternArrayCtrl addObjects:[[aJuggler aPattern] movements] ];
	//[patternTableView setNeedsDisplay:YES];
}


-(IBAction)juggleButtonClick:(id)sender
{
	SSPattern *tPat;
	NSLog(@"juggle started");
	tPat = [[SSPattern alloc] init];
	//[tPat define3bCascadePattern];
	tPat = [self getSelectedPattern];
	[aJuggler setAPattern:tPat];
	[[aJuggler aPattern] setController:aJuggler];
	[aJuggler initHands];
	[aJuggler initBalls];
	[[aJuggler aPattern] preprocess];	
	[oglShow setPattern:[aJuggler aPattern] ];	
	[aJuggler setASSView: oglShow];
	[aJuggler startSimulation];
}

-(IBAction)stopButtonClick:(id)sender;
{
	[aJuggler stopSimulation];
}

-(IBAction)showTestView:(id)sender;
{
	if (!aCtrlUnitTest) {
		aCtrlUnitTest = [[ControllerUnitTest alloc] init];
	}
	[aCtrlUnitTest showWindow:self];
}

-(id)getSelectedPattern
{
	SSPattern *tPat;
	Movement *move;
	int tThrTime;
	NSNumber *num;

	tPat = [[SSPattern alloc] init]; //TODO: memory
	
	NSUInteger i, count = [[movements arrangedObjects] count];
	
	for (i = 0; i < count; i++) {
		move = [[Movement alloc] init]; //TODO: memory
		NSObject * obj = [[movements arrangedObjects] objectAtIndex:i];
		//[move setValue:[obj valueForKey:@"thrTime"] forKey:@"thrTime"];
		tThrTime = [[obj valueForKey:@"thrTime"] intValue];
		num = [[NSNumber numberWithInt: tThrTime] retain];
		[move setValue:num forKey:@"thrTime"];	
		[move setValue:[obj valueForKey:@"ssBase"] forKey:@"ssBase"];
		[move setValue:[obj valueForKey:@"thrSite"] forKey:@"thrSite"];
		[move setValue:[obj valueForKey:@"thrPos"] forKey:@"thrPos"];
		[move setValue:[obj valueForKey:@"catSite"] forKey:@"catSite"];
		[move setValue:[obj valueForKey:@"catPos"] forKey:@"catPos"];
		[move setSourcePattern:tPat];
		[tPat addMovement:move];
		[move release];
	}
	return tPat;
}

@end