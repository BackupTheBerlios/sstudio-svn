//
//  SSPosition.h
//  juggle
//
//  Created by clem on 22/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SSPosition.h"


@interface SSPosition : NSObject {
	float x;
	float y;
}

- (float) getX;
- (void) setX: (float) newValue;
- (float) getY;
- (void) setY: (float) newValue;
- (id)initX:(float)posX Y:(float)posY;
- (SSPosition*)placeAtPos:(NSString*)tMark;

@end
