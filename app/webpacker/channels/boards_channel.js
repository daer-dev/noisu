import consumer from "./consumer"

// We iterate all present boards and its broadcast values so we can subscribe only to their channels later.
var available_boards = [];
$.each($('.board'), function(i, board) {
  $.each($(board).attr('data-broadcast').split(' '), function(ii, board_broadcast) {
    if(!available_boards.includes(board_broadcast)) { available_boards.push(board_broadcast); }
  });
});

$.each(available_boards, function(i, board_id) {
  consumer.subscriptions.create({
    channel: 'BoardsChannel',
    room:    board_id
  }, {
    connected() {
      console.log('Yay, connected to board -' + board_id + '-!');
    },

    disconnected() {
      console.log('Ooops, disconnected from board -' + board_id + '-...');
    },

    received(data) {
      this.appendLine(data);
    },

    appendLine(data) {
      var html = this.createLine(data);
      $('[data-broadcast~="' + board_id + '"]').append(html);
    },

    createLine(data) {
      var result_html     = $('#dummy_note').html();
      var dummy_note_data = $.parseJSON($('#dummy_note').attr('data-dummy-note-data'));

      $.each(dummy_note_data, function(field_name, replace_var) {
        result_html = result_html.replace(replace_var, data[field_name]);
      });

      return result_html;
    }
  })
});
