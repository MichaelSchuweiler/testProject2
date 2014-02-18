
class window.documentView extends Backbone.View

  tagName: 'div'
  template: _.template $('#class-template').html() #_.template is a function that takes a JSON object and returns html

  events:
    'click button.CalcGPA': 'findGPA'

  initialize: ->
    @render()

  render: ->
    @$el.html @template() #this.el is what we defined in tagName. use $el to get access to jQuery html() function

  findGPA: ->
    $(document).ready ->
      $("#content").hide()
      $("#dropdown").change ->
        if document.getElementById("dropdown").value is "GPA"
          $("#content").hide()
          $("#contentGPA").show()
        else
          $("#contentGPA").hide()
          $("#content").show()
        return
    $("#CalcGPA").click ->
    gradeArray = [
        document.getElementById("Grades1").value
        document.getElementById("Grades2").value
        document.getElementById("Grades3").value
        document.getElementById("Grades4").value
      ]
    creditArray = [
      document.getElementById("Credits1").value
      document.getElementById("Credits2").value
      document.getElementById("Credits3").value
      document.getElementById("Credits4").value
    ]
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
