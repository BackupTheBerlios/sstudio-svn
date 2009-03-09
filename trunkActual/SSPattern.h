//
//  Pattern.h
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

/*
move: element unitaire
Pattern: ensemble de siteswap
 */

#import <Cocoa/Cocoa.h>
#import "Movement.h"


@interface SSPattern : NSObject {
	NSString *identifier;
	NSMutableArray *arrMovements; 
}

-(id)defineTestPattern;
-(void)addMovement:(Movement *)move;
-(id)arrMovements;


@end
