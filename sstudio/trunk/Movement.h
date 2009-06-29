//
//  Siteswap.h
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

/*
 Movement: element unitaire
 SSPattern: ensemble de Movement
 */

#import <Cocoa/Cocoa.h>

@class Throwable;
@class SSPattern;

@interface Movement : NSObject {
	SSPattern *sourcePattern;
	NSString *thrTime;
	NSString *ssBase;
	NSString *thrSite;
	NSString *thrPos;
	NSString *catPos;
	NSString *catSite;
	NSNumber *airMin;
	Throwable *ballThrowed;
}


-(id)init;
-(id)initMovement;
-(bool)isInAirAtSsTime:(int)aSsTime;
-(id)throwHand;
-(id)catchHand;
-(id)controller;
-(id)airTimeInSeconds;


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
-(void)setSsTimeThrowed:(NSNumber *)aSsTime;
-(NSNumber *)ssTimeThrowed;
-(void)setSourcePattern:(id)aPat;
-(id)sourcePattern;
- (Throwable *) ballThrowed;
- (void) setBallThrowed: (Throwable *) newValue;
@end
