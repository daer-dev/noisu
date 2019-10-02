import { createBoardSubscription } from './../src/javascripts/boards/channels'

$(document).ready(function() {
  createBoardSubscription({
    'channel':   'BoardsNotesChannel',
    'append_to': '.notes'
  });
});
