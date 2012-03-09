Spine       = require('spine')
Contributor = require('models/contributor')
$           = Spine.$

Contributors    = require('controllers/contributors_main')
Navbar           = require('controllers/libre_navbar')

class Libre extends Spine.Controller
  className: 'libre'

  constructor: ->
    super

    @navbar         = new Navbar
    @contributors   = new Contributors

    @routes
      '/contributors/:id/edit': (params) -> 
        @navbar.active(params)
        @contributors.edit.active(params)
      '/contributors/:id': (params) ->
        @navbar.active(params)
        @contributors.show.active(params)

    @append @navbar, @contributors

    Contributor.fetch()

module.exports = Libre
