//
//  Xcode25AppDelegate.h
//  Xcode25
//
//  Created by Dave Vasilevsky on 13-04-15.
//  Copyright 2013 Evolving Web. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>

@interface Xcode25AppDelegate : NSObject {
	IBOutlet NSWindow *window;
	
	HIThemeTrackDrawInfo progressDrawInfo;
	NSImage *progressBackground;
	NSDate *startTime;
	double updatesPerSecond;
}

@end
