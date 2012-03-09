Spine   = require('spine')
Image = require('models/image')
$       = Spine.$

class Show extends Spine.Controller
  # Set the HTML class
  className: 'show'

  events:
    'click .edit': 'edit'

  constructor: ->
    super

    # Bind the change() callback
    # to the *active* event
    @active @change

  render: ->
    # Render a template, replacing the 
    # controller's HTML
    @html require('views/contributor_image_show')(@item)

  change: (params) =>
    @item = Image.find(params.id)
    @render()

  edit: ->
    # Navigate to the 'edit' view whenever
    # the edit link is clicked
    @navigate('/images', @item.id, 'edit')

class Edit extends Spine.Controller
  className: 'edit'

  events:
    'submit form': 'submit'
    'click .save': 'submit'
    'click .delete': 'delete'
    'change input[type=file]': 'upload'

  elements: 
    'form': 'form'

  constructor: ->
    super
    @html require('views/contributor_image_form')
    @active @change

  render: ->
    @html require('views/contributor_image_form')(@item)

  change: (params) =>
    @item = Image.find(params.id)
    @render()

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(@form).save()
    @navigate('/images', @item.id)

  delete: ->
    @item.destroy() if confirm('Are you sure?')

  upload: (e) ->
    item = jQuery(e.target)
    item.filedrop
      paramname:'pic'
      maxfiles: 5,
      
      
class Images extends Spine.Stack
  controllers:
    show: Show
    edit: Edit

module.exports = Images

