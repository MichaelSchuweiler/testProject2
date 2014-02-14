class window.gpaCollection extends Backbone.Collection
  model: window.GPA
  url: '/gpas'

#the "window" namespacing is convinient and fixes a bug where compiled coffeescript hid the classes from the page