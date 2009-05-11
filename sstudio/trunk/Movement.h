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


@interface Movement : NSObject {
	id sourcePattern;
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
-(void)juggleItAtTime:(float)t;
-(void)setSourcePattern:(id)aPat;
-(id)sourcePattern;
-(void)preprocess;

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
