//
//  Pattern.h
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

/*
Siteswap: element unitaire
Pattern: ensemble de siteswap
 */

#import <Cocoa/Cocoa.h>
#import "Movement.h"


@interface SiteswapPattern : NSObject {
	NSString *identifier;
	NSMutableArray *listSiteswap;
	
	NSMutableArray *arrMovements; 
}

- (void)addSiteswap:(Movement *)siteswap;
- (id)listSiteswap;

-(void)addMovement:(Movement *)move;

@end
