class window.gpaView extends Backbone.View
  tagName: 'div'
  template: _.template $('#gpa-template').html() #_.template is a function that takes a JSON object and returns html
  editTemplate: _.template $('#gpa-edit-template').html()
  events:
    'change': 'change'
    'click button.edit': 'editGpa'
    'click button.save': 'saveGpa'
    'click button.CalcGPA': 'findGPA'


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


  editGpa: ->
    # set the html of the view to the editing template
    @$el.html @editTemplate(@model.toJSON())
    this

  saveGpa: ->


    #save all changes made to the model back to the database
    console.log 'saving...'
    @model.save {},
      success: ->
        console.log 'saved'
      error: ->
        console.log 'error'
    @render()

  findGPA: ->
    console.log("Something Usefulllll")