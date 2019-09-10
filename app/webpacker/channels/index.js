// Loads all the channels within this directory and all its subdirectories.
// Channel files must be named "*_channel.js".

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)
