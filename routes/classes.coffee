Classes = require('../schemas/schemas').Classes


# Populate the database if there are no records
Classes.count({},(err, c) ->
  console.log err if err
  if c == 0
    console.log 'Populating database'
    populateDB()
)

exports.findAll = (req, res) ->
  Classes.find (err, items) ->
    console.log("Calling findAll")
    res.send items


exports.create = (req, res) ->
  newClasses = new Classes req.body
  console.log 'created  ' + newClasses.title
  newClasses.save()
  res.send()

exports.getById = (req, res) ->
  id = req.route.params['id']
  Classes.findById id, (err, result) ->
    res.send result

exports.edit = (req, res) ->
  classes = req.body
  delete classes._id
  #console.log req
  id = req.params.id
  Classes.update({ _id: id }, { $set: classes }, (err, numAffected, raw) ->
    console.log err if err
    console.log 'The number of updated documents was %d', numAffected
    #console.log 'The raw response from Mongo was ', raw
    res.send(classes)
  )

populateDB = ->
  classesArray = [
    {
      title: 'Class'
      grade: "A"
      credit: "0"
    },
    {
      title: 'Class'
      grade: "A"
      credit: "0"
    },
    {
      title: 'Class'
      grade: "A"
      credit: "0"
    },
    {
      title: 'Class'
      grade: "A"
      credit: "0"
    }

  ]

  createAndAdd classes for classes in classesArray


createAndAdd = (sec)->
  newClasses = new Classes(sec)
  newClasses.save()
