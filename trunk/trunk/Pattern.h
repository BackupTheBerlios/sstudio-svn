//
//  Pattern.h
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Siteswap.h"


@interface SiteswapPattern : NSObject {
	NSString *identifier;
	NSMutableArray *listSiteswap;
}

- (id)addSiteswap:(Siteswap *)siteswap;
- (id)listSiteswap;

@end
