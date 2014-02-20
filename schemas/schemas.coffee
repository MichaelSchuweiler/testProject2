mongoose = require 'mongoose'
Schema = mongoose.Schema


Classes = new Schema(
  title: String
  grade: String
  credit: String
  htmlId: String
)

GPA = new Schema(
  title: String
  Grade: Array
  Credit: Array
  finalGPA: String
  body: String
  htmlId: String
)

Classes = mongoose.model 'Classes', Classes
GPA = mongoose.model 'GPA', GPA

module.exports =
  Classes : Classes
  GPA : GPA
