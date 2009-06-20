#import <Cocoa/Cocoa.h>
#import "SSPattern.h"

@interface SSView : NSOpenGLView/* Specify a superclass (eg: NSObject or NSView) */ {
	SSPattern *patternToShow;
}

-(void) setPattern:(SSPattern *)aPat;
-(void) drawRect: (NSRect) bounds;

//c-style
void drawBall();

@end