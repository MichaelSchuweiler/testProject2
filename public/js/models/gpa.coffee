class window.GPA extends Backbone.Model
  urlRoot: '/gpa'
  idAttribute: '_id' #conforming to mongodb id syntax
  initialize: ->
    console.log 'Initializing GPA'

  defaults:
    title: "GPA Entry"
    Grade: ['A']
    Credit: ['0']
    finalGPA: 'You do not have a GPA'
    htmlId: "#"
