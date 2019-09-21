import consumer from './consumer'

$(document).ready(function() {
  create_board_subscription({
    'channel':   'BoardsNotificationsChannel',
    'append_to': '.notifications'
  });
});
