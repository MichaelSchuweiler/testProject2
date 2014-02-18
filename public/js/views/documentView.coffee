class window.documentView extends Backbone.View
  tagName: 'div'
  template: _.template $('#class-template').html() #_.template is a function that takes a JSON object and returns html

  events:
    'click button.CalcGPA': 'findGPA'

  initialize: ->
    @render()

  render: ->
    @$el.html @template() #this.el is what we defined in tagName. use $el to get access to jQuery html() function
