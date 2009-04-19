//
//  Juggler.m
//  juggle
//
//  Created by clem on 03/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Juggler.h"


@implementation Juggler

- (id)init
{
	[super init];
	NSLog(@"init Juggler");	
	ball = [[Throwable alloc] init];
	
	//init les mains
	hRight = [[Hand alloc] init];
	[hRight setPositionX:0.5f positionY:0.0f];
	hLeft = [[Hand alloc] init];
	[hLeft setPositionX:-0.5f positionY:0.0f];
	
	//init le pattern
	patt = [[SSPattern alloc] init];
	[patt defineTestPattern];
	[self setBeatTime:0.25];
	
	return self;
}

-(Hand *)rightHand
{
	NSLog (@"RH returned");
	return hRight;
}

-(Hand *)leftHand
{
	NSLog (@"LH returned");
	return hLeft;
}

-(SSPattern *)patt;
{
	return patt;
}
	

//retourne la main designée par @"R" ou @"L"
-(Hand *)getHand:(NSString *)str;
{
	if ([str isEqualToString:@"R"])
		return [self rightHand];
	else
	{
		if ([str isEqualToString:@"L"])
			return [self leftHand];
		else
		{
			NSLog(@"Erreur Juggler:getHand:nil");
			return nil;
		}
	}
}

-(float)beatTime
{
	return [self beatTime];
}

-(void)setBeatTime:(float)t;
{
	beatTime=t;
}

/* pbl gestion memoire
-(void)setPattern:(SSPattern *)tPat;
{
	pat = tPat;
	[pat retain];
	[tPat release];
}
 */

-(id)ballNumber:(int)num
{
	return ball;
}

//TODO: placer les mains selon SSPattern et calculer les trajectoires
// next: afficher avec Ogl depuis View
-(void)juggleMove:(Movement *)tMove
{
	Hand* hThrow;
	Hand* hCatch;
	NSLog(@"juggleMove:ssBase=%@", [tMove valueForKey:@"ssBase"]);
	//catch
	hCatch = [self getHand:[tMove valueForKey:@"catSite"]];
	[hCatch placeAtPos:[tMove valueForKey:@"catPos"]];
	
	//throw
	hThrow = [self getHand:[tMove valueForKey:@"thrSite"]];
	[hThrow placeAtPos:[tMove valueForKey:@"thrPos"]];
	
	[hThrow throw:ball to:hCatch];
	NSLog("juggleMove:trajectoire=%@",[ball trajectory]);
}

-(void)jugglePattern:(SSPattern *)tPat;
{
	//place les mains
	int iMove=0;
	Movement *move;
	for (iMove =0; [[tPat arrMovements] count]; iMove++)
	{
		move = [[tPat arrMovements] objectAtIndex:iMove];
	}
}

@end
