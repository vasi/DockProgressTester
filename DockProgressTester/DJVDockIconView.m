//
//  DJVDockIconView.m
//  DockProgressTester
//
//  Created by Dave Vasilevsky on 13-03-31.
//  Copyright (c) 2013 Dave Vasilevsky. All rights reserved.
//

#import "DJVDockIconView.h"

@implementation DJVDockIconView

- (id)initWithFrame:(NSRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.startTime = [NSDate date];
    
    
  }
  
  return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
  NSImage *appIcon = [NSImage imageNamed:@"NSApplicationIcon"];
  [appIcon drawInRect:[self bounds]
             fromRect:NSZeroRect
            operation:NSCompositeSourceOver
             fraction:1.0];
  
  NSSize sz = [self bounds].size;
  HIThemeTrackDrawInfo drawInfo = (HIThemeTrackDrawInfo){
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
  HIThemeGetTrackBounds(&drawInfo, &bounds);
  int mleft = 3, mtop = 3, mright = 3, mbot = 1;
  bounds.origin.x += mleft;
  bounds.origin.y += mbot;
  bounds.size.width -= mleft + mright;
  bounds.size.height -= mtop + mbot;
  [[NSColor whiteColor] set];
  NSRectFill(NSRectFromCGRect(bounds));
  
  
  double seconds = 60.0;
  double phaseSeconds = 30.0;
  double elapsed = -[self.startTime timeIntervalSinceNow];
  
  double progress = fmod(elapsed, seconds) / seconds;
  UInt8 phase = fmod(elapsed, phaseSeconds) / phaseSeconds * UINT8_MAX;
  
  drawInfo.value = drawInfo.max * progress;
  drawInfo.trackInfo.progress.phase = phase;
  
  CGContextRef ctx = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
  HIThemeDrawTrack(&drawInfo, NULL, ctx, kHIThemeOrientationNormal);
}

@end
