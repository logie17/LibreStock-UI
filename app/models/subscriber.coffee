Spine = require('spine')

class Subscriber extends Spine.Model
  # Configure name & attributes
  @configure 'Subscriber', 'first_name', 'last_name', 'username', 'email', 'password'

  # Persist with Local Storage
  @extend @Local

  @filter: (query) ->
    return @all() unless query
    query = query.toLowerCase()
    @select (item) ->
      item.name?.toLowerCase().indexOf(query) isnt -1 or
        item.email?.toLowerCase().indexOf(query) isnt -1

module.exports = Subscriber
