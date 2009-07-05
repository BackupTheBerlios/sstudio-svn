//
//  Juggler.h
//  juggle
//
//  Created by clem on 20/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SSPattern;
@class Movement;
@class Hand;
@class Throwable;
@class SSView;

@interface Juggler : NSObject {
	SSPattern *aPattern;
	NSArray *hands;
	NSMutableArray *balls;
	SSView *aSSView;
	
	//timer
	NSTimer *timer;
	float realTime;
	int ssAbsTime;
	bool throwedAtCurrentSsTime;
}

-(id)initWithPattern:(id)tPattern;

//hands
-(Hand *)rightHand;
-(Hand *)leftHand;
-(Hand *)handForSite:(NSString *)tSite;
-(void)logHands;
-(NSArray *)hands;

//balls
-(id)balls;
-(Throwable *)ballNumber:(int)num;
-(void)logBalls;

//juggler
-(void)initBalls;
-(void)initHands;
-(void)startSimulation;
-(void)processRealTime;
-(void)processSiteswapTime;
-(void)simAStep;

//constantes
-(float)sampleTime;
-(float)beatTime;
-(float)realTime;
-(int)ssAbsTime;

- (SSPattern *) aPattern;
- (void) setAPattern: (SSPattern *) newValue;
- (SSView *) aSSView;
- (void) setASSView: (SSView *) newValue;
- (int) throwedAtCurrentSsTime;
- (void) setThrowedAtCurrentSsTime: (int) newValue;
@end
