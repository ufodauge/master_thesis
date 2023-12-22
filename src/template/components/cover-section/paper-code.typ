#import "@preview/oxifmt:0.2.0" : strfmt

#let PaperCode(code) = text(
  size: 14pt,
  strfmt("ICS-{}M-{}", ..code),
)
