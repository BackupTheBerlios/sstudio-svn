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
   // NSURL *url = [NSURL URLWithString:@"http://www.toocharger.com/img/graphiques/gifs_animes/sport/basket_ball/sbasket_ball.26559.gif"]; 
	//NSURL *url = [NSURL URLWithString:@"/Volumes/Home/code/juggle/trunk/ballGreen.png"]; 

	//CGImageSourceRef imageSource = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
	
    //chargement de la balle
	//NSString *imagePath = [NSString stringWithString:@"/Volumes/Home/code/juggle/trunk/ballGreen.png"];
	//NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
	//Loads the image.
	//CGDataProviderRef source = (CGDataProviderRef)imageData;
	//CGImageSourceRef imageSource = CGImageSourceCreateWithDataProvider(source, 0);
	
	
	//ballImg = CGImageSourceCreateImageAtIndex(imageSource, 0, NULL);
	//ballImg = CGImageSourceCreateImageAtIndex(imageSource, 0, NULL);
    //CFRelease(imageSource);
	
    CGDataProviderRef provider;	
    CFStringRef path2;	
    CFURLRef url;	
    path2 = CFStringCreateWithCString (NULL, "/Volumes/Home/code/juggle/trunk/ballGreen.jpg", kCFStringEncodingUTF8);
    url = CFURLCreateWithFileSystemPath (NULL, path2, kCFURLPOSIXPathStyle, NULL);
    CFRelease(path2);
    provider = CGDataProviderCreateWithURL (url);// 3
    CFRelease (url);
    ballImg = CGImageCreateWithJPEGDataProvider (provider,// 4
											   NULL,
											   true,
											   kCGRenderingIntentDefault);
    CGDataProviderRelease (provider);// 5
    //CGImageRelease (image);
	
	//
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

-(void)loadGraphics
{

}

-(void)createObject
{
	CALayer *layer = [CALayer layer];
	CABasicAnimation *theAnimation;
    float parentWidth = CGRectGetWidth( layerBall.bounds);
    float parentHeight = CGRectGetHeight(layerBall.bounds);
    layer.position = CGPointMake(200,200);
	//taille de CALayer
    layer.bounds = CGRectMake(0.0, 0.0, 30, 30);
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
