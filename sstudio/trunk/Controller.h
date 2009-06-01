//
//  Controller.h
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SSPattern.h"
#import "SSView.h"

@interface Controller : NSObject {
	//animation
	IBOutlet SSView *oglShow;
	IBOutlet NSButton *btJuggle;
	SSPattern *aPattern;
	NSArray *hands;
	NSMutableArray *balls;
	
	//timer
	NSTimer *timer;
	float realTime;
	int ssAbsTime;
}

//interface
-(IBAction)initialize:(id)sender;
-(IBAction)juggleButtonClick:(id)sender;

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
@end
