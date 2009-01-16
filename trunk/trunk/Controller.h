//
//  Controller.h
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Juggler.h"
#import "Siteswap.h"
#import "Pattern.h"
#import "Hand.h"
#import "Throwable.h"
#import "View.h"

@interface Controller : NSObject {
	View *show;
	IBOutlet Juggler *myself;
	SiteswapPattern *pat;
	IBOutlet NSButton *btJuggle;
	
	//test
	IBOutlet NSSlider *slide;
	IBOutlet NSButton *btTest;
}

-(IBAction)initialize:(id)sender;
-(IBAction)juggleButtonClick:(id)sender;
-(id)definePattern;
-(void)juggle;

@end
