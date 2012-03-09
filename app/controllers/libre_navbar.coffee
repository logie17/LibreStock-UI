Spine   = require('spine')
Contributor = require('models/contributor')
List    = require('spine/lib/list')
$       = Spine.$

class Navbar extends Spine.Controller
  className: 'libre_navbar'

  elements:
    '.items': 'items'
    'input[type=search]': 'search'

  events:
    'keyup input[type=search]': 'filter'
    'click .navbar #contributor': 'create'

  constructor: ->
    super
    # Render initial view
    @html require('views/libre_navbar')()

    # Setup a Spine List
    #@list = new List
    #  el: @items, 
    #  template: require('views/item'), 
    #  selectFirst: true

    #@list.bind 'change', @change

    #@active (params) -> 
    #  @list.change(Contributor.find(params.id))

    #Contributor.bind('refresh change', @render)

  filter: ->
    @query = @search.val()
    @render()

  render: =>
    #contributors = Contributor.filter(@query)
    #@list.render(contributors)

  change: (item) =>
    @navigate '/contributors', item.id

  create: ->
    item = Contributor.create()
    @navigate('/contributors', item.id, 'edit')

module.exports = Navbar
