#import "SSView.h"
#import "Controller.h"

@implementation SSView

-(void)awakeFromNib;
{
	NSLog(@"Awake!");
	zoom = 0.5f;
}

-(void) setPattern:(SSPattern *)aPat;
{
	patternToShow = aPat;
	[patternToShow retain];
}

void drawBall()
{
	glColor3f(1.0f, 0.0f, 0.0f);
	float DEG2RAD = (2*3.14)/360;
	float radius =  0.1;
	int i;
	float facteur;
	glBegin(GL_LINE_LOOP);
	facteur = radius*zoom;
	for (i=0; i < 360; i += 10)
	{
		float degInRad = i*DEG2RAD;
		glVertex2f(cos(degInRad)*facteur,sin(degInRad)*facteur);
	}
	glEnd();
}

//vecteur = 1 metre
void drawOrigin()
{
	glBegin(GL_LINES);
	//repere
	glColor3f(0.5, 0, 0);
	glVertex2f(-5, 0);
	glVertex2f(5, 0);
	glVertex2f(0,-5);
	glVertex2f(0,5);

	//vecteur
	glColor3f(0, 1, 0);
	glVertex2f(0, 0);
	glVertex2f(1*zoom, 0);
	glVertex2f(0,0);
	glVertex2f(0,1*zoom);
	glEnd();
}

//dessine
-(void) drawRect: (NSRect) bounds
{
	Throwable *aBall;
	glClearColor(0, 0, 0, 0);
	glClear(GL_COLOR_BUFFER_BIT);
	glLoadIdentity();
	NSArray *tBalls;
	tBalls = [[patternToShow controller] balls];
	int i, count = [tBalls count];
	//NSLog(@" --== DrawRect ==-- ");
	drawOrigin();
	for (i = 0; i < count; i++) {
		aBall = [tBalls objectAtIndex:i];
		if (aBall){
			glTranslatef([aBall x]*zoom,[aBall y]*zoom, 0.0f*zoom);
			drawBall();
			//NSLog(@"ball:%f;%f",[aBall x],[aBall y] );
		}
	}
	glFlush();
}


- (float) zoom {
  return zoom;
}

- (void) setZoom: (float) newValue {
  zoom = newValue;
}

@end
