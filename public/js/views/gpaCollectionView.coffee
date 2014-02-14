class window.gpaCollectionView extends Backbone.View
  initialize: ->
    @render()

  render: ->
    _.each @collection.models, ((item) ->
      view = new gpaView(model: item)
      @$el.append view.el
      return
    ), this
    this
# returning itself for chaining calls. syntax bears futher investigation