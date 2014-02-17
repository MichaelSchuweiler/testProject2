###
Created by mart2967 on 1/30/14.
###

class AppRouter extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    sectionList = new window.SectionCollection()
    gpaList = new window.gpaCollection()

    gpaList.fetch success: ->
      $('#contentGPA').html new window.gpaCollectionView(collection: gpaList).$el
      $('#bs-example-navbar-collapse-1').html new window.NavbarView(collection: gpaList).$el
      return

    sectionList.fetch success: ->
      $('#content').html new window.SectionCollectionView(collection: sectionList).$el
      $('#bs-example-navbar-collapse-1').html new window.NavbarView(collection: sectionList).$el
      return

    return


app = new AppRouter()
Backbone.history.start pushState: true
