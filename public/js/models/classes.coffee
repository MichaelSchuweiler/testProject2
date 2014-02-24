  class window.Classes extends Backbone.Model
    urlRoot: '/classes'
    idAttribute: '_id' #conforming to mongodb id syntax
    initialize: ->
      console.log 'Initializing a Class'

    defaults:
      htmlId: '#'
      credit: '0'
      grade: 'A'
      title: 'Class'




