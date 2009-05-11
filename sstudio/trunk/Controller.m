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
	//[tMove juggleItAtTime:0.5f];
	[self startSimulation];
}

-(void)startSimulation;
{
	const ts =0.025f;
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
	Movement *tMove;
	old = [countTime floatValue];
	[countTime release]; 
	countTime = [[NSNumber numberWithFloat: (old+0.05)] retain];
	
	//process
	///calcule +affichage ici
	NSLog(@"boucle %f\n", old);
	tMove = [[aPattern movements] objectAtIndex:1];
	[tMove juggleItAtTime:[countTime floatValue]];
	[oglShow setNeedsDisplay:YES];
	if([countTime floatValue] > 2.0f){
		[timer invalidate];
	}
}

@end
