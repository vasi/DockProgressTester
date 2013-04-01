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
    
    NSImageView *iconView = [[NSImageView alloc] initWithFrame:[self bounds]];
    [iconView setImage:[NSImage imageNamed:@"NSApplicationIcon"]];
    [self addSubview:iconView];
    
    NSSize sz = frame.size;
    NSRect progressFrame = NSMakeRect(sz.width * 1/32, sz.height * 3/32,
                                      sz.width * 30/32, sz.height * 4/32);
    self.progress = [[NSProgressIndicator alloc] initWithFrame:progressFrame];
    [self.progress setMaxValue: 1.0];
    [self.progress setIndeterminate: NO];
    [self addSubview:self.progress];
  }
  
  return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
  double seconds = 60.0;
  double elapsed = -[self.startTime timeIntervalSinceNow];
  double progress = fmod(elapsed, seconds) / seconds;
  [self.progress setDoubleValue: progress];
  [super drawRect:dirtyRect];
}

@end
