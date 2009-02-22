//
//  Siteswap.h
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

/*
 Steswap: element unitaire
 Pattern: ensemble de siteswap
  => definir un move?
 
 */

#import <Cocoa/Cocoa.h>


@interface Movement : NSObject {
	NSNumber *time;
	NSNumber *siteswap;
	NSString *throwSite;
	
	NSNumber *thrTime;
	NSString *ssBase;
	NSString *thrSite;
	NSString *thrPos;
	NSString *catPos;
	NSString *catSite;
	NSNumber *airMin;
}

-(id)initSiteswap:(NSString *)ss time:(NSString *)t throwSite:(NSString *)site;
-(void)setThrTime:(float)t;
-(void)setSsBase:(NSString *)s;

@end
