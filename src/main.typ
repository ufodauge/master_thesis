#import "@preview/algorithmic:0.1.0"
#import "@preview/ctheorems:1.1.0": *

#import "template/index.typ": template
#import algorithmic         : algorithm

#show: template.with(
  title         : "卒業論文、修士論文のタイトル",
  student-number: "22MM305",
  author        : "安楽岡 花火",
  mentor        : "山田 敏規",
  mentor-post   : "准教授",
  laboratry     : "山田研究室",
  font          : "Harano Aji Mincho",
  font-strong   : "Harano Aji Gothic",
  date          : datetime.today(),
  references    : bibliography(
    "references/index.bib"
  ),
  abstract: [
    本研究では、人工知能 (AI) を用いた新しい癌治療法の開発について検討した。具体的には、AI を用いて癌細胞の特定と分類を行い、その情報をもとに標的療法を行うという方法である。

    標的療法は、従来の化学療法や放射線療法と比較して、副作用が少なく、より効果的な治療法として期待されている。しかし、癌細胞の種類や分子構造は多様であるため、標的となる分子を特定することが難しいという課題があった。

    本研究では、AI を用いることで、この課題を解決できるのではないかと考えた。AI は、*膨大なデータからパターンを抽出することに長けている*ため、癌細胞の分子構造を特徴付けるパターンを特定することができると考えられる。

    本研究では、実際に AI を用いて癌細胞の特定と分類を行うための手法を確立した。この手法を用いて、実際に癌細胞の分子構造を特徴付けるパターンを特定することに成功した。

    In this study, we investigated the development of a new cancer treatment using artificial intelligence (AI). Specifically, we proposed a method of using AI to identify and classify cancer cells, and then using that information to perform targeted therapy.

    Targeted therapy is a promising treatment that is less likely to cause side effects than traditional chemotherapy or radiation therapy. However, cancer cells are diverse in their types and molecular structures, making it difficult to identify target molecules.

    In this study, we hypothesized that AI could be used to address this challenge. AI is *good at extracting patterns from large amounts of data*, so we thought it could be used to identify patterns that characterize the molecular structure of cancer cells.

    In this study, we established a method for using AI to identify and classify cancer cells. Using this method, we successfully identified patterns that characterize the molecular structure of cancer cells.

    (written by Google Bard)
  ],
  acknowledgement: [
    本研究の遂行にあたり、多大なるご協力を賜りました関係者の皆様に、深く感謝申し上げます。

    特に、本研究の指導をしてくださった [指導教員の名前] 教授に、心よりの謝辞を申し上げます。また、本研究にご協力いただいた [共同研究者の名前] 氏、[共同研究者の名前] 氏にも、厚くお礼申し上げます。

    本研究は、[研究費の名称] の助成を受けて行われました。ここに、そのご支援に感謝申し上げます。

    We would like to express our sincere gratitude to all those who provided us with great assistance in the conduct of this study.

    In particular, we would like to express our deepest gratitude to Professor [Name of the supervisor] for his guidance on this study. We would also like to thank Mr. [Name of the co-researcher] and Ms. [Name of the co-researcher] for their cooperation in this study.

    This study was conducted with the support of the [Name of the funding source]. We would like to express our gratitude for their support.

    (written by Google Bard)
  ],
)

=  はじめに

== 背景

背景

== 目的

目的

== 本論文の構成

構成


= 序論

typstはmarkdown likeなコーディングでpdf、ポスター、スライド等のドキュメントを作成できます。 rust言語で書かれており、コンパイルが latex に比べて早いのが特長です。

== typstは優秀だ

```typ
こんな感じで @ss8843592 or #cite(<ss8843592>) と引用できます
```

こんな感じで @ss8843592 or #cite(<ss8843592>) と引用できます


=== エレガントに書ける

```typ
$ mat(1, 2; 3, 4) $ <eq1>
```

と書くと

$ a = mat(1, 2; 3, 4) $ <eq1>

のように、 @eq1 を書くことができます。

また、

```typ
#figure(
  image("assets/image.png", width: 20%),
  caption: [サンプル画像]
) <img1>
```

とすれば

#figure(
  image("assets/image.png", width: 20%),
  caption: [サンプル画像]
) <img1>

