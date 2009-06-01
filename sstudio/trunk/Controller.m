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
	[self initHands];
	[aPattern defineTestPattern];
	
	//on place les balles dans les mains
	[self initBalls];	
	[aPattern preprocess];

	NSLog(@"SSPattern de test");
	NSLog(@"%@", aPattern);
	NSLog(@"%@\n", self);
}

-(IBAction)juggleButtonClick:(id)sender
{
	NSLog(@"juggle started");
	[oglShow setPattern:aPattern];
	[self startSimulation];
}


-(Hand *)rightHand
{
	return [hands objectAtIndex:0];
}

-(Hand *)leftHand
{
	return [hands objectAtIndex:1];
}

-(Hand *)handForSite:(NSString *)tSite;
{
	if ( [tSite isEqualToString:@"R"] ) return [self rightHand];
	else return [self leftHand];
}


-(void)startSimulation;
{
	
	float nbSim;
	realTime = 0;
	ssAbsTime = 0;
	/*
	timer = [[NSTimer scheduledTimerWithTimeInterval:[self sampleTime] 
											  target:self
											selector:@selector(tmrInterrupt:)
											userInfo:nil 
											 repeats:YES] retain];
	 
	*/
	
	for(realTime=0; realTime < 1; realTime += [self sampleTime]){
		[self simAStep];
	}
	
}

-(void)simAStep;
{
	[self processRealTime];
	[self processSiteswapTime];
	NSLog(@"%@\n", self);
	///calcule +affichage ici
	NSLog(@"count simAStep %u\n", [[[hands objectAtIndex:0] heldBalls] count]);
	[aPattern processCatchAndThrow];
	[aPattern juggleAtTime:realTime];
	[self logBalls];
	[self logHands];
	[oglShow setNeedsDisplay:YES];		
}

-(id)balls;
{
	return balls;
}

-(Throwable *)ballNumber:(int)num;
{
	return [balls objectAtIndex:num];	
}

-(void)logBalls;
{
	NSUInteger i, count = [balls count];
	for (i = 0; i < count; i++) {
		Throwable * obj = [balls objectAtIndex:i];
		NSLog(@"%@", i, balls);
	}
}

-(void)logHands;
{
	NSLog(@"right Hand:%@\n", [self rightHand]);
	NSLog(@"left Hand:%@\n", [self leftHand]);
}

-(NSArray *)hands;
{
	return hands;
}

//place 1 balle sur 2 dans les mains en commencant par la droite
-(void)initBalls;
{
	NSUInteger nbBalls,i;
	Movement *aMove;
	Throwable *aBall;
	nbBalls = [aPattern ballNumberNeeded];
	for (i = 0; i < nbBalls; i++) {
		aMove = [aPattern getMovementThrowedAtSsTime:(i+1)];
		if (aMove){
			aBall = [[Throwable alloc] init];
			[balls addObject:aBall];
			[[aMove throwHand] putBall:aBall];
		}
	}	
}

-(void)initHands;
{
	//alloc hands
	NSMutableArray *tHands;
	tHands = [[NSMutableArray alloc] initWithCapacity:2];
	[ tHands addObject:[[Hand alloc] init] ];
	[ tHands addObject:[[Hand alloc] init] ];
	hands = [[NSArray alloc] initWithArray: tHands];
	NSLog(@"count %u\n", [[[hands objectAtIndex:0] heldBalls] count]);
	[tHands release];
}

-(void)tmrInterrupt:(NSTimer *)aTimer;
{
	[self simAStep];
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

-(NSString *)description;
{
	NSMutableString *str;
	str = [[NSMutableString alloc] init];
	[str appendFormat:@"\nRealTime:%f\n", realTime];
	[str appendFormat:@"SiteTime:%d\n", ssAbsTime];
	NSUInteger i, count = [balls count];
	for (i = 0; i < count; i++) {
		Throwable * ball = [balls objectAtIndex:i];
		NSLog(@"ball %d\n%@\n", i, ball);
	}
	return str;
}

@end
