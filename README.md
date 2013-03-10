TiRemoteControl
====

This module makes your titanium applications to extend AV-related functions of iOS.

- You can handle events of earphone's remote-control. (play, pause, nextTrack and so on.)
- You can show some information of playing track to a locked screen and etc.


How to Use
----

```javascript
var Control = require('net.hoyohoyo.tiremotecontrol');

Control.setNowPlayingInfo({
  artist: 'someone',
  title: 'Happy Birthday to You',
  albumTitle: 'unknown'
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
