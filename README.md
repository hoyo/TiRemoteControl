TiRemoteControl
====

This module makes your titanium applications to extend AV-related functions of iOS.

- You can handle events of earphone's remote-control. (play, pause, nextTrack and so on.)
- You can show some information of playing track to a locked screen and etc.

- Update : Added albumArtwork (using URL) to lockscreen info. (@Kosso)

How to Use
----

```javascript
var Control = require('net.hoyohoyo.tiremotecontrol');

Control.setNowPlayingInfo({
  artist: 'someone',
  title: 'Happy Birthday to You',
  albumTitle: 'unknown',
  albumArtworkLocal: true,                          // true for LOCAL IMAGE false for REMOTE IMAGE
  albumArtwork : 'appicon.png',                     // LOCAL IMAGE - Image Name (eg: 'appicon.png') inside resources folder 
                                                    // REMOTE IMAGE - URL (eg: http://an.image.url)
});

Control.addEventListener('remotecontrol', function(e) {
  Ti.API.debug('remote control event was fired!');
  switch (e.subtype) {
    case Control.REMOTE_CONTROL_PLAY:
      break;
    case Control.REMOTE_CONTROL_PAUSE:
      break;
    case Control.REMOTE_CONTROL_STOP:
      break;
    case Control.REMOTE_CONTROL_PLAY_PAUSE:
      break;
    case Control.REMOTE_CONTROL_PREV:
      break;
    case Control.REMOTE_CONTROL_NEXT:
      break;
  }
});
```
