//
//  View.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import <QuartzCore/QuartzCore.h>

@implementation View

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		
    }
    return self;
}


-(void)awakeFromNib
{
	//img
    NSURL *url = [NSURL URLWithString:@"http://medent.usyd.edu.au/fact/flea.gif"]; 
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    ballImg = CGImageSourceCreateImageAtIndex(imageSource, 0, NULL);
    CFRelease(imageSource);
	
    layerBall = [CALayer layer]; 
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
    CGFloat components[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    CGColorRef blackColor = CGColorCreate(colorSpace, components);
    layerBall.backgroundColor = blackColor; 
    self.bounds = NSMakeRect(0.0, 0.0, 200.0, 100.0);
    [self setLayer:layerBall]; 
    [self setWantsLayer:YES];
    CGColorRelease(blackColor);
    CGColorSpaceRelease(colorSpace);
	[self createObject];
}

-(void)createObject
{
	CALayer *layer = [CALayer layer];
	CABasicAnimation *theAnimation;
    float parentWidth = CGRectGetWidth( layerBall.bounds);
    float parentHeight = CGRectGetHeight(layerBall.bounds);
    layer.position = CGPointMake(40,60);
    layer.bounds = CGRectMake(0.0, 0.0, parentWidth*0.4, parentHeight*0.4);
    layer.opacity = 0.9;
    
    // Set image
    layer.contents = (id)ballImg;
    [layerBall addSublayer:layer];
    
	
	theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
	theAnimation.duration=3.0;
	theAnimation.repeatCount=2;
	theAnimation.autoreverses=YES;
	theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
	theAnimation.toValue=[NSNumber numberWithFloat:0.0];
	//[layer addAnimation:theAnimation forKey:@"animateOpacity"];
	//[self moveLayer:layer to:CGPointMake(100, 50)];
	[self vibAnimation:layer];
    return layer;
}

/*-(void)moveLayer:(CALayer*)layer to:(CGPoint)point
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
	animation.duration =5.0;
	animation.autoreverses=YES;
    animation.toValue = [NSValue valueWithPoint:NSPointFromCGPoint(point)];
	[self vibAnimation:layer];
    //[layer addAnimation:animation forKey:nil];
    //layer.position = point;
}*/

- (void)vibAnimation:(CALayer*)layer
{
	int i;
    CAKeyframeAnimation *vibAnimation = [CAKeyframeAnimation animation];
    CGMutablePathRef vibPath = CGPathCreateMutable();
    CGPathMoveToPoint(vibPath, NULL, 0, 0);
    // move left 20%
	for (i=-10; i< 10; i++)
	{
		CGPathAddLineToPoint(vibPath, NULL, i*i, i*5);
	}
    //CGPathCloseSubpath(vibPath);
    vibAnimation.path = vibPath;
    // set the duration to whatever looks good
    vibAnimation.duration = 1.0;
    // paced makes it smooth throughout the animation
    vibAnimation.calculationMode = kCAAnimationLinear;
	vibAnimation.autoreverses=YES;
	[layer addAnimation: vibAnimation forKey:@"position"];
}


- (id)loadThrowablePath
{
	NSLog(@"Load path");
	return self;
}

@end