@img1 を表示できますし、

```typ
#figure(
  table(
    columns: 4,
    [t], [1], [2], [3],
    [y], [0.3s], [0.4s], [0.8s],
  ),
  caption: [テーブル @madje2022programmable],
) <tbl1>
```

とすれば

#figure(
  table(
    columns: 4,
    [t], [1], [2], [3],
    [y], [0.3s], [0.4s], [0.8s],
  ),
  caption: [テーブル @madje2022programmable],
) <tbl1>

@tbl1 も表示できます。



= 先行研究

#figure(
  image("assets/image.png", width: 20%),
  caption: [Typst + git @madje2022programmable],
) <img2>

=== LATEX はコンパイルが遅い

本資料は、LATEX でコンパイルの待ち時間中に作りました。 
他にも
```typ
#include path.typ
```

とすれば、他ファイルを参照できるので、長い分量の本などを作成する際に、章ごとにファイルを分けるなどができるようになります。

便利なので広まれば良いなと思います。 

詳しくは#link("https://typst.app/docs")[
  公式ドキュメント
]をご覧ください



= 定義

Typstでは関数定義が簡単であるので定理の書き方などをカスタマイズできます。

== 定義例

```typ
#let theorem = thmbox(
  "theorem", //identifier
  "定理",
  base_level: 1
)

#theorem("すごい定理")[
  Typst はすごいのである。
] <theorem>
```

#let theorem = thmbox(
  "theorem",
  "定理",
  base_level: 1
)

#theorem("すごい定理")[
  Typst はすごいのである。
] <theorem>

```typ
#let lemma = thmbox(
  "theorem", //identifier
  "補題",
  base_level: 1,
)

#lemma[
  Texはさようならである。
] <lemma>
```
#let lemma = thmbox(
  "theorem",
  "補題",
  base_level: 1,
)

#lemma[
  Texはさようならである。
] <lemma>

このように、@theorem 、 @lemma を定義できます 。\
カッコ内の引数に人名などを入れることができます。
また、identifierを変えれば、カウントはリセットされる。
identifier毎にカウントを柔軟に変えられるようにしてあるので、様々な論文の形式に対応できるはずです。
```typ
#let definition = thmbox(
  "definition", //identifier
  "定義",
  base_level: 1,
  stroke: black + 1pt
)
#definition("Prime numbers")[
  A natural number is called a _prime number_ if it is greater than $1$ and
  cannot be written as the product of two smaller natural numbers. 
] <definition>
```

#let definition = thmbox(
  "definition",
  "定義",
  base_level: 1,
  stroke: black + 1pt,
)

#definition[
  Typst is a new markup-based typesetting system for the sciences. 
] <definition>

@definition のようにカウントがリセットされています。

```typ
#let corollary = thmbox(
  "corollary",
  "Corollary",
  base: "theorem",
)

#corollary[
  If $n$ divides two consecutive natural numbers, then $n = 1$.
] <corollary>
```

#let corollary = thmbox(
  "corollary",
  "Corollary",
  base: "theorem",
)

#corollary[
  If $n$ divides two consecutive natural numbers, then $n = 1$.
] <corollary>

baseにidentifierを入れることで@corollary のようにサブカウントを実現できます。

```typ
#let example = thmplain(
  "example",
  "Example"
).with(numbering: none)

#example[
  数式は\$\$で囲む
] <example>
```

#let example = thmplain(
  "example",
  "例"
).with(numbering: none)

#example[
  数式は\$\$で囲む
] <example>

thmplain関数を使ってplain表現も可能です。

#algorithm({
  import algorithmic: *
  Function("Binary-Search", args: ("A", "n", "v"), {
    Cmt[Initialize the search range]
    Assign[$l$][$1$]
    Assign[$r$][$n$]
    State[]
    While(cond: $l <= r$, {
      Assign([mid], FnI[floor][$(l + r)/2$])
      If(cond: $A ["mid"] < v$, {
        Assign[$l$][$m + 1$]
      })
      ElsIf(cond: [$A ["mid"] > v$], {
        Assign[$r$][$m - 1$]
      })
      Else({
        Return[$m$]
      })
    })
    Return[*null*]
  })
})
