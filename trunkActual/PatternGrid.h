//
//  Test.h
//  juggle
//
//  Created by clem on 22/02/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PatternGrid : NSTableView {
	NSMutableArray *pattern;
	NSMutableArray *move;
}

- (void) addColumn;
- (void)defineTable;

@end
