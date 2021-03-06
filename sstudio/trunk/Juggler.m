//
//  Juggler.m
//  juggle
//
//  Created by clem on 20/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Juggler.h"
#import "SSPattern.h"
#import "Movement.h"

@implementation Juggler

-(id)init;
{
	if([self aPattern] != nil){
		[[self aPattern] release];
	}
	[self setAPattern: [[SSPattern alloc] init]];
	[self setThrowedAtCurrentSsTime: NO];
	return self;	
}

-(void)dealloc
{
	[super dealloc];
}

-(id)initWithPattern:(id)tPattern;
{
	if([self aPattern] != nil){
		[[self aPattern] release];
	}
	[self setAPattern: tPattern];
	[[self aPattern] setController:self];
	[self initHands];
	[self initBalls];	
	[[self aPattern] preprocess];	
	return self;
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
	
	timer = [[NSTimer scheduledTimerWithTimeInterval:[self sampleTime] 
											  target:self
											selector:@selector(tmrInterrupt:)
											userInfo:nil 
											 repeats:YES] retain];
	
	
	/*
	 for(realTime=0; realTime < 1; realTime += [self sampleTime]){
	 [self simAStep];
	 }
	 */
}

-(void)stopSimulation;
{
	[timer invalidate];
	[timer release];
	[[self aPattern] release];r
}

-(void)simAStep;
{
	//calcul du temps
	[self processRealTime];
	[self processSiteswapTime];
	//gestion des lancers
	[[self aPattern] processCatchAndThrow];
	//calcul des trajectoires
	[[self aPattern] juggleAtTime:realTime];
	//[self logBalls];
	NSLog(@"Juggler\n%@\n", self);
	[self logHands];
	[[self aSSView] setNeedsDisplay:YES];		
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
	int i, count = [balls count];
	for (i = 0; i < count; i++) {
		Throwable * aBall = [balls objectAtIndex:i];
		NSLog(@"%d %@", i, aBall);
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
	
	//desalloue s'il existe
	if (balls != nil){
		[balls release];
		balls = nil;
	}
	balls =[[NSMutableArray alloc] initWithCapacity:0];
	nbBalls = [[self aPattern] ballNumberNeeded];
	for (i = 0; i < nbBalls; i++) {
		aMove = [[self aPattern] getMovementThrowedAtSsTime:(i+1)];
		if (aMove){
			aBall = [[Throwable alloc] init];
			[aBall setValue:[NSNumber numberWithInt:i] forKey:@"number"];
			[aBall setMovementAssigned:aMove];
			[balls addObject:aBall];
			[[aMove throwHand] putBall:aBall];
			[aBall release];
		}
	}	
}

-(void)initHands;
{
	Hand *tHand;
	//alloc hands
	NSMutableArray *tHands;
	tHands = [[NSMutableArray alloc] initWithCapacity:2];
	tHand = [[Hand alloc] initWithIdentifier:@"R"];
	[tHands addObject: tHand];
	[tHand release];
	tHand = [[Hand alloc] initWithIdentifier:@"L"];	
	[ tHands addObject:tHand];
	[tHand release];
	hands = [[NSArray alloc] initWithArray: tHands];
	[tHands release];
	NSLog(@"count %u\n", [[[hands objectAtIndex:0] heldBalls] count]);
}

-(void)tmrInterrupt:(NSTimer *)aTimer;
{
	[self simAStep];
	if(realTime > 60.0f)
	{
		[timer invalidate];
	}
}

//fait avancer le ssTime si necessaire (realTime a avancé d'un beat)
-(void)processSiteswapTime;
{
	float tmpSSRealTime = 0;	
	tmpSSRealTime = [self ssAbsTime]*[self beatTime];	
	if( tmpSSRealTime < realTime )
	{
		ssAbsTime++;
		[self setThrowedAtCurrentSsTime:NO];
		NSLog(@"ThrowTime ++:%d\n", ssAbsTime);
		NSLog(@"relativeThrowTime:%d\n", [[self aPattern] relativeSsTimeForSsTime:ssAbsTime ]);
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
	return 0.05;
}

//duree d'un 1 (cascade: 50 tours/1:45)
-(float)beatTime;
{
	return 0.30f;
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
	str =[NSMutableString string];
	[str appendFormat:@"RealTime:%f\n", realTime];
	[str appendFormat:@"SiteTime:%d\n", ssAbsTime];
	//[self logBalls];
	[self logHands];
	return str;
}

- (SSPattern *) aPattern {
  return aPattern;
}

- (void) setAPattern: (SSPattern *) newValue {
  aPattern = newValue;
}


- (SSView *) aSSView {
  return aSSView;
}

- (void) setASSView: (SSView *) newValue {
	if(aSSView){
		[aSSView release];
	}
	aSSView = [newValue retain];
}


- (int) throwedAtCurrentSsTime {
  return throwedAtCurrentSsTime;
}

- (void) setThrowedAtCurrentSsTime: (int) newValue {
  throwedAtCurrentSsTime = newValue;
}

@end
