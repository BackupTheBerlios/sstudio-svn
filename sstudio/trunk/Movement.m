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

/*
-(void)juggleItAtTime:(float)t;
{
	//positionner les mains
	Hand *aHand; 
	aHand = [self throwHand];	
	[aHand trajectoryMovement:self atTime:t];
}
 */

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

-(bool)isInHand;
{
	return ([[self valueForKey:@"ssTimeThrowed"] intValue] == 0);
}

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

-(id)controller;
{
	return [sourcePattern controller];
}

-(id)airTimeInSeconds;
{
	float t;
	t = ([[self valueForKey:@"ssBase"] floatValue])*([[self controller] beatTime]);
	return [NSNumber numberWithFloat:t];
}

-(void)setThrTime:(NSString *)t;
{
	[thrTime autorelease];
	thrTime = [t retain];
}

-(NSString *)thrTime
{ 
	return thrTime;
}

-(void)setSsBase:(NSString *)base;
{ 
	[ssBase autorelease];
	ssBase = [base retain];
}
-(NSString *)ssBase;
{
	return ssBase; 
}

-(void)setThrSite:(NSString *)site;
{
	[thrSite autorelease];
	thrSite = [site retain];
}
-(NSString *)thrSite;
{
	return thrSite; 
	
}

-(void)setThrPos:(NSString *)pos;
{
	[thrPos autorelease];
	thrPos = [pos retain]; 
}
-(NSString *)thrPos;
{ return thrPos; }

-(void)setCatPos:(NSString *)pos;
{
	[catPos autorelease];
	catPos = [pos retain]; 
}
-(NSString *)catPos;
{ return catPos; }

-(void)setCatSite:(NSString *)site;
{ 
	[catSite autorelease];
	catSite = [site retain];
}
-(NSString *)catSite;
{ return catSite; }

-(void)setAirMin:(NSNumber *)air;
{ 
	[airMin autorelease];
	airMin = [air retain]; 
}
-(NSNumber *)airMin;
{ return airMin; }


- (Throwable *) ballThrowed {
  return ballThrowed;
}

- (void) setBallThrowed: (Throwable *) newValue {
  [ballThrowed autorelease];
  ballThrowed = [newValue retain];
}

-(void) valueForUndefinedKey:(NSString *)tKey;
{
	NSLog(@"valueForUndefinedKey");
}

@end
