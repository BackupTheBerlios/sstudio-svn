//
//  Point.h
//  juggle
//
//  Created by clem on 01/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Position : NSObject {
	float time;
	float x;
	float y;
}

- (id)initTime:(float) tVal posX:(float) xVal posY:(float) yVal;
-(float)y;
-(float)x;
@end
