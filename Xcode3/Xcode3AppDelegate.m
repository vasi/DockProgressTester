//
//  Xcode3AppDelegate.m
//  Xcode3
//
//  Created by Dave Vasilevsky on 13-04-15.
//  Copyright 2013 Evolving Web. All rights reserved.
//

#import "Xcode3AppDelegate.h"

@implementation Xcode3AppDelegate

- (void)initDockProgress
{
  NSImage *appIcon = [NSImage imageNamed:@"NSApplicationIcon"];
  progressBackground = [appIcon copyWithZone:nil];
  
  NSSize sz = [progressBackground size];
  progressDrawInfo = (HIThemeTrackDrawInfo){
    .version = 0,
    .kind = kThemeLargeProgressBar,
    .bounds = CGRectMake(sz.width * 1/32, sz.height * 3/32,
                         sz.width * 30/32, sz.height * 2/32),
    .min = 0,
    .max = INT32_MAX,
    .value = 0,
    .reserved = 0,
    .attributes = kThemeTrackHorizontal,
    .enableState = kThemeTrackActive,
    .filler1 = 0,
    .trackInfo = { .progress = { .phase = 0 } },
  };
  
  HIRect bounds;
  HIThemeGetTrackBounds(&progressDrawInfo, &bounds);
  int mleft = 3, mtop = 3, mright = 3, mbot = 1;
  bounds.origin.x += mleft;
  bounds.origin.y += mbot;
  bounds.size.width -= mleft + mright;
  bounds.size.height -= mtop + mbot;
  
  [progressBackground lockFocus];
  [[NSColor whiteColor] set];
	NSRect fill = NSMakeRect(bounds.origin.x, bounds.origin.y,
													 bounds.size.width, bounds.size.height);
  NSRectFill(fill);
  [progressBackground unlockFocus];
  
  startTime = [[NSDate alloc] init];
  updatesPerSecond = 8.0;
}

- (void)drawDockProgress:(NSTimer*)timer
{
  [NSTimer scheduledTimerWithTimeInterval:1.0 / updatesPerSecond
                                   target:self
                                 selector:@selector(drawDockProgress:)
                                 userInfo:nil
                                  repeats:NO];
  
  double seconds = 60.0;
  double phaseSeconds = 30.0;
  
  double elapsed = -[startTime timeIntervalSinceNow];
  double progress = fmod(elapsed, seconds) / seconds;
  UInt8 phase = fmod(elapsed, phaseSeconds) / phaseSeconds *
	UINT8_MAX;
  
  NSImage *icon = [progressBackground copyWithZone:nil];
  progressDrawInfo.value = progressDrawInfo.max * progress;
  progressDrawInfo.trackInfo.progress.phase = phase;
  
  [icon lockFocus];
  CGContextRef ctx = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
  HIThemeDrawTrack(&progressDrawInfo, NULL, ctx, kHIThemeOrientationNormal);
  [icon unlockFocus];
  [NSApp setApplicationIconImage:icon];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  [self initDockProgress];
  [self drawDockProgress:nil];
}

@end
