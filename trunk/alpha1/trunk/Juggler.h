//
//  Juggler.h
//  juggle
//
//  Created by clem on 03/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Hand.h"

@interface Juggler : NSObject {
	float beatTime;
	Throwable *ball;
	Hand *hRight;
	Hand *hLeft;
}


-(Hand *)rightHand;
-(Hand *)leftHand;
-(float)beatTime;
-(id)setBeatTime:(float)t;
-(id)ballNumber:(int)num;

@end
