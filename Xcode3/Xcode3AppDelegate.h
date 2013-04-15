//
//  Xcode3AppDelegate.h
//  Xcode3
//
//  Created by Dave Vasilevsky on 13-04-15.
//  Copyright 2013 Evolving Web. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>

@interface Xcode3AppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow *window;
	
	HIThemeTrackDrawInfo progressDrawInfo;
}

@property (assign) IBOutlet NSWindow *window;

@property (retain) NSImage *progressBackground;
@property (retain) NSDate *startTime;

@property double updatesPerSecond;

@end
