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
	Hand *hRight;
	Hand *hLeft;
}

-(id)rightHand;
-(id)leftHand;
-(float)beatTime;
-(id)setBeatTime:(float)t;

@end
