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

-(CGMutablePathRef *)path
{
	return path;
}

-(void)setPath:(CGMutablePathRef *)newPath
{
	path = newPath;
}

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		
    }
    return self;
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

-(void)awakeFromNib
{
	[self loadGraphics];	
    layerBall = [CALayer layer]; 
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
    CGFloat components[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    CGColorRef blackColor = CGColorCreate(colorSpace, components);
    layerBall.backgroundColor = blackColor; 
    self.bounds = NSMakeRect(0.0, 0.0, 50.0, 50.0);
    [self setLayer:layerBall]; 
    [self setWantsLayer:YES];
    CGColorRelease(blackColor);
    CGColorSpaceRelease(colorSpace);
	[self createObject];
}



-(void)createObject
{
	CALayer *layer = [CALayer layer];
	//taille de CALayer
    layer.bounds = CGRectMake(0.0, 0.0, 30, 30);
    layer.opacity = 0.9;
    
    // Set image
    layer.contents = (id)ballImg;
    [layerBall addSublayer:layer];
	[self initAnimation:layer];
}

- (void)initAnimation:(CALayer*)layer
{
    CAKeyframeAnimation *vibAnimation = [CAKeyframeAnimation animation];
    vibAnimation.path = [self path];
    vibAnimation.duration = 1.0;
    vibAnimation.calculationMode = kCAAnimationLinear;
	vibAnimation.autoreverses=YES;
	[layer addAnimation: vibAnimation forKey:@"position"];
}


- (id)loadThrowablePath:(Throwable*) throwObj
{
	int i;
	NSLog(@"Load path");
	[self setPath: CGPathCreateMutable()];
    CGPathMoveToPoint(path, NULL, 0, 0);
	for (i=-10; i< 10; i++)
	{
		CGPathAddLineToPoint(path, NULL, i*i, i*5);
	}
	return self;
}

@end
