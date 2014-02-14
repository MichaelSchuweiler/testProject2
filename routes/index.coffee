
exports.index = (req, res) ->
  res.locals = {
    title: 'SoupBase',
    description: 'An example of one way to build a powerful soup. Chicken Noodle Soup'
  }
  res.render 'index'

