//
//  DJVAppDelegate.h
//  DockProgressTester
//
//  Created by Dave Vasilevsky on 13-03-30.
//  Copyright (c) 2013 Dave Vasilevsky. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>

@interface DJVAppDelegate : NSObject <NSApplicationDelegate>
{
  HIThemeTrackDrawInfo progressDrawInfo;
}

@property (assign) IBOutlet NSWindow *window;

@property NSImage *progressBackground;
@property NSDate *startTime;

@property double updatesPerSecond;

@end
