Spine = require('spine')

#Spine.Model.host = "http://localhost:5000"

class Contributor extends Spine.Model
  # Configure name & attributes
  @configure 'Contributor', 'name', 'email'

  #@extend Spine.Model.Ajax
  @extend @Local

  @filter: (query) ->
    return @all() unless query
    query = query.toLowerCase()
    @select (item) ->
      item.name?.toLowerCase().indexOf(query) isnt -1 or
        item.email?.toLowerCase().indexOf(query) isnt -1

module.exports = Contributor
