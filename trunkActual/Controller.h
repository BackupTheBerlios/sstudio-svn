//
//  Controller.h
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Juggler.h"
#import "Movement.h"
#import "SiteswapPattern.h"
#import "Hand.h"
#import "Throwable.h"
#import "PatternGrid.h"
#import "View.h"


@interface Controller : NSObject {
	IBOutlet View *show;
	IBOutlet Juggler *myself;
	SiteswapPattern *pat;
	IBOutlet NSButton *btJuggle;
	
	//test
	IBOutlet NSButton *btTest;
	IBOutlet PatternGrid *patGrid;
	SiteswapPattern *patMove;
}

-(IBAction)initialize:(id)sender;
-(IBAction)juggleButtonClick:(id)sender;
-(id)definePattern;
-(void)juggle;

@end
