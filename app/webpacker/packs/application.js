// Assets
require.context('../src/fonts', true, /\.(svg|eot|ttf|woff|woff2)$/i);
require.context('../src/images', true, /\.(gif|jpg|jpeg|png)$/i);

// Javacript
import '../src/javascripts/_base'
import '../src/javascripts/_boards'
import 'channels'

// CSS
import '../src/stylesheets/application'
