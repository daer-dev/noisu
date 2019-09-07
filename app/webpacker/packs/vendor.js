// Rails essentials
import Rails from "rails-ujs"; Rails.start()
import Turbolinks from "turbolinks"; Turbolinks.start()
import "channels"

// ES6 polyfills
import "core-js/stable"
import "regenerator-runtime/runtime"

// Libraries
// NOTE: jQuery and other libs are already loaded via "config/webpack/environment.js".
//       Otherwise, any pack depending on them would have to import them explicitly.
import "bootstrap/dist/js/bootstrap"
