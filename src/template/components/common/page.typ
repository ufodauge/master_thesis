#let pbWithOutFirst = state("first-page-rendered", none)

#let Page(
  body
) = [
  #pbWithOutFirst.display()
  #pbWithOutFirst.update(x => pagebreak())
  #body
]