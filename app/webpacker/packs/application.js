
// Rails essentials
import Rails from "rails-ujs"; Rails.start()
import Turbolinks from "turbolinks"; Turbolinks.start()
import "channels"

// ES6 polyfills
import "core-js/stable"
import "regenerator-runtime/runtime"

// Libraries
//   NOTE: jQuery is already loaded via "config/webpack/environment.js". Otherwise, any pack depending on it would have to import it explicitly.
import "bootstrap/dist/js/bootstrap"

// App
import "../src/javascripts/common"
