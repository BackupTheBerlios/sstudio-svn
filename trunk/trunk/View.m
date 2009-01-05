//
//  View.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "View.h"


@implementation View

- (void)prepare
{
	NSLog(@"init");
	NSOpenGLContext *glContext = [self openGLContext];
	[glContext makeCurrentContext];
	
	//config view
	glShadeModel(GL_SMOOTH);
	glEnable(GL_LIGHTING);
	glEnable(GL_DEPTH_TEST);
	
	//eclairage
	GLfloat ambient[] = {0.2,0.2,0.2, 1.0};
	glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambient);
	
	//init src lumineuse
	GLfloat diffuse[]= {1.0,1.0,1.0,1.0};
	glLightfv (GL_LIGHT0, GL_DIFFUSE, diffuse);
	
	//eteindre
	glEnable(GL_LIGHT0);
	
	//propriete des materiaux
	GLfloat mat[]={0.1, 0.1, 0.7, 1.0};
	glMaterialfv(GL_FRONT, GL_AMBIENT, mat);
	glMaterialfv(GL_FRONT, GL_DIFFUSE, mat);
}

- (id)initWithCoder:(NSCoder *)c
{
	self = [super initWithCoder:c];
	[self prepare];
	return self;
}

- (void)reshape
{
	NSLog(@"reshape");
	NSRect baseRect = [self convertRectToBase:[self bounds]];
	glViewport(0,0, baseRect.size.width, baseRect.size.height);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(60.0, baseRect.size.width/baseRect.size.height, 0.2, 7);
}

/*- (void) awakeFromNib
{
	[self changeParameter:self];
}*/

-(void)drawRect:(NSRect)r
{
	glClearColor(0.2, 0.4, 0.1, 0.0);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	gluLookAt(0,0,0,
			  0,0,0,
			  0,1,0);
	
	GLfloat lightPosition[]= {1,1,3,0.0};
	glLightfv(GL_LIGHT0, GL_POSITION, lightPosition);
	glutSolidTorus(0.3, 1.8, 35, 31);
}

	
@end
