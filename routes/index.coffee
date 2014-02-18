
exports.index = (req, res) ->
  res.locals = {
    title: 'GPA Calculator',
    description: 'Calculate your GPA!'
  }
  res.render 'index'

