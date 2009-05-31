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

-(void)testInputSiteswap
{
	STAssertEquals(YES, YES, @"Erreur");
}

-(void)testPattern
{
	SSPattern *aPattern;
	aPattern = [[SSPattern alloc] init];
	[aPattern defineTestPattern];
	STAssertEquals([aPattern ballNumberNeeded], 3, @"Erreur");
}

-(void)testHands
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



@end
