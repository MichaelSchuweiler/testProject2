###
Created by mart2967 on 1/30/14.
###
class window.ClassesCollectionView extends Backbone.View
  initialize: ->
    @render()

  render: ->
    _.each @collection.models, ((item) ->
      view = new ClassesView(model: item)
      @$el.append view.el
      return
    ), this
    this
    # returning itself for chaining calls. syntax bears futher investigation