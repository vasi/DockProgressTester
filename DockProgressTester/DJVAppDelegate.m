//
//  DJVAppDelegate.m
//  DockProgressTester
//
//  Created by Dave Vasilevsky on 13-03-30.
//  Copyright (c) 2013 Dave Vasilevsky. All rights reserved.
//

#import "DJVAppDelegate.h"

@implementation DJVAppDelegate

- (void)initDockProgress
{
  self.startTime = [NSDate date];
  self.updatesPerSecond = 30.0;
}

- (void)drawDockProgress:(NSTimer*)timer
{
  [NSTimer scheduledTimerWithTimeInterval:1.0 / self.updatesPerSecond
                                   target:self
                                 selector:@selector(drawDockProgress:)
                                 userInfo:nil
                                  repeats:NO];
  
  double seconds = 60.0;
  
  double elapsed = -[self.startTime timeIntervalSinceNow];
  double progress = fmod(elapsed, seconds) / seconds;
  
  NSImage *icon = [[NSImage imageNamed:@"NSApplicationIcon"] copyWithZone:nil];
  NSSize sz = [icon size];
  NSRect bar = NSMakeRect(sz.width *  1/32, sz.height * 3/32,
                          sz.width * 30/32, sz.height * 3/32);
  
  [icon lockFocus];
  
  // Draw the bar background
  [[NSColor whiteColor] set];
  [NSBezierPath fillRect:bar];
  
  // Draw the progress
  NSRect prog = bar;
  prog.size.width *= progress;
  [[NSColor blueColor] set];
  [NSBezierPath fillRect:prog];
  
  // Draw the bar outline
  [[NSColor blackColor] set];
  [NSBezierPath strokeRect:bar];
  
  [icon unlockFocus];
  [NSApp setApplicationIconImage:icon];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  [self initDockProgress];
  [self drawDockProgress:nil];
}

@end
