//
//  Hand.m
//  juggle
//
//  Created by clem on 01/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Hand.h"


@implementation Hand

- (id)init
{
	[super init];
	x = 0;
	y = 0;
	return self;
}

- (float)getPosX
{
	return x;
}

- (id)setPosX:(float)posX
{
	x = posX;
	return self;
}

- (id)setPosY:(float)posY
{
	y = posY;
	return self;
}

- (float)getPosY
{
	return y;
}

- (id)throw:(Throwable *)obj 
{
	float time = 0.0;
	float newY, newX;
	
	Position *temp;	
	NSLog(@"throw");
	float speedx = [self speedToGoToX:1.0 inSeconds:3.0];
	NSLog(@"speedx: %f", speedx);
	float speedy = [self speedToGoToY:1.0 inSeconds:3.0];
	NSLog(@"speedy: %f", speedy);
	[obj setSpeedX:speedx y:speedy ];
	NSLog(@"HAND position x:%d y:%d", x, y);
	
	for ( time=0.0; time < 3; time += 0.1)
	{
		newY = ([obj getSpeedY]*time) - (0.5*9.81*time*time)+ [self getPosY];
		newX = [obj getSpeedX]*time;
		temp = [[Position alloc] initTime:time posX:newX posY:newY];
		[[obj trajectory] addObject: temp];		
	}
	return self;
}

- (id)throw:(Throwable *)obj to:(Hand *)hDest
{
	float time = 0.0;
	float newY, newX;
	
	Position *temp;	
	NSLog(@"throw");
	float speedx = [self speedToGoToX:[hDest getPosX] inSeconds:3.0];
	NSLog(@"speedx: %f", speedx);
	float speedy = [self speedToGoToY:[hDest getPosY] inSeconds:3.0];
	NSLog(@"speedy: %f", speedy);
	[obj setSpeedX:speedx y:speedy ];
	NSLog(@"HAND position x:%d y:%d", x, y);
	
	for ( time=0.0; time < 3; time += 0.1)
	{
		newY = ([obj getSpeedY]*time) - (0.5*9.81*time*time)+[self getPosY];
		newX = [obj getSpeedX]*time;
		temp = [[Position alloc] initTime:time posX:newX posY:newY];
		[[obj trajectory] addObject: temp];		
	}
	return self;	
}

- (float)speedToGoToX:(float)posX inSeconds:(float)t
{
	return (posX/t+0.5*9.81*t);
}

- (float)speedToGoToY:(float)posY inSeconds:(float)t
{
	return (posY/t+(0.5*9.81*t));
}

- (id)setPositionX:(float)posX y:(float)posY
{
	x= posX;
	y= posY;
	return self;
}

@end
