#import "@preview/oxifmt:0.2.0" : strfmt

#import "../common/page.typ"   : Page
#import "paper-code.typ"       : PaperCode

#import "../../utils/date.typ"                : toJapaneseCalendar
#import "../../utils/parse-student-number.typ": parseStudentNumber

#let CoverSection(
  student-number: "00MM000",
  title         : "タイトル",
  mentor        : "◯◯ ◯◯",
  mentor-post   : "教授",
  date          : datetime.today(),
  author        : "◯◯ ◯◯",
  laboratry     : "◯◯研究室",
) = Page[
  // Paper code
  #align(right, [
    #PaperCode(
      parseStudentNumber(student-number)
    )
  ]),

  // Main text
  #align(center,
    [
      #set text(size: 16.5pt)
      
      #v(1.6em)

      #title

      #v(2.5em)

      指導教員 #h(2.3em) #mentor#mentor-post

      #v(2.48em)

      #toJapaneseCalendar(date) 提出

      #v(1.8em)

      理工学研究科 数理電子情報系専攻 \
      情報システム工学コース

      #v(3.9em)

      #student-number \
      #author

      #v(3.4em)
      
      埼玉大学 理工学研究科・工学部 \
      #laboratry \
      埼玉県さいたま市桜区下大久保255
    ]
  )
]

