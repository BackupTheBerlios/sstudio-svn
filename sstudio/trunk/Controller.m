//
//  Controller.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"
#import "Throwable.h"
#import "View.h"


@implementation Controller


- (IBAction)initialize:(id)sender
{
	aPattern = [[SSPattern alloc] init];
	[aPattern defineTestPattern];
	[aPattern preprocess];
	NSLog(@"SSPattern de test");
	NSLog(@"%@", aPattern);
}

-(IBAction)juggleButtonClick:(id)sender
{
	Movement *tMove;
	NSLog(@"juggle started");
	[oglShow setPattern:aPattern];
	tMove = [[aPattern movements] objectAtIndex:1];
	[self startSimulation];
}

-(void)startSimulation;
{
	const ts =0.05f;
	float nbSim;
	float old;
	Movement *tMove;
	countTime = [[NSNumber numberWithFloat:0.0f] retain];
	
	timer = [[NSTimer scheduledTimerWithTimeInterval:ts 
											  target:self
											selector:@selector(tmrInterrupt:)
											userInfo:nil 
											 repeats:YES] retain];
	/*
	for(nbSim=0; nbSim < 2; nbSim += 0.05){
		old = [countTime floatValue];
		[countTime release]; 
		countTime = [[NSNumber numberWithFloat: (old+0.05)] retain];
		tMove = [[aPattern movements] objectAtIndex:0];
		[tMove juggleItAtTime:[countTime floatValue]];
		[oglShow setNeedsDisplay:YES];		
	}
	*/
}


-(void)tmrInterrupt:(NSTimer *)aTimer;
{
	float old;
	Movement *tMove;
	old = [countTime floatValue];
	[countTime release]; 
	countTime = [[NSNumber numberWithFloat: (old+0.05)] retain];
	
	//process
	///calcule +affichage ici
	tMove = [[aPattern movements] objectAtIndex:0];
	[tMove juggleItAtTime:[countTime floatValue]];
	[oglShow setNeedsDisplay:YES];
	if([countTime floatValue] > 2.0f){
		[timer invalidate];
	}
}

@end
