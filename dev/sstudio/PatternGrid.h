//
//  Test.h
//  juggle
//
//  Created by clem on 22/02/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SSPattern.h"


@interface PatternGrid : NSTableView {
	NSMutableArray *pattern;
	//NSMutableArray *move;
	SSPattern *patJuggler;
}

-(id)initWithPattern:(SSPattern *)pat;
-(void)loadPattern:(SSPattern *)pat;
-(void)addColumn;
-(void)defineTable;

@end
