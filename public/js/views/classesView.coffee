###
Created by mart2967 on 1/30/14.
###
class window.ClassesView extends Backbone.View
  tagName: 'div'
  template: _.template $('#classes-template').html() #_.template is a function that takes a JSON object and returns html
  editTemplate: _.template $('#classes-edit-template').html()
  events:
    'change': 'change'
    'click button.edit': 'editClasses'
    'click button.save': 'saveClasses'

  # the @ essentialy means "this."
  initialize: ->
    @render()
    return

  render: ->
    @$el.html @template(@model.toJSON()) #this.el is what we defined in tagName. use $el to get access to jQuery html() function
    this

  change: (event) ->
    # when the value of the text area changes, update the model on the client
    console.log 'changed'
    change = {}
    change[event.target.name] = event.target.value #uses name attribute from html
    @model.set(change)

  editClasses: ->
    # set the html of the view to the editing template
    @$el.html @editTemplate(@model.toJSON())
    this

  saveClasses: ->
    #save all changes made to the model back to the database
    console.log 'saving...'
    @model.save {},
      success: ->
        console.log 'saved'
      error: ->
        console.log 'error'
    @render()

