const { environment } = require('@rails/webpacker')
const webpack         = require('webpack')

// Makes the following consts available EVERYWHERE in your JS.
environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $:      'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: [ 'popper.js', 'default' ]
  })
)

module.exports = environment
