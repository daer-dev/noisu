import { createBoardSubscription } from './../src/javascripts/boards/channels'

$(document).ready(function() {
  createBoardSubscription({
    'channel':   'BoardsNotificationsChannel',
    'append_to': '.notifications'
  });
});
