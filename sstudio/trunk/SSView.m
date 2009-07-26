#import "SSView.h"
#import "Controller.h"

@implementation SSView

-(void)awakeFromNib;
{
	NSLog(@"Awake!");
	zoom = 0.3f;
}

-(void) setPattern:(SSPattern *)aPat;
{
	patternToShow = aPat;
	[patternToShow retain];
}

void drawBall(int ballNumber)
{
	float ballColor[3];
	switch(ballNumber){
		case 0:
			ballColor[0] = 1;
			ballColor[1] = 0;
			ballColor[2] = 0;
			break;
		case 1:
			ballColor[0] = 0;
			ballColor[1] = 1;
			ballColor[2] = 0;
			break;
		case 2:
			ballColor[0] = 0;
			ballColor[1] = 0;
			ballColor[2] = 1;
			break;
		case 3:
			ballColor[0] = 1;
			ballColor[1] = 1;
			ballColor[2] = 0;
			break;		
		case 4:
			ballColor[0] = 1;
			ballColor[1] = 0;
			ballColor[2] = 1;
			break;
		default:
			ballColor[0] = 1;
			ballColor[1] = 1;
			ballColor[2] = 1;
			break;
	}
	glColor3fv(ballColor);
	float DEG2RAD = (2*3.14)/360;
	float radius =  0.1;
	int i;
	float facteur;
	glBegin(GL_TRIANGLE_FAN);
	facteur = radius*zoom;
	glVertex2f(0,0);
	for (i=0; i < 380; i += 20)
	{
		float degInRad = i*DEG2RAD;
		glVertex2f(cos(degInRad)*facteur,sin(degInRad)*facteur);
	}
	glEnd();
	
	//contour de la balle
	glColor3f(0, 0, 0);
	glBegin(GL_LINE_LOOP);
	facteur = radius*zoom;
	for (i=0; i < 380; i += 20)
	{
		float degInRad = i*DEG2RAD;
		glVertex2f(cos(degInRad)*facteur,sin(degInRad)*facteur);
	}
	glEnd();
}

void drawHand(void)
{
	glColor3f(0.0, 0.0, 0.0);
	glBegin(GL_QUADS);
	glVertex2f(-0.05*zoom, 0);
	glVertex2f(0.05*zoom, 0);
	glVertex2f(0.05*zoom, -0.02);
	glVertex2f(-0.05,-0.02);	
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
	glVertex2f(-0.5f*zoom, 0);
	glVertex2f(1*zoom, 0);
	glVertex2f(0,0);
	glVertex2f(0,1*zoom);
	glEnd();
}

//dessine
-(void) drawRect: (NSRect) bounds
{
	glClearColor(1, 1, 1, 0);
	glClear(GL_COLOR_BUFFER_BIT);

	NSArray *tBalls;
	Throwable *aBall;
	NSArray *tHands;
	Hand *aHand;
	tBalls = [[patternToShow controller] balls];
	int i, count = [tBalls count];
	glLoadIdentity();			
	//dessine l'origine
	moveOrigin();
	drawOrigin();
	
	//puis les balles
	for (i = 0; i < count; i++) {
		aBall = [tBalls objectAtIndex:i];
		if (aBall){
			glLoadIdentity();			
			moveOrigin();
			glTranslatef([aBall x]*zoom,[aBall y]*zoom, 0.0f*zoom);
			drawBall([[aBall valueForKey:@"number"] intValue]);
		}
	}
	
	//puis les mains
	tHands = [[patternToShow controller] hands]; 
	for(i=0; i < [tHands count]; i++){
		aHand = [tHands objectAtIndex:i];
		glLoadIdentity();
		moveOrigin();
		glTranslatef([aHand getPosX], [aHand getPosY], 0.0);
		drawHand();
	}
	glFlush();
	glLoadIdentity();
}

void moveOrigin(void)
{
	glTranslatef( 0, -0.5*zoom, 0);
}


- (float) zoom {
  return zoom;
}

- (void) setZoom: (float) newValue {
  zoom = newValue;
}

@end
