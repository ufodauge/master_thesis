#import "../common/page.typ"   : Page
#import "../common/heading.typ": H1, H2, H3-6

#import "../../constants/page.typ": PAGE_NUMBERING_MAIN

#let MainSection(
  references: none,
  body
) = [
  #set page(numbering: PAGE_NUMBERING_MAIN)
  #counter(page).update(1)
  
  #let NUMBERING_H1   = "第1章"
  #let NUMBERING_H2-6 = "1.1"

  #set heading(numbering: NUMBERING_H2-6)

  #let HeadingTemplate(numbering-format, it) = [
    #let loc     = it.location()
    #let indexes = counter(heading).at(loc)
    
    #numbering(numbering-format, ..indexes)
    #h(1em)
    #it.body
  ]

  #let isHeading(cts, level: none) = {
    return cts.func() == heading and (
      level == none or cts.at("level") == level
    )
  }

  #show heading                : it => H3-6(HeadingTemplate(NUMBERING_H2-6, it))
  #show heading.where(level: 1): it => H1(
    HeadingTemplate(NUMBERING_H1, it),
  )
  #show heading.where(level: 2): it => H2(
    HeadingTemplate(NUMBERING_H2-6, it),
    inset: (
      left  : 2pt,
      bottom: 12pt
    )
  )

  #set math.equation(
    supplement: [式],
    numbering : (_) => {
      locate(loc => {
        let chapter = counter(heading).at(loc).first()
        let index   = counter(math.equation).at(loc).first()
        
        return numbering("(1.1)", chapter, index)
      })
    }
  )

  #show figure: it => align(center, [
    #let loc     = it.location()
    #let chapter = counter(heading).at(loc).first()
    #let index   = it.counter.at(loc).first()

    #if it.kind == image {
      block[
        #it.body
        
        図
        #numbering("1.1: ", chapter, index)
        #it.caption.body
      ]
    } else if it.kind == table {
      block[      
        表
        #numbering("1.1: ", chapter, index)
        #it.caption.body
        
        #it.body
      ]
    } else {
      it
    }
  ])
  
  #let pages = body.fields().children.fold((), (acc, cts) => {
    if isHeading(cts, level: 1) {
      acc.push(([
        #set heading(numbering: NUMBERING_H1)
        #cts
      ],))
    } else if acc.len() > 0{
      if isHeading(cts, level: 2) {
        acc.last().push(cts)
      } else {
        // いいんだこれ
        acc.last().last() += cts
      }
    }

    return acc
  }).map((cts) => Page([
    #counter(figure.where(kind: table)).update(0)
    #counter(figure.where(kind: image)).update(0)

    #cts.first()

    #v(-2pt)

    #cts.slice(1).fold([], (acc, v) => acc + block(
      inset: (
        top   : 6pt,
        bottom: 24pt,
      ),
      v
    ))
  ]))
  
  #for pg in pages [
    #pg
  ]

  #Page[
    #set bibliography(title: "参考文献")
    #show heading.where(level: 1): it => H1(it.body)

    #references
  ]
]
