/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiModule.h"
#import <MediaPlayer/MPMediaItem.h>
#import <MediaPlayer/MPNowPlayingInfoCenter.h>

@interface NetHoyohoyoTiremotecontrolModule : TiModule 

@property (nonatomic,readonly) NSNumber *REMOTE_CONTROL_PLAY;
@property (nonatomic,readonly) NSNumber *REMOTE_CONTROL_PAUSE;
@property (nonatomic,readonly) NSNumber *REMOTE_CONTROL_STOP;
@property (nonatomic,readonly) NSNumber *REMOTE_CONTROL_PLAY_PAUSE;
@property (nonatomic,readonly) NSNumber *REMOTE_CONTROL_NEXT;
@property (nonatomic,readonly) NSNumber *REMOTE_CONTROL_PREV;
@property (nonatomic,readonly) NSNumber *REMOTE_CONTROL_START_SEEK_BACK;
@property (nonatomic,readonly) NSNumber *REMOTE_CONTROL_END_SEEK_BACK;
@property (nonatomic,readonly) NSNumber *REMOTE_CONTROL_START_SEEK_FORWARD;
@property (nonatomic,readonly) NSNumber *REMOTE_CONTROL_END_SEEK_FORWARD;

@end
