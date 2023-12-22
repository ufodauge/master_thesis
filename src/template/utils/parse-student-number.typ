#let parseStudentNumber(
  student-number
) = {
  assert(type(student-number) == "string")
  assert(regex("\d{2}[a-zA-Z]{2}\d{3}") in student-number)

  return student-number.split(regex("[A-Z]{2}"))
}