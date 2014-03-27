//
//  VLAppDelegate.h
//  VLCTest
//
//  Created by Daniel Sundström on 27/03/14.
//  Copyright (c) 2014 Sykewarrior. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <VLCKit/VLCKit.h>

@interface VLAppDelegate : NSObject <NSApplicationDelegate>

@property (retain) NSWindow *window;
@property (retain) VLCMediaPlayer *player;
@property (retain) VLCVideoView *videoView;

@end
