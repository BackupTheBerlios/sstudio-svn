//
//  Controller.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"


@implementation Controller
- (IBAction)initialize:(id)sender
{
	Siteswap *ss;
	Juggler *myself= [[Juggler alloc]init];
	Throwable *ball = [[Throwable alloc] init];
	
	NSLog(@"init");
	pat = [SiteswapPattern alloc];
	[pat init];
	
	ss = [Siteswap alloc];	
	[ss initSiteswap:@"3" time:@"1" throwSite:@"r"];
	[pat addSiteswap:ss];
	NSLog(@"ss%@", ss );
	NSLog(@"Pat: %@", [pat listSiteswap]);
	//ss = nil;
	ss = [Siteswap alloc];
	[ss initSiteswap:@"3" time:@"2" throwSite:@"l"];
	[pat addSiteswap:ss];
	NSLog(@"ss%@", ss );
	NSLog(@"Pat: %@", [pat listSiteswap]);
	
	NSLog(@"%@", ball);

	NSLog(@"myself:%@", myself);
	[[myself leftHand] setPosX:0.5];
	NSLog(@"%@",[myself rightHand]);
	[ball deleteTrajectory];

	[ [myself rightHand] throw:ball to: [myself leftHand]];
	NSLog(@"test %@",[ball showTrajectory]);
}

-(IBAction)juggle:(id)sender;
{
	NSLog(@"juggle started");
	
}

@end
