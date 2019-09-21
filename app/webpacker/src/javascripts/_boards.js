function create_board_subscription(args) {
  $.each(get_page_boards_broadcasts(), function(i, broadcast) {
    consumer.subscriptions.create({
      channel:   args['channel'],
      broadcast: broadcast
    }, {
      connected() {
        console.log('[' + args['channel'] + '] Yay! Connected to the "' + broadcast + '" broadcast!');
      },

      disconnected() {
        console.log('[' + args['channel'] + '] Ooops... disconnected from the "' + broadcast + '" broadcast...');
      },

      received(data) {
        console.log('[' + args['channel'] + '] Data received! ' + JSON.stringify(data));
        this.appendHtml(data['html']);
      },

      appendHtml(html) {
        $('.board[data-broadcast~="' + broadcast + '"] ' + args['append_to']).append(html);
      }
    })
  });
}

function get_page_boards_broadcasts() {
  var page_broadcast = [];

  // We iterate all present boards and its broadcast values so we can subscribe only to their channels later.
  $.each($('.board'), function(i, board) {
    $.each($(board).attr('data-broadcast').split(' '), function(ii, board_broadcast) {
      if(page_broadcast.includes(board_broadcast)) { page_broadcast.push(board_broadcast); }
    });
  });

  return page_broadcast;
}
