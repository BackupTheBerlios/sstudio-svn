//
//  testSiteswap.m
//  juggle
//
//  Created by clem on 01/02/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "testSiteswap.h"
#import "Controller.h"
#import "Hand.h"

@implementation testSiteswap

// --== PATTERN ==--

-(void)testIsThrowAtTime;
{
	SSPattern *aPattern;
	aPattern = [[SSPattern alloc] init];
	[aPattern define3bCascadePattern];
	
	//relative SsTime
	STAssertEquals([aPattern relativeSsTimeForSsTime:0],0,@"Erreur");
	STAssertEquals([aPattern relativeSsTimeForSsTime:1],1,@"Erreur");
	STAssertEquals([aPattern relativeSsTimeForSsTime:2],2,@"Erreur");
	STAssertEquals([aPattern relativeSsTimeForSsTime:3],1,@"Erreur");
	STAssertEquals([aPattern relativeSsTimeForSsTime:4],2,@"Erreur");
	
	//getMovements
	STAssertNil([aPattern getMovementThrowedAtSsTime:0], @"Erreur");
	STAssertNotNil([aPattern getMovementThrowedAtSsTime:1], @"Erreur");
	STAssertNotNil([aPattern getMovementThrowedAtSsTime:2], @"Erreur");
}


-(void)testPattern
{
	SSPattern *aPattern;
	aPattern = [[SSPattern alloc] init];
	[aPattern define3bCascadePattern];
	STAssertEquals([aPattern ballNumberNeeded], 3, @"Erreur");
	
	
}

// --== HANDS ==--
-(void)isHandsExisting
{
	Controller *aCtrl;
	Hand *aHand;
	aCtrl = [[Controller alloc] init];
	[aCtrl initHands]; 
	aHand = [aCtrl handForSite:@"R"];
	STAssertNotNil(aHand, @"Right Hand not found");
	aHand = [aCtrl handForSite:@"L"];	
	STAssertNotNil(aHand, @"Left Hand not found");
}

-(void)testHeldBalls;
{
	Controller *aCtrl;
	Hand *rightHand, *leftHand;
	Throwable *aBall;
	Throwable *gettedBall;
	aCtrl = [[Controller alloc] init];
	[aCtrl initialize:nil];
	//recup la main
	rightHand = [aCtrl handForSite:@"R"];
	leftHand = [aCtrl handForSite:@"L"];
	STAssertNotNil(rightHand, @"Hand not found");

	//init une balle
	aBall = [[Throwable alloc] init]; 
	//[aHand getBall]; //une balle est deja dans la main droite
	STAssertEquals((int)[[rightHand heldBalls] count], 1, @"heldBalls must be empty");	
	STAssertEquals((int)[[leftHand heldBalls] count], 2, @"heldBalls must contains 2 ball");
}

@end
