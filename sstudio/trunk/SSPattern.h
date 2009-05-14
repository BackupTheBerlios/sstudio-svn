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
#import "Hand.h"


@interface SSPattern : NSObject {
	NSString *identifier;
	NSMutableArray *movements;
	NSArray *hands;
	NSArray *balls;
}

-(NSString *)description;
-(id)defineTestPattern;
-(void)addMovement:(Movement *)move;
-(id)movements;
-(int)ballNumberNeeded;
//hand
-(Hand *)rightHand;
-(Hand *)leftHand;
-(Hand *)handForSite:(NSString *)tSite;
//bal
-(Throwable *)ballNumber:(int)num;
-(void)preprocess;


@end
