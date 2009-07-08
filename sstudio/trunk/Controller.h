//
//  Controller.h
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Juggler.h"
#import "Hand.h"
#import "Throwable.h"
#import "SSPattern.h"
#import "Movement.h"
#import "SSView.h"
#import "ControllerUnitTest.h"
#import "SSPosition.h"

@interface Controller : NSObject {
	//animation
	IBOutlet SSView *oglShow;
	IBOutlet NSButton *btJuggle;
	IBOutlet NSPopUpButton *btSelectPattern;
	IBOutlet NSArrayController *patternArrayCtrl;
	IBOutlet NSTableView *patternTableView;
	ControllerUnitTest *aCtrlUnitTest;
	Juggler *aJuggler;
}

-(IBAction)juggleButtonClick:(id)sender;
-(IBAction)showTestView:(id)sender;





@end
