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

- (id)throw:(Throwable *)obj to:(Hand *)hDest
{
	float time = 0.0;
	float newY, newX;
	objThrowed = obj;
	//if (objThrowed = nil) return nil;
	Position *temp;	
	NSLog(@"throw");

	NSLog(@"throw position x:%d y:%d", x, y);
	NSLog(@"catch position x:%d y:%d", [hDest getPosX], [hDest getPosY]);
	[self setThrowSpeed:hDest inSeconds:5.0];
	
	//a mettre dans Throwable
	for ( time=0.0; time <= 5; time += 0.05)
	{
		newY = ([objThrowed getSpeedY]*time) - (0.5*9.81*time*time)+[self getPosY];
		newX = [objThrowed getSpeedX]*time;
		temp = [[Position alloc] initTime:time posX:newX posY:newY];
		[[objThrowed trajectory] addObject: temp];		
	}
	return self;	
}

- (id)setThrowSpeed:(Hand *)hDest inSeconds:(float)t
{
	float speedx = [self speedToGoToX:[hDest getPosX] inSeconds:t];
	NSLog(@"speedx: %f", speedx);
	float speedy = [self speedToGoToY:[hDest getPosY] inSeconds:t];
	NSLog(@"speedy: %f", speedy);
	[objThrowed setSpeedX:speedx y:speedy ];
	return self;
}

- (float)speedToGoToX:(float)posX inSeconds:(float)t
{
	return (posX/t-0.5*9.81*t- [objThrowed posX]/t);
}

- (float)speedToGoToY:(float)posY inSeconds:(float)t
{
	return (posY/t+(0.5*9.81*t)- ([objThrowed posY]/t));
}

- (id)setPositionX:(float)posX y:(float)posY
{
	x= posX;
	y= posY;
	return self;
}

@end
