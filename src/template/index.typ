#import "utils/theorems.typ": *

#import "components/cover-section/index.typ": CoverSection
#import "components/intro-section/index.typ": IntroSection
#import "components/main-section/index.typ" : MainSection
#import "components/common/route.typ"       : Route

#let template(
  title          : "卒業論文、修士論文のタイトル",
  student-number : "22MM305",
  author         : "安楽岡 花火",
  mentor         : "皆川 茜",
  mentor-post    : "教授",
  laboratry      : "鐘井研究室",
  font           : "Harano Aji Mincho",
  font-strong    : "Harano Aji Gothic",
  date           : datetime.today(),
  abstract       : [],
  acknowledgement: [],
  references     : none,
  body
) = Route(
  font       : font,
  font-strong: font-strong,
  [
    #CoverSection(
      title         : title,
      student-number: student-number,
      mentor        : mentor,
      mentor-post   : mentor-post,
      date          : date,
      author        : author,
      laboratry     : laboratry,
    )

    #IntroSection(
      abstract       : abstract,
      acknowledgement: acknowledgement,
    )

    #MainSection(
      references: references,
      body
    )
  ]
)