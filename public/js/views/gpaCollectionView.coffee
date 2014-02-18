class window.gpaCollectionView extends Backbone.View
  events:
    'change': 'add'
  initialize: ->
    @render()

  render: ->
    _.each @collection.models, ((item) ->
      view = new gpaView(model: item)
      @$el.append view.$el
      return
    ), this
    this

  add: ->
    console.log('Adding')
    @render()

# returning itself for chaining calls. syntax bears futher investigation