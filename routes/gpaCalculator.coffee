GPA = require('../schemas/schemas').GPA

formString = '<form id="GC" method="post" action="/gpaCalculator">
    <label for="Grades1">Grade:</label>
    <select id="Grades1" name="Grades1">
        <option value="A">A</option>
        <option value="A-">A-</option>
        <option value="B+">B+</option>
        <option value="B">B</option>
        <option value="B-">B-</option>
        <option value="C+">C+</option>
        <option value="C">C</option>
        <option value="C-">C-</option>
        <option value="D+">D+</option>
        <option value="D">D</option>
        <option value="D-">D-</option>
        <option value="F">F</option>
    </select>
    <label for="Credits1">Credits:</label>
    <select id="Credits1" name="Credits1">
        <option value="0.0">0</option>
        <option value="1.0">1</option>
        <option value="2.0">2</option>
        <option value="3.0">3</option>
        <option value="4.0">4</option>
        <option value="5.0">5</option>
    </select><br />
    <label for="Grades2">Grade:</label>
    <select id="Grades2" name="Grades2">
        <option value="A">A</option>
        <option value="A-">A-</option>
        <option value="B+">B+</option>
        <option value="B">B</option>
        <option value="B-">B-</option>
        <option value="C+">C+</option>
        <option value="C">C</option>
        <option value="C-">C-</option>
        <option value="D+">D+</option>
        <option value="D">D</option>
        <option value="D-">D-</option>
        <option value="F">F</option>
    </select>
    <label for="Credits2">Credits:</label>
    <select id="Credits2" name="Credits2">
        <option value="0.0">0</option>
        <option value="1.0">1</option>
        <option value="2.0">2</option>
        <option value="3.0">3</option>
        <option value="4.0">4</option>
        <option value="5.0">5</option>
    </select><br />
    <label for="Grades3">Grade:</label>
    <select id="Grades3" name="Grades3">
        <option value="A">A</option>
        <option value="A-">A-</option>
        <option value="B+">B+</option>
        <option value="B">B</option>
        <option value="B-">B-</option>
        <option value="C+">C+</option>
        <option value="C">C</option>
        <option value="C-">C-</option>
        <option value="D+">D+</option>
        <option value="D">D</option>
        <option value="D-">D-</option>
        <option value="F">F</option>
    </select>
    <label for="Credits3">Credits:</label>
    <select id="Credits3" name="Credits3">
        <option value="0.0">0</option>
        <option value="1.0">1</option>
        <option value="2.0">2</option>
        <option value="3.0">3</option>
        <option value="4.0">4</option>
        <option value="5.0">5</option>
    </select><br />
    <label for="Grades4">Grade:</label>
    <select id="Grades4" name="Grades4">
        <option value="A">A</option>
        <option value="A-">A-</option>
        <option value="B+">B+</option>
        <option value="B">B</option>
        <option value="B-">B-</option>
        <option value="C+">C+</option>
        <option value="C">C</option>
        <option value="C-">C-</option>
        <option value="D+">D+</option>
        <option value="D">D</option>
        <option value="D-">D-</option>
        <option value="F">F</option>
    </select>
    <label for="Credits4">Credits:</label>
    <select id="Credits4" name="Credits4">
        <option value="0.0">0</option>
        <option value="1.0">1</option>
        <option value="2.0">2</option>
        <option value="3.0">3</option>
        <option value="4.0">4</option>
        <option value="5.0">5</option>
    </select><br />
    <input type="submit" id="CalcGPA" value="Calculate GPA" name="Calculate GPA">
</form>'

headerStr = '<!DOCTYPE html>\n
<html>\n
<head>\n
    <title>GPA Calculator</title>\n
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />\n
</head>\n
<body>\n
<h1>GPA Calculator</h1>\n'

footerStr = '</body>\n</html>'

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

module.exports.arrayMaker= arrayMaker
module.exports.sumArray = sumArray
module.exports.calculateGPA = calculateGPA
module.exports.calculateNumGrade = calculateNumGrade

exports.gpaResponse = (req, res) ->
  res.render 'gpaCalculator'

exports.gpaPostResponse = (req, res) ->
  gradeArray = arrayMaker(req.body.Grades1,req.body.Grades2,req.body.Grades3,req.body.Grades4)
  creditArray = arrayMaker(req.body.Credits1,req.body.Credits2,req.body.Credits3,req.body.Credits4)
  finalGpa = calculateGPA(gradeArray,creditArray)
  gradeArrayString = "" + gradeArray[0]
  creditArrayString = "" + creditArray[0]
  console.log(gradeArrayString)
  gpa = new GPA({title: 'Test', Grades: gradeArray, Credits: creditArray})
  gpa.save()


  res.send headerStr + formString + '<p>Your GPA is '  + finalGpa + '</p>' + footerStr
