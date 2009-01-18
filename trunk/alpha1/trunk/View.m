//
//  View.m
//  juggle
//
//  Created by clem on 30/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import "Position.h"
#import <QuartzCore/QuartzCore.h>


@implementation View

/*-(CGMutablePathRef *)path
{
	return path;
}

-(void)setPath:(CGMutablePathRef *)newPath
{
	path = newPath;
}*/

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

-(CALayer *)mainLayer
{
	NSLog(@"mainLayer: %@", mainLayer);
	return mainLayer;
}

-(void)loadGraphics
{
    CGDataProviderRef provider;	
    CFStringRef path2;	
    CFURLRef url;	
    path2 = CFStringCreateWithCString (NULL, "/Volumes/Home/code/juggle/trunk/ballGreen.jpg", kCFStringEncodingUTF8);
    url = CFURLCreateWithFileSystemPath (NULL, path2, kCFURLPOSIXPathStyle, false);
    CFRelease(path2);
    provider = CGDataProviderCreateWithURL (url);// 3
    CFRelease (url);
    ballImg = CGImageCreateWithJPEGDataProvider (provider, NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease (provider);// 5
}

-(void)loadGraphicsFromURL
{
    NSURL *url = [NSURL URLWithString:@"http://medent.usyd.edu.au/fact/flea.gif"]; 
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    ballImg = CGImageSourceCreateImageAtIndex(imageSource, 0, NULL);
    CFRelease(imageSource);
}

-(void)awakeFromNib
{
	mainLayer = [CALayer layer];
	layerBall = [CALayer layer];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
    CGFloat components[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    CGColorRef redColor = CGColorCreate(colorSpace, components);
    mainLayer.backgroundColor = redColor; 
    self.bounds = NSMakeRect(0.0, 0.0, 50.0, 50.0);
    [self setLayer:mainLayer]; 
    [self setWantsLayer:YES];
    CGColorRelease(redColor);
    CGColorSpaceRelease(colorSpace);
	[self createObject];
}



-(void)createObject
{
	//taille de CALayer
    layerBall.bounds = CGRectMake(0.0, 0.0, 30, 30);
    layerBall.opacity = 0.9;
    layerBall.position = CGPointMake(0,0);
    // Set image
	[self loadGraphics];
    layerBall.contents = (id)ballImg;
	[self mainLayer];
    [mainLayer addSublayer:layerBall];
	//[self basicAnimationForLayer];
}

-(void)basicAnimationForLayer;
{
	CABasicAnimation *baseAnim = [CABasicAnimation animationWithKeyPath:@"position" ];
	baseAnim.duration = 3.0;
	baseAnim.toValue = [NSValue valueWithPoint: NSPointFromCGPoint(CGPointMake(50, 50))];
	[layerBall addAnimation:baseAnim forKey:@"position"];
}

- (void)initAnimation:(CALayer*)layer
{
    CAKeyframeAnimation *vibAnimation = [CAKeyframeAnimation animation];
    vibAnimation.path = path;
    vibAnimation.duration = 1.0;
    vibAnimation.calculationMode = kCAAnimationLinear;
	vibAnimation.autoreverses=YES;
	[layer addAnimation: vibAnimation forKey:@"position"];
}

-(void)animateTrajectory:(Throwable *)objThrowed
//-(void)animateTrajectoryToLayer:(CALayer *)layer
{
	int i;
	Position *pos;
	pos = [[Position alloc] init];
	CAKeyframeAnimation *traj = [CAKeyframeAnimation animation];
	//[self loadThrowablePath:objThrowed];
	path= CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
	/*
	for (i=-0; i< 20 ; i++)
	{
		//pos = [[throwObj trajectory] objectAtIndex:i ];
		//NSLog(@"i %i pos: %@", i, pos);
		CGPathAddLineToPoint(path, NULL, 30+i*10, 30+i*i);
	}
	 */
	for (i=-0; i< [[objThrowed trajectory] count] ; i++)
	{
		pos = [[objThrowed trajectory] objectAtIndex:i ];
		NSLog(@"i %i pos: %@", i, pos);
		CGPathAddLineToPoint(path, NULL, [pos x]*(-1), [pos y]);
	}
    traj.path = path;
    traj.duration = 1.0;
    traj.calculationMode = kCAAnimationLinear;
	traj.autoreverses=YES;
	[layerBall addAnimation:traj forKey:@"position"];
}

- (id)loadThrowablePath:(Throwable*) throwObj
{
	int i;
	Position *pos;
	pos = [[Position alloc] init];
	NSLog(@"Load path");
	path= CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
	for (i=-0; i< [[throwObj trajectory] count] ; i++)
	{
		pos = [[throwObj trajectory] objectAtIndex:i ];
		NSLog(@"i %i pos: %@", i, pos);
		CGPathAddLineToPoint(path, NULL, 30+[pos x]*10, 30+[pos y]*10);
	}
	NSLog(@"path %@", path);
	return self;
}

@end
