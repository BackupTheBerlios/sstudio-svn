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
	//[move setValue:@" " forKey:@" "];	
	//cascade 3B
	//1er mouvement
	move = [[Movement alloc] init];
	[move setValue:[NSNumber numberWithInt:1] forKey:@"thrTime"];
	[move setValue:@"3" forKey:@"ssBase"];
	[move setValue:@"R" forKey:@"thrSite"];
	[move setValue:@"m" forKey:@"thrPos"];
	[move setValue:@"L" forKey:@"catSite"];
	[move setValue:@"m" forKey:@"catPos"];
	[self addMovement:move];
	//2eme mouvement
	move = [[Movement alloc] init];
	[move setValue:[NSNumber numberWithInt:2] forKey:@"thrTime"];
	[move setValue:@"3" forKey:@"ssBase"];
	[move setValue:@"L" forKey:@"thrSite"];
	[move setValue:@"m" forKey:@"thrPos"];
	[move setValue:@"R" forKey:@"catSite"];
	[move setValue:@"m" forKey:@"catPos"];
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

//TODO: unit test
-(int)ballNumberNeeded;
{
	int sumSS=0;
	int i;
	for(i=0; i < [arrMovements count]; i++)
	{
		sumSS += [[[arrMovements objectAtIndex:i] valueForKey:@"ssBase"] intValue];
	}
	
	return (sumSS/i);
}
@end
