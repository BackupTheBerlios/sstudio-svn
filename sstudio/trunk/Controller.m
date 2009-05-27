//
//  Controller.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"
#import "Throwable.h"


@implementation Controller


- (IBAction)initialize:(id)sender
{
	aPattern = [[SSPattern alloc] init];
	[aPattern setController:self];
	[aPattern defineTestPattern];

	//alloc ball
	Throwable *aBall;
	NSUInteger i,nbBalls = [aPattern ballNumberNeeded];
	balls = [[NSMutableArray alloc] initWithCapacity:nbBalls];
	for (i=0; i < nbBalls; i++) {
		aBall = [[Throwable alloc] init];
		[balls addObject:aBall];
	}

	[aPattern preprocess];
	NSLog(@"SSPattern de test");
	NSLog(@"%@", aPattern);
}

-(IBAction)juggleButtonClick:(id)sender
{
	NSLog(@"juggle started");
	[oglShow setPattern:aPattern];
	[self startSimulation];
}

-(void)startSimulation;
{
	float nbSim;
	realTime = 0;
	ssAbsTime = 1;
	timer = [[NSTimer scheduledTimerWithTimeInterval:[self sampleTime] 
											  target:self
											selector:@selector(tmrInterrupt:)
											userInfo:nil 
											 repeats:YES] retain];
	/*
	float old;
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
	//calcul du temps
	[self processRealTime];
	[self processSiteswapTime];

	///calcule +affichage ici
	[aPattern processCatchAndThrow];
	[aPattern juggleAtTime:realTime];

	[oglShow setNeedsDisplay:YES];
	if(realTime > 2.0f)
	{
		[timer invalidate];
	}
}

//fait avancer le ssTime si necessaire (realTime a avancé d'un beat)
-(void)processSiteswapTime;
{
	int tmpSSRealTime = 0;	
	tmpSSRealTime = [self ssAbsTime]*[self beatTime];	
	if( tmpSSRealTime < realTime )
	{
		ssAbsTime++;
		NSLog(@"ThrowTime ++:%d\n", ssAbsTime);
		NSLog(@"relativeThrowTime:%d\n", [aPattern relativeSsTimeForSsTime:ssAbsTime ]);
	}		
}

//fait avancer le temps
-(void)processRealTime;
{
	float old;
	old = realTime;
	realTime = realTime + [self sampleTime];
}

-(float)sampleTime;
{
	return 0.025f;
}

//duree d'un 1 (cascade: 50 tours/1:45)
-(float)beatTime;
{
	return 0.32f;
}

-(float)realTime;
{
	return realTime;
}

-(int)ssAbsTime;
{
	return ssAbsTime;
}

@end
