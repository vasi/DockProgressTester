//
//  DJVAppDelegate.m
//  DockProgressTester
//
//  Created by Dave Vasilevsky on 13-03-30.
//  Copyright (c) 2013 Dave Vasilevsky. All rights reserved.
//

#import "DJVAppDelegate.h"

#import "DJVDockIconView.h"

@implementation DJVAppDelegate

- (void)updateDockTile:(NSTimer*)timer
{
  [[NSApp dockTile] display];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  NSDockTile *dockTile = [NSApp dockTile];
  NSRect frame = { .origin = NSZeroPoint, .size = [dockTile size] };
  NSView *dockView = [[DJVDockIconView alloc] initWithFrame:frame];
  [dockTile setContentView: dockView];
  [NSTimer scheduledTimerWithTimeInterval:1.0 / 30
                                   target:self
                                 selector:@selector(updateDockTile:)
                                 userInfo:nil
                                  repeats:YES];
}

@end
