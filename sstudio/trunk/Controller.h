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
	IBOutlet NSButton *btStop;
	//IBOutlet NSButton *btAdd;
	IBOutlet NSArrayController *patternArrayCtrl;
	IBOutlet NSTableView *patternTableView;
	IBOutlet NSArrayController *ssPatterns;
	IBOutlet NSArrayController *movements;
	ControllerUnitTest *aCtrlUnitTest;
	Juggler *aJuggler;
}

-(IBAction)juggleButtonClick:(id)sender;
-(IBAction)stopButtonClick:(id)sender;
-(IBAction)showTestView:(id)sender;
-(id)getSelectedPattern;





@end
