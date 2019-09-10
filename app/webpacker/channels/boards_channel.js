import consumer from "./consumer"

$(document).ready(function() {
  // We iterate all present boards and its broadcast values so we can subscribe only to their channels later.
  var present_broadcast = [];
  $.each($('.board'), function(i, board) {
    $.each($(board).attr('data-broadcast').split(' '), function(ii, board_broadcast) {
      if(!present_broadcast.includes(board_broadcast)) { present_broadcast.push(board_broadcast); }
    });
  });

  $.each(present_broadcast, function(i, broadcast) {
    consumer.subscriptions.create({
      channel:   'BoardsChannel',
      broadcast: broadcast
    }, {
      connected() {
        console.log('Yay! Connected to "' + broadcast + '"!');
      },

      disconnected() {
        console.log('Ooops... disconnected from "' + broadcast + '"...');
      },

      received(data) {
        console.log('Ready to append note with the following data: ' + JSON.stringify(data));
        this.appendLine(data);
      },

      appendLine(data) {
        var html = this.createLine(data);
        $('[data-broadcast~="' + broadcast + '"]').append(html);
      },

      createLine(data) { console.log('puesqaqui');
        var result_html     = $('#dummy_note').html(); alert(result_html);
        var dummy_note_data = $.parseJSON($('#dummy_note').attr('data-dummy-note-data'));

        $.each(dummy_note_data, function(field_name, replace_var) {
          result_html = result_html.replace(replace_var, data[field_name]);
        });

        return result_html;
      }
    })
  });
});
