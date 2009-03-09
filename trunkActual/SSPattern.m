//
//  Pattern.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "SSPattern.h"


@implementation SSPattern
- (id)init;
{
	[super init];
	arrMovements = [[NSMutableArray alloc] initWithCapacity:0];
	return self;
}

/*
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
 */

-(id)defineTestPattern;
{
	Movement *move;
	move = [[Movement alloc] init];
	[move setValue:[NSNumber numberWithInt:1] forKey:@"thrTime"];
	//[move setValue:@" " forKey:@" "];
	[move setValue:@"3" forKey:@"ssBase"];
	[move setValue:@"R" forKey:@"thrSite"];
	[move setValue:@"R" forKey:@"thrPos"];
	[move setValue:@"L" forKey:@"catSite"];
	[move setValue:@"L" forKey:@"catPos"];
	[self addMovement:move];
	return self;
}

-(void)addMovement:(Movement *)move;
{
	[arrMovements addObject:move];
}

-(id)arrMovements
{
	return arrMovements;	
}
@end
