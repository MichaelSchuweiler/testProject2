
class window.documentView extends Backbone.View

  tagName: 'div'
  template: _.template $('#class-template').html() #_.template is a function that takes a JSON object and returns html

  events:
    'change #dropdown': 'dropdown'
    'click button.CalcGPA': 'findGPA'
    'click button.addClass': 'addClass'

  initialize: ->
    @render()


  render: ->
    @$el.html @template() #this.el is what we defined in tagName. use $el to get access to jQuery html() function


  dropdown: ->
        if document.getElementById("dropdown").value is "GPA"
          $("#content").hide()
          $("#contentGPA").show()
        else
          $("#contentGPA").hide()
          $("#content").show()
        return


  addClass: ->
    classes = new Classes({})
    classesList = new window.ClassesCollection()
    classes.save()
    classesList.fetch success: ->
      $('#content').html new window.ClassesCollectionView(collection: classesList).$el
      return



  findGPA: ->
    classesList = new window.ClassesCollection()
    gradeArray = []
    creditArray = []
    index = 0
    classesList.fetch success: ->
      _.each classesList.models, ((item) ->
        gradeArray[index] = (item.get('grade'))
        creditArray[index] = (item.get('credit'))
        index++
      )
      finalGpa = calculateGPA(gradeArray, creditArray)
      bodyString = "Grades: " + gradeArray + " Credits: " + creditArray + ". Your GPA is " + finalGpa
      document.getElementById("paragraph").innerHTML = "Your GPA is " + finalGpa
      gpa = new GPA(
        title: "Gpa Form"
        Grade: gradeArray
        Credit: creditArray
        finalGPA: finalGpa
        body: bodyString
      )
      gpa.save()
      gpaList = new window.gpaCollection()
      gpaList.fetch success: ->
        $('#contentGPA').html new window.gpaCollectionView(collection: gpaList).$el
        $('#bs-example-navbar-collapse-1').html new window.NavbarView(collection: gpaList).$el
    return
    return
    return

  calculateNumGrade = (grade) ->
    switch grade
      when "A" then 4.0
      when "A-" then 3.66
      when "B+" then 3.33
      when "B" then 3.0
      when "B-" then 2.66
      when "C+" then 2.33
      when "C" then 2.0
      when "C-" then 1.66
      when "D+" then 1.33
      when "D" then 1.0
      when "D-" then 0.66
      else 0

  arrayMaker = (inputs...) ->
    inputs


  sumArray = (array) ->
    sum = 0
    sum += parseFloat(number) for number in array
    sum

  calculateGPA = (gradeArray,creditArray) ->
    sum = sumArray(creditArray)
    gradeCredit = 0
    gradeCredit += creditArray[i]*calculateNumGrade(gradeArray[i]) for i in [0..creditArray.length-1]
    if sum isnt 0
      (gradeCredit/sum).toFixed(2)
    else
      "not available, add some classes."
