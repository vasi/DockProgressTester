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
  NSView *dockView = [[DJVDockIconView alloc] init];
  [[NSApp dockTile] setContentView: dockView];
  [NSTimer scheduledTimerWithTimeInterval:1.0 / 30
                                   target:self
                                 selector:@selector(updateDockTile:)
                                 userInfo:nil
                                  repeats:YES];
}

@end
