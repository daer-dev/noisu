import consumer from './consumer'

$(document).ready(function() {
  create_board_subscription({
    'channel':   'BoardsNotesChannel',
    'append_to': '.notes'
  });
});
