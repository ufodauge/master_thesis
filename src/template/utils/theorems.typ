#import "@preview/ctheorems:1.1.0": *

// theorems
#let theorem = thmbox(
  "theorem",
  "定理",
  fill: rgb("#eeffee")
)

#let corollary = thmplain(
  "corollary",
  "系",
  base    : "theorem",
  titlefmt: strong
)

#let definition = thmbox(
  "definition",
  "定義",
  inset: (
    x: 1.2em,
    top: 1em
  )
)

#let example = thmplain(
  "example",
  "例"
).with(numbering: none)

#let proof = thmplain(
  "proof",
  "証明",
  base: "theorem",
  bodyfmt: body => [#body #h(1fr) $square$],
).with(numbering: none)

