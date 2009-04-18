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
#import "SSPattern.h"
#import "Hand.h"
#import "Throwable.h"
#import "PatternGrid.h"
#import "View.h"
#import "SSView.h"


@interface Controller : NSObject {
	//animation
	IBOutlet View *show;
	IBOutlet SSView *oglShow;
	IBOutlet NSButton *btJuggle;
	IBOutlet NSButton *btTest;	
	Juggler *myself;

	//grile
	//IBOutlet PatternGrid *patGrid;
	//IBOutlet NSButton *btAdd;
	//IBOutlet NSButton *btRemove;
}

-(IBAction)initialize:(id)sender;
-(IBAction)juggleButtonClick:(id)sender;
-(id)definePattern;
-(void)juggle;
//-(IBAction)addNewMove:(id)sender;

@end
