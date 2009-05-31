//
//  Pattern.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "SSPattern.h"
#import "Controller.h"
#import "Throwable.h"


@implementation SSPattern

- (id)init;
{
	NSMutableArray *tHands;
	NSMutableArray *tBalls;
	Throwable *tBall;
	NSUInteger i,nbBalls = [self ballNumberNeeded];
	[super init];
	//alloc movements
	movements = [[NSMutableArray alloc] initWithCapacity:0];
	
	//alloc balls
	Throwable *aBall;

//	balls = [[NSMutableArray alloc] initWithCapacity:0];
	
	return self;
}

//affichage du siteswap sous forme de tableau recapitulatif
 - (NSString *)description;
{
	NSMutableString *result;
	unsigned int nbMovements,i;
	unsigned int nbInfos ,j;
	Movement *aMove;
	NSString *info, *value;
	NSArray *listInfos = [[NSArray alloc] initWithObjects:
						@"thrTime", @"ssBase", @"thrSite", @"thrPos", @"catSite", @"catPos", nil];	
	result = [[NSMutableString alloc] initWithString:@"\nPattern\n"];
	nbMovements = [movements count];
	nbInfos = [listInfos count];

	//parcours tous les moves pour chaque info
	for (j=0; j < nbInfos; j++)
	{
		info = [listInfos objectAtIndex:j];
		[result appendString: [info stringByPaddingToLength:10 withString:@" " startingAtIndex:0] ];
		for (i=0; i < nbMovements; i++)
		{
			aMove = [movements objectAtIndex:i];
			value = [aMove valueForKeyPath:info];
			if  (!value){
				value = [[NSString alloc] initWithString:@" "];
			}
			[result appendString:value];			
			[result appendString:@" | "];
		}
		[result appendString:@"\n"];
	}
	return result;
}

-(id)defineTestPattern;
{
	Movement *move;
	Throwable *aBall;
	//cascade 3B
	identifier = [[NSString alloc] initWithString:@"cascade 3 balles"];
	//1er mouvement
	move = [[Movement alloc] init];
	[move setValue:[NSNumber numberWithInt:1] forKey:@"thrTime"];
	[move setValue:@"1" forKey:@"thrTime"];	
	[move setValue:@"3" forKey:@"ssBase"];
	[move setValue:@"L" forKey:@"thrSite"];
	[move setValue:@"l" forKey:@"thrPos"];
	[move setValue:@"R" forKey:@"catSite"];
	[move setValue:@"r" forKey:@"catPos"];
	[self addMovement:move];
	
	//2eme mouvement
	move = [[Movement alloc] init];
	[move setValue:[NSNumber numberWithInt:2] forKey:@"thrTime"];
	[move setValue:@"2" forKey:@"thrTime"];	
	[move setValue:@"3" forKey:@"ssBase"];
	[move setValue:@"R" forKey:@"thrSite"];
	[move setValue:@"r" forKey:@"thrPos"];
	[move setValue:@"L" forKey:@"catSite"];
	[move setValue:@"l" forKey:@"catPos"];
	[self addMovement:move];
	return self;
}

-(void)addMovement:(Movement *)move;
{
	[move setSourcePattern: self];
	[movements insertObject:move atIndex:[movements count]];
}

-(id)movements;
{
	return movements;	
}

//TODO: unit test
-(int)ballNumberNeeded;
{
	int sumSS=0;
	int i;
	for(i=0; i < [movements count]; i++)
	{
		sumSS += [[[movements objectAtIndex:i] valueForKey:@"ssBase"] intValue];
	}
	
	return (sumSS/i);
}

-(int)ssBeatDuration;
{
	/*
	int nbMove;
	int sumSs = 0;
	for (nbMove = 0; nbMove < [movements count]; nbMove++) {
		sumSs = sumSs + [[movements objectAtIndex:nbMove] valueForKey:@"thrTime"
	}
	 */
	return [[[movements lastObject] valueForKey:@"thrTime"] intValue];
}


-(int)relativeSsTimeForSsTime:(int)absSsTime;
{
	return (absSsTime % [self ssBeatDuration]);
}

-(Throwable *)ballNumber:(int)num;
{
	return [[controller balls] objectAtIndex:num];	
}

-(Movement *)movementForAbsSiteswapTime;
{
	
}
//pre-process chaque move
-(void)preprocess;
{
	int numMovement;
	Movement *aMove;
	for(numMovement=0; numMovement < [movements count]; numMovement++){
		aMove = [movements objectAtIndex:numMovement];
		[aMove preprocess];
	}
}

-(void)juggleAtTime:(float)f;
{
	int nbMovements;
	Movement *aMovement;
	float relativeTime, moveTime;
	moveTime = 0;
	relativeTime = 0;
	/*
	for(nbMovements = 0; nbMovements < [[self movements] count]; nbMovements++){
		aMovement = [[self movements] objectAtIndex:nbMovements];
		if([aMovement isInHand]){
		}
		if([aMovement isInAirAtSsTime:[[self controller] ssThrowTime]])
		{
			moveTime = ([[aMovement valueForKey:@"thrTime"] floatValue])*((int)[[self controller] beatTime]);
			relativeTime = ([[self controller] realTime])+moveTime;
			[aMovement juggleItAtTime:relativeTime];
		}
	}
	*/	
	NSUInteger i, count = [[controller balls] count];
	for (i = 0; i < count; i++){
		Throwable *ball = [self ballNumber:i];
		if([ball movementAssigned]){
			[[ball movementAssigned] juggleItAtTime:f];
		}
	}
}

-(Movement *)isThrowAtSsTime:(int)aSsTime;
{
	int tRelTime;
	tRelTime = [self relativeSsTimeForSsTime:aSsTime];
	NSUInteger i, count = [movements count];
	for (i = 0; i < count; i++) {
		Movement *aMove = [movements objectAtIndex:i];
		if ([[aMove valueForKey:@"thrTime"] intValue] == tRelTime){
			return aMove;
		}
	}
	return nil;
}

-(void)processCatchAndThrow;
{
	NSUInteger tSsAbsTime, tSsRelTime, startSsTime, endSsTime;
	//throw => teste chaque move s'il doit etre lancé
	NSUInteger i, count = [movements count];
	NSLog(@"processCatchAndThrow\n");
	tSsAbsTime = [[self controller] ssAbsTime];
	Movement *aMove;
	for (i = 0; i < count; i++) {

		//TODO: rien n'est jamais assigné => lorsqu'on rattrape on prend en compte assignedMovement, 
		//lorqu'on lance on prend le curseur du ss
		//throw
		aMove = [self isThrowAtSsTime:tSsAbsTime];
		if (aMove){
			Hand *theThrHand;
			theThrHand = [[[aMove sourcePattern] controller] handForSite:[aMove valueForKey:@"thrSite"]];
			//[theThrHand ]
		}
	}
	
	//catch => teste chaque balle si elle doit atterrir
	Throwable * aBall;
	for(i=0; i < [[controller balls]  count]; i++){
		aBall = [self ballNumber:i];
		Movement * aMove = [aBall movementAssigned];
		if(aMove){ 
			endSsTime = startSsTime + [aBall ssTimeThrowed];
			if ( endSsTime == tSsRelTime){
				[aBall setSsTimeThrowed: 0];
			}
		}
	}
}
	 

/*getter-setter*/

-(void)setController:(id)aController;
{
	controller = aController;
}

-(id)controller;
{
	return controller;
}

@end
