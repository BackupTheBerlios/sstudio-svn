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
	id *moveOwner;
	NSString *thrTime;
	NSString *ssBase;
	NSString *thrSite;
	NSString *thrPos;
	NSString *catPos;
	NSString *catSite;
	NSNumber *airMin;
}


-(id)init;
-(id)initMovement;
-(void)juggleIt;
-(void)setMoveOwner:(id)aPat;
-(id)moveOwner;

/* Getter - Setter */
-(void)setThrTime:(NSString *)t;
-(NSString *)thrTime;
-(void)setSsBase:(NSString *)s;
-(NSString *)ssBase;
-(void)setThrSite:(NSString *)pos;
-(NSString *)thrSite;
-(void)setThrPos:(NSString *)pos;
-(NSString *)thrPos;
-(void)setCatPos:(NSString *)pos;
-(NSString *)catPos;
-(void)setCatSite:(NSString *)pos;
-(NSString *)catSite;
-(void)setAirMin:(NSNumber *)pos;
-(NSNumber *)airMin;

@end
