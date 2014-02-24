mongoose = require 'mongoose'
Schema = mongoose.Schema


Classes = new Schema(
  htmlId: String
  credit: String
  grade: String
  title: String



)

GPA = new Schema(
  title: String
  Grade: Array
  Credit: Array
  finalGPA: String
  htmlId: String
  body: String
)

Classes = mongoose.model 'Classes', Classes
GPA = mongoose.model 'GPA', GPA

module.exports =
  Classes : Classes
  GPA : GPA
