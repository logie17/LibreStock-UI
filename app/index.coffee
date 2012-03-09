require('lib/setup')

Spine    = require('spine')
Libre = require('controllers/libre')

class App extends Spine.Controller
  constructor: ->
    super
    @libre = new Libre
    @append @libre

    Spine.Route.setup()

module.exports = App
