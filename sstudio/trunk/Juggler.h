//
//  Juggler.h
//  juggle
//
//  Created by clem on 03/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Hand.h"
#import "SSPattern.h"

@interface Juggler : NSObject {
	float beatTime;
	Hand *hRight; 
	Hand *hLeft;
	Throwable *ball; //liste des balles
	SSPattern *patt;
}

-(Hand *)rightHand;
-(Hand *)leftHand;
-(SSPattern *)patt;
-(float)beatTime;
-(void)setBeatTime:(float)t;
//-(void)setPattern:(SSPattern *)tPat;
-(id)ballNumber:(int)num;
-(void)juggleMove:(Movement *)tMove;
-(void)jugglePattern:(SSPattern *)tPat;
//-(void)prepareHandForMove:(Movement *)move;

@end
