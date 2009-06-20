//
//  ControllerUnitTest.m
//  juggle
//
//  Created by clem on 20/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ControllerUnitTest.h"


@implementation ControllerUnitTest

-(id)init
{
	if (![super initWithWindowNibName:@"SSUnitTest"])
		return nil;
	
	return self;
}

-(IBAction)launchTest:(id)sender;
{
	NSLog(@"Test lancé");
}

@end
