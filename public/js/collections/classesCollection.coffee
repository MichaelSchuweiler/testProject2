###
Created by mart2967 on 1/30/14.
###
class window.ClassesCollection extends Backbone.Collection
  model: window.Classes
  url: '/classes'

  #the "window" namespacing is convinient and fixes a bug where compiled coffeescript hid the classes from the page