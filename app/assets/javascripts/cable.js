// FIXME/TODO: ActionCable is still Sprockets' dependent, but it'll be migrated to Webpack once Rails 6 is launched.

//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();
}).call(this);
