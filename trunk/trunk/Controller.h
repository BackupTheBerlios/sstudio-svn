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


@interface Controller : NSObject {
	SiteswapPattern *pat;
}
- (IBAction)initialize:(id)sender;

@end
