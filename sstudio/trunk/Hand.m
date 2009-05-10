//
//  Hand.m
//  juggle
//
//  Created by clem on 01/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "Hand.h"
#import "Movement.h"

@implementation Hand

- (id)init
{
	[super init];
	//x = [NSNumber alloc];
	//[x initWithFloat:1.0];
	x = [NSNumber numberWithFloat:2.0];
	y = [NSNumber numberWithFloat:2.0];
	return self;
}

- (float)getPosX
{
	return [x floatValue];
}

- (id)setPosX:(float)posX
{
	x =[NSNumber numberWithFloat: posX];
	return self;
}

- (id)setPosY:(float)posY
{
	y = [NSNumber numberWithFloat: posY];
	return self;
}

- (float)getPosY
{
	return [y floatValue];
}

-(void)prepareThrowSiteForMove:(Movement *)move;
{
	if ( [[move valueForKey:@"thrSite"] isEqual: @"R"])
	{
		[self setPositionX:0.5f positionY:0.0f];
	}
	if ( [[move valueForKey:@"thrSite"]  isEqual: @"L"])
	{
		[self setPositionX: -0.5f positionY:0.0f];
	}
}

//TODO: a renommer
//calcule les trajectoires pour une plage donnée
//=> calculer pr un temps donné
- (id)throw:(Throwable *)obj to:(Hand *)hDest
{
	float time = 0.0;
	float newY, newX;
	objThrowed = obj;
	//if (objThrowed = nil) return nil;
	Position *temp;	
	NSLog(@"throw");
	NSLog(@"throw position x:%f y:%f", [self getPosX], [self getPosY]);
	NSLog(@"catch position x:%f y:%f", [hDest getPosX], [hDest getPosY]);
	[self setThrowSpeed:hDest inSeconds:1.0];
	
	//a mettre dans Throwable
	for ( time=0.0; time <= 1; time += 0.05)
	{
		newY = ([objThrowed getSpeedY]*time) - (0.5*9.81*time*time)+[self getPosY];
		newX = [objThrowed getSpeedX]*time;
		NSLog(@"throw: x=%f ; y=%f", newX, newY);
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

//equation du mouvement sur X
- (float)speedToGoToX:(float)posX inSeconds:(float)t
{
	return (posX/t- [objThrowed posX]/t);
}

//equation du mouvement sur Y
- (float)speedToGoToY:(float)posY inSeconds:(float)t
{
	return (posY/t+(0.5*9.81*t)- ([objThrowed posY]/t));
}

//
-(id)setPositionX:(float)posX positionY:(float)posY
{
	x = [NSNumber numberWithFloat: posX];
	y = [NSNumber numberWithFloat: posY];
	return self;
}

//positionne la main a la position representée par la lettre
- (id)placeAtPos:(NSString*)tMark
{
	if ([tMark isEqualToString:@"m"])
	{
		[self setPositionX:0.0f positionY:0.0f];
	}
	if ([tMark isEqualToString:@"r"])
	{
		[self setPositionX:0.5f positionY:0.0f];
	}
	if ([tMark isEqualToString:@"l"])
	{
		[self setPositionX:-0.5f positionY:0.0f];
	}
	return self;
}
@end
