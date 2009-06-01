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

void drawAnObject()
{
	glColor3f(1.0f, 0.0f, 0.0f);
	glBegin(GL_QUADS);
	{
		glVertex3f( 0.0, 0.1, 0.0);
		glVertex3f( 0.1, 0.1, 0.0);
		glVertex3f( 0.1, 0 ,0.0);
		glVertex3f( 0, 0 ,0.0);
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
	if (tBall){
		glTranslatef([tBall x]/10,[tBall y]/10, 0.0f);
		drawAnObject();
		NSLog(@"ball:%f;%f",[tBall x],[tBall y] );
	}
	glFlush();
}

@end
