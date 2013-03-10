var win = Ti.UI.createWindow();
win.open();

var Control = require('net.hoyohoyo.tiremotecontrol');

Control.setNowPlayingInfo({
  artist: 'someone',
  title: 'Happy Birthday to You',
  albumTitle: 'unknown'
});

Control.clearNowPlayingInfo();

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
