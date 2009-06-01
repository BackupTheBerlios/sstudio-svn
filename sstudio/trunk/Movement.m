//
//  Siteswap.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"
#import "Movement.h"
#import "SSPattern.h"


@implementation Movement

-(id)init
{
	[super init];
	return self;
}

-(void)dealloc;
{
	[super dealloc];
}

-(id)initMovement;
{ 
	Movement *move;
	move = [[Movement alloc] init];
	[move setSsBase:@"3"];
	[move setThrTime:@"1.5"];
	return move;
}

-(void)juggleItAtTime:(float)t;
{
	//positionner les mains
	SSPattern *aPat;
	Hand *rH, *lH; 

	aPat = [self sourcePattern];
	rH = [ [aPat controller] rightHand];
	[rH trajectoryMovement:self atTime:t];
}

-(void)setSourcePattern:(id)aPat;
{
	SSPattern *tPat;
	tPat = (SSPattern *)aPat; 
	sourcePattern = tPat;
}
-(id)sourcePattern;
{
	return (id)sourcePattern;
}

//place les mains, 
-(void)preprocess;
{
	float tTime =2;
	SSPattern *aPat;
	Hand *throwHand, *catchHand;
	//aPat = [self sourcePattern];
	Controller *theController = [sourcePattern controller];
	//place les mains pr calcul speed
	throwHand = [theController handForSite:thrSite];
	[throwHand placeAtPos:thrPos];	
	catchHand = [theController handForSite:catSite];
	[catchHand placeAtPos:catPos];
	//assigne objThrowed
	//TODO: prb de main => tjrs la meme
	[[theController ballNumber:0] setX:[throwHand getPosX]];
	[[theController ballNumber:0] setY:[throwHand getPosY]];
	[throwHand setObjThrowed:[theController ballNumber:0]];
	[throwHand setThrowSpeed:catchHand inSeconds: tTime]; //temps total de la trajectoire
}

-(bool)isInHand;
{
	return ([[self valueForKey:@"ssTimeThrowed"] intValue] == 0);
}

/*
-(bool)mustBeThrowed:(int)aSsTime;
{
	if( [self isInHand] ){
	}
}
 */

-(bool)isInAirAtSsTime:(int)aSsTime;
{
	int thisThrowTime;
	thisThrowTime = [[self valueForKey:@"thrTime"] intValue];
	if( (thisThrowTime >= aSsTime) 
		&& ( aSsTime < (thisThrowTime + [[self valueForKey:@"ssTimeThrowed"] intValue]))){
			return YES;
	}
	else
		return NO;
}

/*
-(void)throwIfNecessary:(int)aSsTime;
{
	if([[self valueForKey:@"thrTime"] intValue] == [[self sourcePattern] relativeSsTimeForSsTime:aSsTime])
	   {
		   [self setValue:[NSNumber numberWithInt:aSsTime] forKey:<#(NSString *)key#>]
}
*/
- (NSString *)description;
{
	NSString *desc = [[NSString alloc] initWithFormat:@"thrPos",thrPos];
	return desc;
}

-(id)throwHand;
{
	if ([sourcePattern controller]){
		return [[sourcePattern controller] handForSite:[self valueForKey:@"thrSite"]];
	}
	else{
		return nil;
	}
}

-(id)catchHand;
{
	if ([sourcePattern controller]){
		return [[sourcePattern controller] handForSite:[self valueForKey:@"catSite"]];
	}
	else{
		return nil;
	}
}

-(void)setThrTime:(NSString *)t;
{ thrTime = t; }

-(NSString *)thrTime
{ return thrTime; }

-(void)setSsBase:(NSString *)base;
{ ssBase = base; }
-(NSString *)ssBase;
{ return ssBase; }

-(void)setThrSite:(NSString *)site;
{ thrSite = site; }
-(NSString *)thrSite;
{ return thrSite; }

-(void)setThrPos:(NSString *)pos;
{ thrPos = pos; }
-(NSString *)thrPos;
{ return thrPos; }

-(void)setCatPos:(NSString *)pos;
{ catPos = pos; }
-(NSString *)catPos;
{ return catPos; }

-(void)setCatSite:(NSString *)site;
{ catSite = site; }
-(NSString *)catSite;
{ return catSite; }

-(void)setAirMin:(NSNumber *)air;
{ airMin = air; }
-(NSNumber *)airMin;
{ return airMin; }

-(void)setSsTimeThrowed:(NSNumber *)aSsTime;
{ ssTimeThrowed = aSsTime; }
-(NSNumber *)ssTimeThrowed;
{ return ssTimeThrowed; }
@end
