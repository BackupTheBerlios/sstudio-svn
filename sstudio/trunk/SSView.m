#import "SSView.h"

@implementation SSView

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
	NSLog(@"drawRect: OK test");
}

//dessine
-(void) drawRect: (NSRect) bounds
{
	glClearColor(0, 0, 0, 0);
	glClear(GL_COLOR_BUFFER_BIT);
	glLoadIdentity();
	drawAnObject();
	glFlush();
}

@end
