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
	IBOutlet NSButton *btTest;	
	//Juggler *myself;
	SSPattern *aPattern;
	
	//timer
	NSTimer *timer;
	NSNumber *countTime;
}

-(IBAction)initialize:(id)sender;
-(IBAction)juggleButtonClick:(id)sender;
//-(id)definePattern;
//-(void)juggle;
-(void)startSimulation;

@end
