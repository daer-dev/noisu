const { environment } = require('@rails/webpacker')
const erb =  require('./loaders/erb')
const webpack         = require('webpack')

// Makes the following consts available EVERYWHERE, in packs and JS source files.
environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $:      'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: [ 'popper.js', 'default' ]
  })
)

// ERB support.
environment.loaders.prepend('erb', erb)

module.exports = environment
