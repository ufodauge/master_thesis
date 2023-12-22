#import "@preview/oxifmt:0.2.0": strfmt
#import "../common/page.typ"   : Page

#let TocFigurePage(title: "図目次", target: image) = locate(loc => [
  #let images = query(figure.where(outlined: true, kind: target), loc)

  #let lines = images.fold((
    lines  : (),
    options: ( latest_chapter: none )
  ), (( lines, options ), image) => [
    #let img_loc    = image.location()
    #let chapter    = counter(heading).at(img_loc).first()
    #let index      = image.counter.at(img_loc).first()
    #let page_index = counter(page).at(image.location()).first()

    #if (options.latest_chapter == none) {
      options.latest_chapter = chapter
    }

    #if (options.latest_chapter != chapter) {
      lines.push(v(10pt))
    }

    #lines.push(
      grid(
        columns: (18pt, 28pt, 1fr, 10pt, 18pt),
        none,
        [
          #strfmt("{}.{}", chapter, index)
        ],
        [
          #image.caption.body
          #h(1em)
          #box(width: 1fr, repeat(box(inset: (x: 0.25em), ".")))
        ],
        none,
        align(right)[
          #page_index
        ]
      )
    )

    #return (lines, options)
  ]).first()

  #Page[
    = #title

    #for line in lines [
      #line
    ]
  ]
])
