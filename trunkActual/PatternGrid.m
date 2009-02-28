//
//  Test.m
//  juggle
//
//  Created by clem on 22/02/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PatternGrid.h"


@implementation PatternGrid

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		
    }
    return self;
}

-(void)awakeFromNib
{
	/*
	col = [[NSTableColumn alloc] initWithIdentifier:@"col1"];
	headerCell = [[NSCell alloc] initTextCell:@"col 1"];
	[headerCell setType:NSTextCellType];
	[col setHeaderCell:headerCell];
	[self addTableColumn:col];
	[self reloadData];
	 */
	[self defineTable];
}

- (void)defineTable
{	
	move= [[NSMutableArray alloc] initWithCapacity:2];	
	[move addObject:@"R"];
	[move addObject:@"L"];	
}

-(void)addColumn
{
	NSTableColumn *col;
	col = [[NSTableColumn alloc] initWithIdentifier:@"col2"];
	//creation et configuration de la header cell
	NSCell *headerCell;
	headerCell = [[NSCell alloc] initTextCell:@"col 2"];
	[headerCell setType:NSTextCellType];
	[col setHeaderCell:headerCell];
	[self addTableColumn:col];
	[self reloadData];
}

- (int)numberOfRowsInTableView:(PatternGrid *)tableView
{
    return [move count];
}

- (id)tableView:(PatternGrid *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
			row:(int)row
{
	if ( [tableColumn identifier] == @"col1")
	{
		return [move objectAtIndex: row ];
	}
	else
	{
		return @"col2";
	}
}

@end
