//
//  Controller.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"

@implementation Controller


- (IBAction)initialize:(id)sender
{
	aPattern = [[SSPattern alloc] init];
	[aPattern defineTestPattern];
	NSLog(@"SSPattern de test");
	NSLog(@"%@", aPattern);
}

-(IBAction)juggleButtonClick:(id)sender
{
	Movement *tMove;
	NSLog(@"juggle started");
	[self startSimulation];
}

-(void)startSimulation;
{
	const ts =0.050;
	countTime = [[NSNumber numberWithFloat:0.0f] retain];
	timer = [[NSTimer scheduledTimerWithTimeInterval:ts 
											  target:self
											selector:@selector(tmrInterrupt:)
											userInfo:nil 
											 repeats:YES] retain];
}


-(void)tmrInterrupt:(NSTimer *)aTimer;
{
	float old;
	old = [countTime floatValue];
	[countTime release]; 
	countTime = [[NSNumber numberWithFloat: (old+0.05)] retain];
	
	//process
	///calcule +affichage ici
	[oglShow setNeedsDisplay:YES];
}

@end
