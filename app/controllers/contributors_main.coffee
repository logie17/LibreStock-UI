Spine   = require('spine')
Contributor = require('models/contributor')
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
    @html require('views/contributor_show')(@item)

  change: (params) =>
    @item = Contributor.find(params.id)
    @render()

  edit: ->
    # Navigate to the 'edit' view whenever
    # the edit link is clicked
    @navigate('/contributors', @item.id, 'edit')

class Edit extends Spine.Controller
  className: 'edit'

  events:
    'submit form': 'submit'
    'click .save': 'submit'
    'click .delete': 'delete'

  elements: 
    'form': 'form'

  constructor: ->
    super
    @active @change

  render: ->
    @html require('views/contributor_form')(@item)

  change: (params) =>
    @item = Contributor.find(params.id)
    @render()

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(@form).save()
    @navigate('/contributors', @item.id)

  delete: ->
    @item.destroy() if confirm('Are you sure?')

class Main extends Spine.Stack
  controllers:
    show: Show
    edit: Edit

module.exports = Main

