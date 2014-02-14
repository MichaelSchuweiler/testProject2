mongoose = require 'mongoose'
Schema = mongoose.Schema


Section = new Schema(
  title: String
  link: String
  body: String
  category: String
  htmlId: String
)

GPA = new Schema(
  Grade: String
  Credit: String
  finalGPA: String
)

Section = mongoose.model 'Section', Section

module.exports =
  Section : Section

