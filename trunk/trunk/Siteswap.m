//
//  Siteswap.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Siteswap.h"


@implementation Siteswap

-(id)initSiteswap:(NSString *)ss time:(NSString *)t throwSite:(NSString *)site;
{
	NSLog(@"dbt init %@ %@ %@", ss, t, site);
	if (![super init])
		return nil;
	siteswap = [[NSNumber alloc] initWithInt:[ss intValue]];
	time = [[NSNumber alloc] initWithInt:[t intValue]];
	throwSite =[[NSString alloc] initWithString: site];
	NSLog(@"init: %d", [siteswap intValue]);
}

- (NSString *)description;
{
	NSString *desc = [[NSString alloc] initWithFormat:@"T:%@ SS: %@ TH:%@",time, siteswap, throwSite];
	return desc;
}
@end
