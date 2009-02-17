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
	myself = [[Juggler alloc]init];
	NSLog(@"init");
	pat = [SiteswapPattern alloc];
	[pat init];
	[self definePattern];
}

-(id)definePattern
{
	Movement *ss;	ss = [Movement alloc];
	[ss initSiteswap:@"3" time:@"2" throwSite:@"l"];
	[pat addSiteswap:ss];	
	ss = [Movement alloc];
	[ss initSiteswap:@"3" time:@"1" throwSite:@"r"];
	[pat addSiteswap:ss];
	NSLog(@"ss%@", ss );
	NSLog(@"Pat: %@", [pat listSiteswap]);
	return self;
}

-(IBAction)juggleButtonClick:(id)sender
{
	double val;
	NSLog(@"juggle started");	
	[self juggle];
	NSLog(@"btTest %@",[ btTest stringValue]);
	val = [slide doubleValue];
	NSLog(@"%@", [NSString stringWithFormat:@"%f", val ]);
	[show mainLayer];
	[show animateTrajectory:[myself ballNumber:1]];
}

-(void)juggle
{
	NSLog(@"Pat: %@", [pat listSiteswap]);	
	NSLog(@"myself:%@", myself);
	[[myself leftHand] setPositionX:0.0	positionY:0.0];
	[[myself rightHand] setPositionX:0.8	positionY:0.2];
	
	[[myself ballNumber:1] deleteTrajectory];
	[[myself leftHand] throw:[myself ballNumber:1] to:[myself rightHand]];
	NSLog(@"test %@",[[myself ballNumber:1] showTrajectory]);	
}

@end
