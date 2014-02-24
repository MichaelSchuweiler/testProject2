###
Created by mart2967 on 1/30/14.
###

class AppRouter extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    classesList = new window.ClassesCollection()
    gpaList = new window.gpaCollection()

    $('#calculator').html new window.documentView().$el

    gpaList.fetch success: ->
      $('#contentGPA').html new window.gpaCollectionView(collection: gpaList).$el
      $('#bs-example-navbar-collapse-1').html new window.NavbarView(collection: gpaList).$el

      return

    classesList.fetch success: ->
      $('#content').html new window.ClassesCollectionView(collection: classesList).$el
      return
    return

app = new AppRouter()
Backbone.history.start pushState: true
