  class window.Section extends Backbone.Model
    urlRoot: '/sections'
    idAttribute: '_id' #conforming to mongodb id syntax
    initialize: ->
      console.log 'Initializing a Section'

    defaults:
      title: 'Class'
      grade: 'A'
      credit: '0'
      htmlId: '#'
