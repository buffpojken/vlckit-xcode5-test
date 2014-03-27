//
//  VLAppDelegate.m
//  VLCTest
//
//  Created by Daniel Sundström on 27/03/14.
//  Copyright (c) 2014 Sykewarrior. All rights reserved.
//

#import "VLAppDelegate.h"
#import <VLCKit/VLCKit.h>
#import "VLCustomWindow.h"

@implementation VLAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    NSScreen *scr = [[NSScreen screens] objectAtIndex:0];
    self.window = [[VLCustomWindow alloc] initWithContentRect:scr.frame styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer: YES];
    
    self.window.title = @"Monkey VLC Test";
    
    [self.window orderFrontRegardless];
    
    self.videoView = [[VLCVideoView alloc] initWithFrame:[self.window.contentView bounds]];
    [[self.window contentView] addSubview:self.videoView];

    self.videoView.autoresizingMask = NSViewHeightSizable|NSViewWidthSizable;

    
    self.player = [[VLCMediaPlayer alloc] initWithVideoView:self.videoView];
    [self.player setMedia:[VLCMedia mediaWithPath:[[NSBundle mainBundle] pathForResource:@"video" ofType:@"mp4"]]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"Playing...");
        [self.player play];
    });
    
    
    [self.videoView enterFullScreenMode:[NSScreen mainScreen] withOptions:nil];
}




@end
