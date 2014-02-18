Section = require('../schemas/schemas').Section


# Populate the database if there are no records
Section.count({},(err, c) ->
  console.log err if err
  if c == 0
    console.log 'Populating database'
    populateDB()
)

exports.findAll = (req, res) ->
  Section.find (err, items) ->
    console.log("Calling findAll")
    res.send items


exports.create = (req, res) ->
  newSection = new Section req.body
  console.log 'created section ' + newSection.title
  newSection.save()
  res.send()

exports.getById = (req, res) ->
  id = req.route.params['id']
  Section.findById id, (err, result) ->
    res.send result

exports.edit = (req, res) ->
  section = req.body
  delete section._id
  #console.log req
  id = req.params.id
  Section.update({ _id: id }, { $set: section }, (err, numAffected, raw) ->
    console.log err if err
    console.log 'The number of updated documents was %d', numAffected
    #console.log 'The raw response from Mongo was ', raw
    res.send(section)
  )

populateDB = ->
  sections = [
    {
      title: 'First Class'
      grade: "A"
      credits: "0"
    },
    {
      title: 'Second Class'
      grade: "A"
      credits: "0"
    },
    {
      title: 'Third Class'
      grade: "A"
      credits: "0"
    },
    {
      title: 'Fourth Class'
      grade: "A"
      credits: "0"
    }

  ]

  createAndAdd section for section in sections


createAndAdd = (sec)->
  newSection = new Section(sec)
  newSection.save()
