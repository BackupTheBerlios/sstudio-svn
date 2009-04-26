//
//  Controller.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"

@implementation Controller


- (IBAction)initialize:(id)sender
{
	myself = [[Juggler alloc] init];
	NSLog(@"init");
	//connecte grille avec un pattern
	//[patGrid initWithPattern:pat];
	
}

-(id)definePattern
{
	/*
	Movement *ss;	ss = [Movement alloc];
	Movement *newSS = [[Movement alloc] init];
	[ss initSiteswap:@"3" time:@"2" throwSite:@"l"];
	[pat addSiteswap:ss];	
	ss = [Movement alloc];
	[ss initSiteswap:@"3" time:@"1" throwSite:@"r"];
	[pat addSiteswap:ss];
	NSLog(@"ss%@", ss );
	//NSLog(@"Pat: %@", [pat listSiteswap]);
	
	//nouveau fonctionnement
	pat = [[SSPattern alloc] init];
	[pat addMovement: [newSS initMovement]];
	return self;
	 */
	SSPattern *mvt;
	mvt = [[Movement alloc] init];
	[mvt setValue:@"L" forKey:@"thrPos"];
	NSLog(@"move1:%@", [mvt valueForKey:@"thrPos"]);
	return self;
}


-(IBAction)juggleButtonClick:(id)sender
{
	//NSLog(@"ball needed %d",[pat ballNumberNeeded]);
	
	//double val;
	Movement *tMove;
	NSLog(@"juggle started");
	[self juggle];
	[self startSimulation];
	//tMove = [[[myself patt] arrMovements] objectAtIndex:1];
	//NSLog("juggleButtonClick: ssbase= %@", [tMove valueForKey:@"ssBase"]);
	//[myself juggleMove:tMove];
	//[self juggle];
	//NSLog(@"btTest %@",[ btTest stringValue]);
	//NSLog(@"%@", [NSString stringWithFormat:@"%f", val ]);
	//[show mainLayer];
	//[show animateTrajectory:[myself ballNumber:1]];
}

-(void)juggle
{
	NSLog(@"myself:%@", myself);
	[[myself leftHand] setPositionX:0.0	positionY:0.0];
	[[myself rightHand] setPositionX:0.8	positionY:0.2];
	
	[[myself ballNumber:1] deleteTrajectory];
	[[myself leftHand] throw:[myself ballNumber:1] to:[myself rightHand]];
	NSLog(@"test %@",[[myself ballNumber:1] showTrajectory]);	
}

/*
saisie des siteswap dans une grid
 
//ajoute une colonne a la grille de moves
-(IBAction)addNewMove:(id)sender;
{
	Movement *move;
	move = [[Movement alloc] init];
	[pat addMovement:move];
	[patGrid addColumn];
	[patGrid setNeedsDisplay:YES];
	[patGrid reloadData];
}


-(id)numberOfRowsInTableView:(NSTableView *)tableView
{
    return 2;
}


- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
			row:(int)row
{
	//Movement *move;
	//move = [[patJuggler arrMovements] objectAtIndex: row];
	return @"3";//[move thrTime ];
}
 */

-(void)startSimulation;
{
	const ts =0.050;
	countTime = [[NSNumber numberWithFloat:0.0f] retain];
	timer = [[NSTimer scheduledTimerWithTimeInterval:ts 
											  target:self
											selector:@selector(tmrInterrupt:)
											userInfo:nil 
											 repeats:YES] retain];
	
	//on definit les parametres de la simulation
	
	
	//[[myself rightHand] setThrowSpeed:hDest inSeconds:1.0]];
}

-(void)tmrInterrupt:(NSTimer *)aTimer;
{
	float old;
	old = [countTime floatValue];
	[countTime release]; 
	countTime = [[NSNumber numberWithFloat: (old+0.05)] retain];
	//NSLog(@"timer:%f",[countTime floatValue]);
	
	//process
	///calcule +affichage ici
	[[myself ballNumber:1] positionAtTime:countTime];
	[oglShow setNeedsDisplay:YES];
}

@end
