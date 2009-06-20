//
//  ControllerUnitTest.h
//  juggle
//
//  Created by clem on 20/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SSView;

@interface ControllerUnitTest : NSWindowController {
	IBOutlet SSView *aTestView;
	IBOutlet NSButton *btLaunchTest;
}

-(IBAction)launchTest:(id)sender;

@end
