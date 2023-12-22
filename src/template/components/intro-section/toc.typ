#import "../../constants/page.typ": *
#import "../common/page.typ"      : Page

// #let 

#let TocPage() = locate(loc => [
  #let headings = query(heading.where(outlined: true), loc)

  #let lines = headings.fold(( 
    lines: (), 
    options: ( latest_chapter: none )
  ), (( lines, options ), head) => [
    #let head_loc       = head.location()
    #let head_numbers   = counter(heading).at(head_loc)
    #let head_numbering = head.at("numbering")
    #let head_level     = head.at("level")

    #let chapter_number = head_numbers.first()

    #if lines.len() > 0 and head_level == 1 {
      lines.push(v(13pt))
    }

    #let indent = if head_level == 1 {
      0pt
    } else if head_level == 2 {
      18pt
    } else {
      46pt
    }

    #let chapter_name = [
      #let chapter = if head_numbering != none {
        numbering(
          head_numbering,
          ..head_numbers
        ) + h(1em)
      } else {
        none
      }

      #let chapter_body = [
        #chapter
        #head.body
      ]

      #if head_level == 1 {
        strong(chapter_body)
      } else {
        chapter_body
      }
    ]

    #let chapter_body = if head_level != 1 {
      box(width: 1fr, repeat(box(inset: (x: 0.25em), ".")))
    }

    #let is_before_main_section = query(
      heading
        .where(level: 1)
        .after(head_loc),
      head_loc
    ).any(x => x.body == [表目次])
    #let page_numbering = if is_before_main_section { 
      PAGE_NUMBERING_INTRO
    } else {
      PAGE_NUMBERING_MAIN
    }

    #let page_number = counter(page).at(head_loc).first()
    #let page_name   = numbering(
      page_numbering,
      page_number
    )

    #lines.push(
      grid(
        columns: (indent, 1fr, 10pt, 18pt),
        none,
        [
          #chapter_name
          #h(1em)
          #chapter_body
        ],
        none,
        align(right)[
          #page_name
        ]
      )
    )

    #return (lines, options)
  ]).first()

  #Page[
    #set heading(outlined: false)
    = 目次

    #for line in lines [
      #line
    ]
  ]

])
