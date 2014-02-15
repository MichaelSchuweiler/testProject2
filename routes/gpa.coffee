GPA = require('../schemas/schemas').GPA


# Populate the database if there are no records
GPA.count({},(err, c) ->
  console.log err if err
  if c == 0
    console.log 'Populating database'
    populateDB()
)


exports.findAllGPA = (req, res) ->
  GPA.find (err, items) ->
    console.log("Calling findAllGPA")
    res.send items

exports.create = (req, res) ->
  newGPA = new GPA req.body
  console.log 'created section ' + newGPA.title
  newGPA.save()
  res.send()


exports.getByIdGPA = (req, res) ->
  id = req.route.params['id']
  GPA.findById id, (err, result) ->
    res.send result

exports.edit = (req, res) ->
  gpa = req.body
  delete gpa._id
  #console.log req
  id = req.params.id
  GPA.update({ _id: id }, { $set: gpa }, (err, numAffected, raw) ->
    console.log err if err
    console.log 'The number of updated documents was %d', numAffected
    #console.log 'The raw response from Mongo was ', raw
    res.send(gpa)
  )

populateDB = ->
  GPAS = [
    {
      title: 'GPA Test'
      Grade: ['f']
      Credit: ['-5']
      finalGPA: '0.01'
    }
  ]

  createAndAddGPA gpa for gpa in GPAS

createAndAddGPA = (gpa) ->
  console.log("Adding GPA")
  newGPA = new GPA(gpa)
  newGPA.save()