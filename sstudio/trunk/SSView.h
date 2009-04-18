#import <Cocoa/Cocoa.h>

@interface SSView : NSOpenGLView/* Specify a superclass (eg: NSObject or NSView) */ {

}

-(void) drawRect: (NSRect) bounds;

//c-style
void drawAnObject();
@end
