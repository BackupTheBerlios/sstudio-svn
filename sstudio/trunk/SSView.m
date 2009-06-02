#import "SSView.h"

@implementation SSView

-(void)awakeFromNib;
{
	NSLog(@"Awake!");
}

-(void) setPattern:(SSPattern *)aPat;
{
	patternToShow = aPat;
	[patternToShow retain];
}

void drawBall()
{
	glColor3f(1.0f, 0.0f, 0.0f);
	/*
	glBegin(GL_QUADS);
	{
		glVertex3f( 0.0, 0.1, 0.0);
		glVertex3f( 0.1, 0.1, 0.0);
		glVertex3f( 0.1, 0 ,0.0);
		glVertex3f( 0, 0 ,0.0);
	}
	glEnd();
	 */
	float DEG2RAD = 360/(2*3.14);
	float radius = 0.1;
	int i;
	glBegin(GL_LINE_LOOP);
	
	for (i=0; i < 360; i += 10)
	{
		float degInRad = i*DEG2RAD;
		glVertex2f(cos(degInRad)*radius,sin(degInRad)*radius);
	}
	
	glEnd();
	//NSLog(@"drawRect: OK test");
}

//dessine
-(void) drawRect: (NSRect) bounds
{
	Throwable *tBall;
	tBall = [[patternToShow controller] ballNumber:0];
	glClearColor(0, 0, 0, 0);
	glClear(GL_COLOR_BUFFER_BIT);
	glLoadIdentity();
	NSArray *tBalls;
	tBalls = [[patternToShow controller] balls];
	int i, count = [tBalls count];
	for (i = 0; i < count; i++) {
		Throwable *aBall = [tBalls objectAtIndex:i];
		if (aBall){
			glTranslatef([aBall x]/10,[aBall y]/10, 0.0f);
			drawBall();
			NSLog(@"ball:%f;%f",[aBall x],[aBall y] );
		}
	}

	glFlush();
}

@end
