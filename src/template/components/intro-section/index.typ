#import "toc-figure.typ": TocFigurePage
#import "toc.typ"       : TocPage

#import "../common/page.typ"   : Page
#import "../common/heading.typ": H1

#import "../../constants/page.typ": PAGE_NUMBERING_INTRO

#let IntroSection(
  abstract       : [],
  acknowledgement: [],
) = [
  #set page(numbering: PAGE_NUMBERING_INTRO)
  #counter(page).update(1)
  
  #show heading: it => [
    #panic("Headings in the Abstract and Acknowledgements section are not defined.")
  ]
  #show heading.where(level: 1): it => H1(it.body)

  #Page[
    = 概要

    #abstract
  ]
  
  #Page[
    = 謝辞

    #acknowledgement
  ]
  
  #TocPage()

  #TocFigurePage(
    title : "図目次",
    target: image,
  )

  #TocFigurePage(
    title : "表目次",
    target: table,
  )
]