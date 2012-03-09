Spine = require('spine')

#Spine.Model.host = "http://localhost:5000"

class Image extends Spine.Model
  # Configure name & attributes
  @configure 'Image', 'title', 'description'

  #@extend Spine.Model.Ajax
  @extend @Local

module.exports = Image
