//
//  ControllerUnitTest.h
//  juggle
//
//  Created by clem on 20/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@class SSView;
@class Juggler;

@interface ControllerUnitTest : NSWindowController {
	IBOutlet SSView *aTestView;
	IBOutlet NSTableView *aBallDebug;
	IBOutlet NSButton *btLaunchTest;
	Juggler *testJuggler;
}

-(IBAction)launchTest:(id)sender;
-(void)testBasicThrow;

@end
