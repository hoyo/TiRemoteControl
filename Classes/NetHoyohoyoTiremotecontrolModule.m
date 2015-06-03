/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "NetHoyohoyoTiremotecontrolModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation NetHoyohoyoTiremotecontrolModule

MAKE_SYSTEM_PROP(REMOTE_CONTROL_PLAY,UIEventSubtypeRemoteControlPlay);
MAKE_SYSTEM_PROP(REMOTE_CONTROL_PAUSE,UIEventSubtypeRemoteControlPause);
MAKE_SYSTEM_PROP(REMOTE_CONTROL_STOP,UIEventSubtypeRemoteControlStop);
MAKE_SYSTEM_PROP(REMOTE_CONTROL_PLAY_PAUSE,UIEventSubtypeRemoteControlTogglePlayPause);
MAKE_SYSTEM_PROP(REMOTE_CONTROL_NEXT,UIEventSubtypeRemoteControlNextTrack);
MAKE_SYSTEM_PROP(REMOTE_CONTROL_PREV,UIEventSubtypeRemoteControlPreviousTrack);
MAKE_SYSTEM_PROP(REMOTE_CONTROL_START_SEEK_BACK,UIEventSubtypeRemoteControlBeginSeekingBackward);
MAKE_SYSTEM_PROP(REMOTE_CONTROL_END_SEEK_BACK,UIEventSubtypeRemoteControlEndSeekingBackward);
MAKE_SYSTEM_PROP(REMOTE_CONTROL_START_SEEK_FORWARD,UIEventSubtypeRemoteControlBeginSeekingForward);
MAKE_SYSTEM_PROP(REMOTE_CONTROL_END_SEEK_FORWARD,UIEventSubtypeRemoteControlEndSeekingForward);

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"9326b7d7-f454-4b2d-bd81-1aebcd8ee868";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"net.hoyohoyo.tiremotecontrol";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(remoteControlEvent:)
                                                 name:kTiRemoteControlNotification
                                               object:nil];
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma mark -
#pragma mark Public APIs

-(void)setNowPlayingInfo:(id)args
{
    ENSURE_SINGLE_ARG(args,NSDictionary);
    NSString *artist = [TiUtils stringValue:@"artist" properties:args def:@""];
    NSString *title = [TiUtils stringValue:@"title" properties:args def:@""];
    NSString *albumTitle = [TiUtils stringValue:@"albumTitle" properties:args def:@""];
    BOOL *albumArtworkLocal = [TiUtils boolValue:@"albumArtworkLocal" properties:args def:@""];
    NSString *albumArtwork = [TiUtils stringValue:@"albumArtwork" properties:args def:nil];

    Class playingInfoCenter = NSClassFromString(@"MPNowPlayingInfoCenter");

    if (playingInfoCenter) {

        NSMutableDictionary *songInfo = [[NSMutableDictionary alloc] init];

        if(albumArtwork != nil){
            
            UIImage *artworkImage = nil;
            
            if(albumArtworkLocal){
                
                NSString *albumArtworkPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:albumArtwork];
                
                artworkImage = [UIImage imageWithContentsOfFile:albumArtworkPath];
           
            }else{
                
                artworkImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:albumArtwork]]];
            }
	       	MPMediaItemArtwork *albumArt = [[MPMediaItemArtwork alloc] initWithImage:artworkImage];
	       	[songInfo setObject:albumArt forKey:MPMediaItemPropertyArtwork];
	    }

        [songInfo setObject:artist forKey:MPMediaItemPropertyArtist];
        [songInfo setObject:title forKey:MPMediaItemPropertyTitle];
        [songInfo setObject:albumTitle forKey:MPMediaItemPropertyAlbumTitle];

        [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:songInfo];
    }
}

-(void)clearNowPlayingInfo:(id)args
{
    // NowPlaying画面の情報をクリア
    Class playingInfoCenter = NSClassFromString(@"MPNowPlayingInfoCenter");
    if (playingInfoCenter) {
        [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:nil];
    }
}

#pragma mark -
#pragma mark Nofification Handler

-(void)remoteControlEvent:(NSNotification *)notification
{
    UIEvent *event = [[notification userInfo] objectForKey:@"event"];    
    NSDictionary *e = [NSDictionary dictionaryWithObject:NUMINT(event.subtype) forKey:@"subtype"];
    [self fireEvent:@"remotecontrol" withObject:e];
}

@end
