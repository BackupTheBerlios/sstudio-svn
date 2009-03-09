//
//  Siteswap.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Movement.h"


@implementation Movement

-(id)initSiteswap:(NSString *)ss time:(NSString *)t throwSite:(NSString *)site;
{
	NSLog(@"dbt init %@ %@ %@", ss, t, site);
	if (![super init])
		return nil;
	siteswap = [[NSNumber alloc] initWithInt:[ss intValue]];
	time = [[NSNumber alloc] initWithInt:[t intValue]];
	throwSite =[[NSString alloc] initWithString: site];
	
	//NSLog(@"init: %d", [siteswap intValue]);
	[self setValue:@"3" forKey:@"thrTime"];
	return self;
}

-(id)init
{
	[super init];
	return self;
}

- (NSString *)description;
{
	NSString *desc = [[NSString alloc] initWithFormat:@"thrPos",thrPos];
	return desc;
}

-(void)setThrTime:(float)t;
{
	thrTime = [[NSNumber alloc] initWithFloat:t];
}

-(NSString *)thrTime
{
	return thrTime;	
}

-(void)setSsBase:(NSString *)base;
{
	ssBase = base;
}

-(NSString *)ssBase;
{
	return ssBase;	
}

-(void)setThrSite:(NSString *)site;
{
	thrSite = site;
}

-(NSString *)thrSite;
{
	return thrSite;	
}

-(void)setThrPos:(NSString *)pos;
{
	NSLog(@"setThrPos called");
	thrPos = pos;
}

-(NSString *)thrPos;
{
	return thrPos;
}

-(void)setCatPos:(NSString *)pos;
{
	catPos = pos;
}

-(NSString *)catPos;
{
	return catPos;	
}

-(void)setCatSite:(NSString *)site;
{
	catSite = site;
}

-(NSString *)catSite;
{
	return catSite;	
}

-(void)setAirMin:(NSNumber *)air;
{
	airMin = air;
}

-(NSNumber *)airMin;
{
	return airMin;	
}



-(Movement*)initMovement;
{
	Movement *move;
	move = [[Movement alloc] init];
	[move setSsBase:@"3"];
	[move setThrTime:1.5];
	return move;
}
@end
