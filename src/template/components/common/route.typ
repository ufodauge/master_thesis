#let Route(
  font       : "Harano Aji Mincho",
  font-strong: "Harano Aji Gothic",
  body
) = [
  #show regex("、"): "，"
  #show regex("。"): "．"

  #set page(
    paper : "a4",
    margin: (
      bottom: 119.077pt,
      top   : 108.5pt,
      left  : 82.5pt,
      right : 88.5pt,
    )
  )

  #set text(font: font, size: 12pt)

  #show strong: set text(
    weight: "extralight",
    font  : font-strong,
  )

  #set par(
    first-line-indent: 1em,
    justify          : true
  )

  #body
]