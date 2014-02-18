mongoose = require 'mongoose'
Schema = mongoose.Schema


Section = new Schema(
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

Section = mongoose.model 'Section', Section
GPA = mongoose.model 'GPA', GPA

module.exports =
  Section : Section
  GPA : GPA
