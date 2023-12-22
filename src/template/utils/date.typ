#let toJapaneseCalendar(date) = {
  assert(type(date) == "datetime")

  let year  = str(date.year() - 2018)
  let month = str(date.month())
  let date  = str(date.day())

  return "令和" + year + "年" + month + "月" + date + "日"
}
