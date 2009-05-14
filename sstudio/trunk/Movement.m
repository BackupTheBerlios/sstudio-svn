//
//  Siteswap.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

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
	rH = [aPat rightHand];
	[rH trajectoryMovement:self atTime:t];
}

-(void)setSourcePattern:(id)aPat;
{
	SSPattern *tPat;
	tPat = (SSPattern *)aPat;
	//[tPat retain]; 
	sourcePattern = tPat;
}
-(id)sourcePattern;
{
	return (id)sourcePattern;
}

-(void)preprocess;
{
	float tTime =2;
	SSPattern *aPat;
	Hand *throwHand, *catchHand;
	aPat = [self sourcePattern];
	//on recup les mains
	/* old
	rH = [aPat rightHand];	
	lH = [aPat leftHand];	
	 */
	throwHand = [sourcePattern handForSite:thrSite];
	[throwHand placeAtPos:thrPos];	
	catchHand = [sourcePattern handForSite:catSite];
	[catchHand placeAtPos:catPos];
	//assigne objThrowed
	/*old
	[rH setPositionX:10.0f positionY:1.2f];
	[lH setPositionX:0.0f positionY:1.2f];		
	 */

	[[aPat ballNumber:0] setX:[throwHand getPosX]];
	[[aPat ballNumber:0] setY:[throwHand getPosY]];
	[throwHand setObjThrowed:[aPat ballNumber:0]];
	[throwHand setThrowSpeed:catchHand inSeconds: tTime]; //temps total de la trajectoire
}

- (NSString *)description;
{
	NSString *desc = [[NSString alloc] initWithFormat:@"thrPos",thrPos];
	return desc;
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

@end
