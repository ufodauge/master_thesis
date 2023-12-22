#import "empty.typ" : Empty

#let HeadingWrapper(
  body
) = [
  #body

  #Empty
]

#let H1(
  body,
  inset: (
    top   : 54pt,
    bottom: 49pt,
    left  : 1pt,
  )
) = HeadingWrapper(
  block(
    inset: inset,
    text(
      size  : 24pt,
      strong(body)
    )
  )
)

#let H2(body, inset: 0pt) = HeadingWrapper(
  block(
    inset: inset,
    text(
      size  : 16pt,
      strong(body)
    )
  )
)

#let H3-6(body, inset: 0pt) = HeadingWrapper(
  block(
    inset: inset,
    text(
      size  : 14pt,
      strong(body)
    )
  )
)

