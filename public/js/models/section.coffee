  class window.Section extends Backbone.Model
    urlRoot: '/sections'
    idAttribute: '_id' #conforming to mongodb id syntax
    initialize: ->
      console.log 'Initializing a Section'

    defaults:
      title: 'Additional Class'
      Grade: 'A'
      Credit: '0'
      htmlId: '#'
