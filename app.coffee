#/home/mart2967/mongodb/bin/mongod --dbpath ~/WebstormProjects/testProject2/db/ --smallfiles
express = require 'express'
routes = require './routes'
section = require './routes/section'
gpa = require './routes/gpa'
http = require 'http'
path = require 'path'
mongoose = require 'mongoose'
gpaCalculator = require './routes/gpaCalculator'
#models = require './schemas/schemas'
app = express()

#connect to database
# ./mongodb/bin/mongod --dbpath ~/WebstormProjects/testProject2/db/
mongoose.connect 'mongodb://localhost/test'
db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error:')
db.once 'open', ->
  console.log 'DB connection opened'


#nodeInfo = new models.Section {title: 'Node.js', link: 'http://nodejs.org/', body: 'blah', category: 'main'}
#nodeInfo.save()


#set main layout
app.set 'layout', 'layouts/main'
#expose templates to all views
app.set 'partials',
  head: 'partials/head',
  navbar: 'partials/navbar',
  scripts: 'partials/scripts'

app.engine 'html', require('hogan-express')
app.enable 'view cache'
app.configure ->
  app.set 'port', process.env.PORT or 3000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'html'
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.json()
  app.use express.urlencoded()
  app.use express.methodOverride()
  app.use express.cookieParser('your secret here')
  app.use express.session()
  app.use app.router

  #app.use(require('less-middleware')({ src: __dirname + '/public' }));
  app.use express.static(path.join(__dirname, 'public'))
  app.use express.static(path.join(__dirname, 'bower_components'))

app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', routes.index
app.get '/sections/:id', section.getById
app.post '/sections', section.create
app.get '/sections', section.findAll
app.put '/sections/:id', section.edit

#In theory these initialize and show the GPA data type held in the database. Right now it is a little messed up.
app.get '/gpa', routes.index
app.get '/gpa/:id', gpa.getByIdGPA
app.post '/gpa', gpa.create
app.get '/gpas', gpa.findAllGPA
app.put '/gpa/:id', gpa.edit



#Hopefully this will make the gpaCalculator accesesible.
app.get '/gpaCalculator', gpaCalculator.gpaResponse
app.post '/gpaCalculator', gpaCalculator.gpaPostResponse

http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')
