//
//  Xcode3AppDelegate.h
//  Xcode3
//
//  Created by Dave Vasilevsky on 13-04-15.
//  Copyright 2013 Evolving Web. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Xcode3AppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
