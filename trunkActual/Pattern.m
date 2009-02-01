//
//  Pattern.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Pattern.h"


@implementation SiteswapPattern
- (id)init;
{
	[super init];
	listSiteswap = [[NSMutableArray alloc] init];
	return self;
}
- (NSString *)description;
{
	NSString *result;
	unsigned int i;
	//result = [[NSString alloc] initWithString:@"desc"];
	if ( listSiteswap != nil)
	{
	//NSLog(@"%@", [[listSiteswap count] intValue]);
		for (i=0; i < ([listSiteswap count]-1); i++)
		{
			NSLog(@"%d",i);
			NSLog(@"%d %@\n", i, [listSiteswap objectAtIndex:i]);
		}
	}
	return result;
}

- (id)listSiteswap;
{
	return listSiteswap;
}

- (void)addSiteswap:(Siteswap *)siteswap;
{
	[listSiteswap addObject:siteswap];
}
@end
