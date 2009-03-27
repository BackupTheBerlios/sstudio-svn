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

-(id)initWithPattern:(SSPattern *)pat
{
	patJuggler = pat;
	return self;
}

-(void)awakeFromNib
{
	NSTableColumn *co;
	NSCell *headerCell;	
	co = [[NSTableColumn alloc] initWithIdentifier:@"col1"];
	headerCell = [[NSCell alloc] initTextCell:@"col 1"];
	[headerCell setType:NSTextCellType];
	[co setHeaderCell:headerCell];
	[self addTableColumn:co];
}

- (void)defineTable
{	
	/*move= [[NSMutableArray alloc] initWithCapacity:2];	
	[move addObject:@"R"];
	[move addObject:@"L"];	*/
}

-(void)addColumn
{
	NSTableColumn *col;
	Movement *move;
	col = [[NSTableColumn alloc] initWithIdentifier:@"col2"];
	//creation et configuration de la header cell
	NSCell *headerCell;
	headerCell = [[NSCell alloc] initTextCell:@"col 2"];
	[headerCell setType:NSTextCellType];
	[col setHeaderCell:headerCell];
	[self addTableColumn:col];
	
	//ajoute un move
	move = [[Movement alloc] init];
	[move setThrTime: 1.0];
	[move setSsBase:@"3"];
	[patJuggler addMovement:move];
	[self reloadData];
}

-(void)loadPattern:(SSPattern *)pat
{
	
}



@end