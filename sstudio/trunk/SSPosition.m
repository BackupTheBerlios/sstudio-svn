//
//  SSPosition.m
//  juggle
//
//  Created by clem on 22/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SSPosition.h"


@implementation SSPosition

-(id)init
{
	[super init];
	return self;
}

-(id)initX:(float)posX Y:(float)posY
{
	[self init];
	[self setX:posX];
	[self setY:posY];
	return self;
}

//positionne la main a la position representée par la lettre
- (SSPosition*)placeAtPos:(NSString*)tMark
{
	if ([tMark isEqualToString:@"m"])
	{
		[self setX:0.0f];
		[self setY:0.0f];
	}
	if ([tMark isEqualToString:@"r"])
	{
		[self setX:0.5f];
		[self setY:0.0f];
	}
	if ([tMark isEqualToString:@"l"])
	{
		[self setX:-0.5f];
		[self setY:0.0f];
	}
	return self;
}

- (float) getX {
  return x;
}

- (void) setX: (float) newValue {
  x = newValue;
}


- (float) getY {
  return y;
}

- (void) setY: (float) newValue {
  y = newValue;
}

@end
