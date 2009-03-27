//
//  Point.m
//  juggle
//
//  Created by clem on 01/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Point.h"


@implementation Position
- (id)initTime:(float) tVal posX:(float) xVal posY:(float) yVal;
{
	[super init];
	time =tVal;
	x= xVal;
	y = yVal;
	return self;
}

- (NSString *)description
{
	return [[NSString alloc] initWithFormat:@"%f;%f ", x, y];
}
@end
