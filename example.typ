// ============================================================
// formal-slides -- Example / Demo Presentation
// This file demonstrates all features of the template.
// ============================================================

#import "formal-slides.typ": *

#show: formal-slides.with(
  title: "Formal Slides",
  subtitle: "A Typst Template for Academic Presentations",
  institution: "Institution Name",
  date: "May 2025",
  authors: ("Author One", "Author Two"),
  ratio: 16 / 9,
  title-color: rgb("#1C1C1C"),
  bg-color: white,
  toc: true,
)

// ============================================================
// SECTION 1 -- TYPOGRAPHY
// ============================================================
#new-section("Typography")
#section-slide("Typography")

#slide(title: "Default Fonts")[
  The template ships with three IBM Plex families:

  #v(5pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 5pt,
    block(stroke: blue.darken(50%) + 0.6pt, inset: 7pt, width: 100%, text(font: "IBM Plex Serif", size: 11.5pt)[
      *IBM Plex Serif* \
      body text \
      Regular, _italic_, \
      *bold*, _*bold-italic*_
    ]),
    block(stroke: blue.darken(50%) + 0.6pt, inset: 7pt, width: 100%, text(font: "IBM Plex Sans", size: 11.5pt)[
      *IBM Plex Sans* \
      titles & headings \
      Regular, _italic_, \
      *bold*, _*bold-italic*_
    ]),
    block(stroke: blue.darken(50%) + 0.6pt, inset: 7pt, width: 100%, text(font: "IBM Plex Mono", size: 11.5pt)[
      *IBM Plex Mono* \
      code & verbatim \
      Regular, _italic_, \
      *bold*
    ]),
  )
  #v(6pt)
  Inline styling: #text(weight: "bold")[bold], #text(style: "italic")[italic], #text(fill: blue.darken(50%))[colored], #underline[underlined], #text(size: 13pt)[large (13 pt)], #text(size: 7.5pt)[small (7.5 pt)].
]

#slide(title: "Text Sizing and Semantic Emphasis")[
  #v(2pt)
  #text(size: 18pt, weight: "bold", fill: blue.darken(50%))[Headline -- 18 pt bold] \
  #text(size: 14pt, weight: "bold")[Subheading -- 14 pt bold] \
  #text(size: 12pt)[Section heading -- 12 pt regular] \
  #text(size: 10pt)[Body text -- 10 pt (default)] \
  #text(size: 8pt, fill: luma(60))[Caption / footnote -- 8 pt muted]

  #v(8pt)
  Semantic use: #text(style: "italic")[italics for emphasis], #text(weight: "bold")[bold for key terms], #text(fill: red.darken(20%))[red for warnings], #text(fill: green.darken(25%))[green for results]. Combine for #text(style: "italic", weight: "bold", fill: blue.darken(50%))[critical highlighted points].

  #v(4pt)
  Change the global accent via `title-color`, the secondary bands via `secondary-color`, and the page fill via `bg-color`. These parameters propagate through the navigation bar, footer, section dividers, TOC numbering squares, and theorem environments.
]

// ============================================================
// SECTION 2 -- LISTS AND ENUMERATIONS
// ============================================================
#new-section("Lists & Enumerations")
#section-slide("Lists & Enumerations")

#slide(title: "Bullet Points and Nested Lists")[
  #two-col(
    [
      *Unordered list (three levels):*
      - First top-level item
        - Nested child A
        - Nested child B
          - Deeply nested
          - Another deep item
      - Second top-level item
        - Another child
      - Third top-level item
    ],
    [
      *Ordered enumeration (three levels):*
      + Step one: initialise
        + Sub-step 1a
        + Sub-step 1b
      + Step two: process data
        + Sub-step 2a
          + Detail 2a-i
      + Step three: evaluate output
      + Step four: report results
    ],
  )

  #v(5pt)
  Typst automatically styles bullet symbols and numerals at each nesting depth. Ordered and unordered lists can be freely mixed at any level.
]

// ============================================================
// SECTION 3 -- FIGURES
// ============================================================
#new-section("Figures")
#section-slide("Figures")

#slide(title: "Inserting and Referencing Figures")[
  #two-col(
    [
      Figures use `#fs-figure(caption: [...])`. The counter resets per section; reference figures by their auto-assigned number. Longer surrounding paragraphs make it easier to inspect the vertical rhythm before and after visual material.

      #v(5pt)
      As shown in *Figure 1*, a colored rectangle acts as a placeholder. In practice pass `image("diagram.svg")` or any Typst content as the figure body. This text intentionally spans multiple lines so the figure margins can be judged against realistic prose.

      #v(4pt)
      *Figure 2* illustrates that captions appear italic below the figure, numbered automatically within the current section. The paragraph below the visual block should feel close enough to belong to the same slide, but not so close that the caption looks cramped.
    ],
    [
      The first placeholder represents a diagram or image inserted into the slide flow. A few lines of prose above it help show how the template separates ordinary text from framed visual content.

      #fs-figure(caption: [Placeholder -- replace with `image("diagram.svg")`.])[
        #rect(
          width: 100%,
          height: 62pt,
          fill: blue.darken(50%).lighten(88%),
          stroke: blue.darken(50%) + 0.8pt,
          align(center + horizon, text(fill: blue.darken(50%), size: 9pt)[Diagram / Image here]),
        )
      ]
      #fs-figure(caption: [Second figure -- captions are italic, automatically numbered.])[
        #rect(
          width: 100%,
          height: 38pt,
          fill: luma(240),
          stroke: luma(190) + 0.6pt,
          align(center + horizon, text(fill: luma(80), size: 9pt)[Another placeholder]),
        )
      ]

      After the second figure, this short paragraph checks the lower margin beneath a caption. It should read as a continuation of the slide narrative rather than as text accidentally attached to the figure.
    ],
  )
]

#slide(title: "Full-Width and Fractional-Width Figures (With Captions)")[
  #two-col(
    [
      A figure can expand to the full width of its column when the content should dominate the layout. This is useful for diagrams, screenshots, or images that need as much horizontal room as possible.

      #fs-figure(caption: [Full-width placeholder figure spanning the whole column.])[
        #rect(
          width: 100%,
          height: 60pt,
          fill: blue.darken(50%).lighten(88%),
          stroke: blue.darken(50%) + 0.8pt,
          align(center + horizon, text(fill: blue.darken(50%), size: 9pt)[Full-width figure]),
        )
      ]

      The caption should stay centered under the figure even when the visual takes the entire available width of the column.
    ],
    [
      Smaller visuals often read better when they keep some white space around them. A fractional-width figure makes that possible while still preserving the same numbering and caption behavior.

      #fs-figure(caption: [Fractional-width placeholder figure centered inside the column.])[
        #align(center, rect(
          width: 68%,
          height: 60pt,
          fill: luma(240),
          stroke: luma(190) + 0.6pt,
          align(center + horizon, text(fill: luma(80), size: 9pt)[Fractional-width figure]),
        ))
      ]

      This example checks that a narrower figure still aligns cleanly in the column and that the caption feels attached to the centered image rather than to the whole column width.
    ],
  )
]

#slide(title: "Full-Width and Fractional-Width Figures (No Captions)")[
  #two-col(
    [
      The same pair can also be shown without captions when the slide is purely illustrative and the surrounding prose already provides enough context for the audience.

      #fs-visual[
        #rect(
          width: 100%,
          height: 60pt,
          fill: blue.darken(50%).lighten(88%),
          stroke: blue.darken(50%) + 0.8pt,
          align(center + horizon, text(fill: blue.darken(50%), size: 9pt)[Full-width figure]),
        )
      ]

      Without a caption, the lower margin should still separate the figure from the next paragraph and keep the slide from feeling cramped.
    ],
    [
      The fractional-width version below uses the same visual content but keeps the narrower footprint. This lets us compare centered image placement with and without the caption layer.

      #fs-visual[
        #rect(
          width: 68%,
          height: 60pt,
          fill: luma(240),
          stroke: luma(190) + 0.6pt,
          align(center + horizon, text(fill: luma(80), size: 9pt)[Fractional-width figure]),
        )
      ]

      The surrounding text remains multi-line on purpose so we can judge the spacing around a centered narrow figure in the same way as we do for captioned figures.
    ],
  )
]

// ============================================================
// SECTION 4 -- TWO-COLUMN LAYOUT
// ============================================================
#new-section("Layouts")
#section-slide("Two-Column Layouts")

#slide(title: "Two-Column Layout")[
  #two-col(
    left-width: 50%,
    [
      == Left column

      The `#two-col(left, right)` helper builds a two-column `grid`. Parameters:
      - `left-width` -- fraction of slide width (default 48%)
      - `gutter` -- gap between columns (default 4%)

      #v(4pt)
      Works well for: text + figure, code + output, comparative tables, side-by-side theorem boxes.
    ],
    [
      == Right column

      Any Typst content fits inside a column, including nested `two-col` calls, theorem boxes, figures, and tables.

      #fs-visual[
        #rect(
          width: 100%,
          height: 58pt,
          fill: luma(245),
          stroke: luma(200) + 0.6pt,
          align(center + horizon, text(size: 9pt, fill: luma(60))[Arbitrary block inside a column]),
        )
      ]
    ],
  )
]

// ============================================================
// SECTION 5 -- CODE BLOCKS
// ============================================================
#new-section("Code Blocks")
#section-slide("Source Code & Pseudo-code")

#slide(title: "Source Code and Pseudo-code Side by Side")[
  #two-col(
    [
      #code-box(
        "def softmax(x):
    e = np.exp(x - x.max(axis=-1, keepdims=True))
    return e / e.sum(axis=-1, keepdims=True)

def cross_entropy(logits, labels):
    probs = softmax(logits)
    n = labels.shape[0]
    log_p = np.log(probs[range(n), labels])
    return -log_p.mean()",
        type: "Source Code",
        title: "Python",
        lang: "python",
        color: luma(110),
        fill: luma(245),
      )
      Uses `IBM Plex Mono` on a light grey background. Pass a language name to `#code-box(..., lang: "...")` for syntax highlighting.
    ],
    [
      #pseudo-code(
        "Algorithm: Mini-Batch SGD
Input: loss L, data D, lr eta, T, B
-------------------------------------
for t = 1 to T do
  B_t <- sample B examples from D
  g   <- grad_theta L(theta; B_t)
  theta <- theta - eta * g
end for
return theta",
        title: "Mini-Batch SGD",
      )
      Pseudo-code now uses the same framed box language as the theorem environments, with a `type` label and `title`.
    ],
  )
]

// ============================================================
// SECTION 6 -- TABLES
// ============================================================
#new-section("Tables")
#section-slide("Tables")

#slide(title: "Paper-style and Grid-style Tables (No Captions)")[
  #two-col(
    [
      *Paper style* (booktabs-like -- horizontal rules only)

      This table is introduced by a short paragraph rather than a single label. The extra prose makes the spacing above the table visible in a realistic slide, where a table usually follows a sentence or two of setup.

      #let paper-cell(body, pos: left) = block(width: 100%, inset: (x: 5pt, y: 4pt), align(pos, body))
      #fs-visual[
        #block(width: 100%, {
          line(length: 100%, stroke: 0.9pt)
          grid(
            columns: (28%, 24%, 24%, 24%),
            paper-cell(text(weight: "bold")[Method]),
            paper-cell(text(weight: "bold")[Acc. (%)], pos: center),
            paper-cell(text(weight: "bold")[F#sub[1]], pos: center),
            paper-cell(text(weight: "bold")[AUC], pos: center),

            paper-cell[Baseline],
            paper-cell(pos: center)[72.3],
            paper-cell(pos: center)[0.701],
            paper-cell(pos: center)[0.743],

            paper-cell[Model A],
            paper-cell(pos: center)[81.5],
            paper-cell(pos: center)[0.803],
            paper-cell(pos: center)[0.851],

            paper-cell[*Model B*],
            paper-cell(pos: center)[*88.9*],
            paper-cell(pos: center)[*0.876*],
            paper-cell(pos: center)[*0.903*],
          )
          line(length: 100%, stroke: 0.9pt)
        })
      ]
      Classic academic style: only top and bottom rules, no vertical lines. The text after the table deliberately runs for a couple of lines so the lower margin can be compared with the upper margin.
    ],
    [
      *Grid style* (full borders, colored header, alternating rows)

      The grid version is meant for dense numeric summaries or dashboard-like reporting. A longer lead-in makes it easier to see whether the table feels attached to the explanation or floats too far away.

      #let grid-cell(body, fill: white, stroke: luma(200) + 0.6pt, pos: center) = block(
        width: 100%,
        fill: fill,
        stroke: stroke,
        inset: (x: 5pt, y: 4pt),
        align(pos, body),
      )
      #fs-visual[
        #block(width: 100%, grid(
          columns: (28%, 24%, 24%, 24%),
          grid-cell(fill: blue.darken(50%), pos: left)[#text(weight: "bold", fill: white)[Method]],
          grid-cell(fill: blue.darken(50%))[#text(weight: "bold", fill: white)[Acc. (%)]],
          grid-cell(fill: blue.darken(50%))[#text(weight: "bold", fill: white)[F#sub[1]]],
          grid-cell(fill: blue.darken(50%))[#text(weight: "bold", fill: white)[AUC]],

          grid-cell(fill: luma(248), pos: left)[Baseline],
          grid-cell(fill: luma(248))[72.3],
          grid-cell(fill: luma(248))[0.701],
          grid-cell(fill: luma(248))[0.743],

          grid-cell(fill: white, pos: left)[Model A],
          grid-cell(fill: white)[81.5],
          grid-cell(fill: white)[0.803],
          grid-cell(fill: white)[0.851],

          grid-cell(fill: luma(248), pos: left)[Model B],
          grid-cell(fill: luma(248))[88.9],
          grid-cell(fill: luma(248))[0.876],
          grid-cell(fill: luma(248))[0.903],
        ))
      ]
      Dashboard style: solid grid, alternating row shading. This closing note also spans multiple lines, which helps reveal whether the table block leaves enough room before normal prose resumes.
    ],
  )
]

#slide(title: "Paper-style and Grid-style Tables (With Captions)")[
  #two-col(
    [
      *Paper style* (booktabs-like -- horizontal rules only)

      Captions are useful when the table needs to be referenced later in the talk or connected to a source. This paragraph gives the captioned table enough surrounding prose to test both the top margin and the caption spacing.

      #let paper-cell(body, pos: left) = block(width: 100%, inset: (x: 5pt, y: 4pt), align(pos, body))
      #figure(
        kind: table,
        caption: [Placeholder caption for the paper-style table.],
        {
          block(width: 100%, {
            line(length: 100%, stroke: 0.9pt)
            grid(
              columns: (28%, 24%, 24%, 24%),
              paper-cell(text(weight: "bold")[Method]),
              paper-cell(text(weight: "bold")[Acc. (%)], pos: center),
              paper-cell(text(weight: "bold")[F#sub[1]], pos: center),
              paper-cell(text(weight: "bold")[AUC], pos: center),

              paper-cell[Baseline],
              paper-cell(pos: center)[72.3],
              paper-cell(pos: center)[0.701],
              paper-cell(pos: center)[0.743],

              paper-cell[Model A],
              paper-cell(pos: center)[81.5],
              paper-cell(pos: center)[0.803],
              paper-cell(pos: center)[0.851],

              paper-cell[*Model B*],
              paper-cell(pos: center)[*88.9*],
              paper-cell(pos: center)[*0.876*],
              paper-cell(pos: center)[*0.903*],
            )
            line(length: 100%, stroke: 0.9pt)
          })
        },
      )
      Classic academic style: only top and bottom rules, no vertical lines. With a caption present, the paragraph after the table should sit beneath the full table block rather than feeling glued to the caption.
    ],
    [
      *Grid style* (full borders, colored header, alternating rows)

      The captioned grid table shows how a more operational table behaves inside the same layout. The text before it is intentionally longer so vertical spacing is visible without relying on empty slide area.

      #let grid-cell(body, fill: white, stroke: luma(200) + 0.6pt, pos: center) = block(
        width: 100%,
        fill: fill,
        stroke: stroke,
        inset: (x: 5pt, y: 4pt),
        align(pos, body),
      )
      #figure(
        kind: table,
        caption: [Placeholder caption for the grid-style table.],
        {
          block(width: 100%, grid(
            columns: (28%, 24%, 24%, 24%),
            grid-cell(fill: blue.darken(50%), pos: left)[#text(weight: "bold", fill: white)[Method]],
            grid-cell(fill: blue.darken(50%))[#text(weight: "bold", fill: white)[Acc. (%)]],
            grid-cell(fill: blue.darken(50%))[#text(weight: "bold", fill: white)[F#sub[1]]],
            grid-cell(fill: blue.darken(50%))[#text(weight: "bold", fill: white)[AUC]],

            grid-cell(fill: luma(248), pos: left)[Baseline],
            grid-cell(fill: luma(248))[72.3],
            grid-cell(fill: luma(248))[0.701],
            grid-cell(fill: luma(248))[0.743],

            grid-cell(fill: white, pos: left)[Model A],
            grid-cell(fill: white)[81.5],
            grid-cell(fill: white)[0.803],
            grid-cell(fill: white)[0.851],

            grid-cell(fill: luma(248), pos: left)[Model B],
            grid-cell(fill: luma(248))[88.9],
            grid-cell(fill: luma(248))[0.876],
            grid-cell(fill: luma(248))[0.903],
          ))
        },
      )
      Dashboard style: solid grid, alternating row shading. This final description should have comfortable breathing room after the caption while still reading as part of the same explanatory unit.
    ],
  )
]

// ============================================================
// SECTION 7 -- DIAGRAMS AND CHARTS (three slides)
// ============================================================
#new-section("Diagrams & Charts")
#section-slide("Diagrams & Charts")

// ---- Diagram drawing helpers -------------------------------
#let _arrow-head(x, y, dir: "r", color: luma(25)) = {
  if dir == "r" {
    place(top + left, dx: x - 6pt, dy: y - 3pt, polygon((0pt, 0pt), (6pt, 3pt), (0pt, 6pt), fill: color))
  } else if dir == "l" {
    place(top + left, dx: x, dy: y - 3pt, polygon((0pt, 3pt), (6pt, 0pt), (6pt, 6pt), fill: color))
  } else if dir == "d" {
    place(top + left, dx: x - 3pt, dy: y - 6pt, polygon((0pt, 0pt), (6pt, 0pt), (3pt, 6pt), fill: color))
  } else if dir == "u" {
    place(top + left, dx: x - 3pt, dy: y, polygon((0pt, 6pt), (3pt, 0pt), (6pt, 6pt), fill: color))
  } else if dir == "dr" {
    place(top + left, dx: x - 6pt, dy: y - 6pt, polygon((6pt, 6pt), (1pt, 4pt), (4pt, 1pt), fill: color))
  } else if dir == "dl" {
    place(top + left, dx: x, dy: y - 6pt, polygon((0pt, 6pt), (5pt, 4pt), (2pt, 1pt), fill: color))
  } else if dir == "ur" {
    place(top + left, dx: x - 6pt, dy: y, polygon((6pt, 0pt), (1pt, 2pt), (4pt, 5pt), fill: color))
  } else {
    place(top + left, dx: x, dy: y, polygon((0pt, 0pt), (5pt, 2pt), (2pt, 5pt), fill: color))
  }
}

#let _arr-r(x1, y, x2, color: luma(25), weight: 0.8pt, label: none, label-dy: -8pt) = {
  place(top + left, line(start: (x1, y), end: (x2 - 5pt, y), stroke: color + weight))
  _arrow-head(x2, y, dir: "r", color: color)
  if label != none {
    place(top + left, dx: (x1 + x2) / 2 - 6pt, dy: y + label-dy, text(size: 6.4pt, fill: color, label))
  }
}

#let _arr-l(x1, y, x2, color: luma(25), weight: 0.8pt, label: none, label-dy: -8pt) = {
  place(top + left, line(start: (x1, y), end: (x2 + 5pt, y), stroke: color + weight))
  _arrow-head(x2, y, dir: "l", color: color)
  if label != none {
    place(top + left, dx: (x1 + x2) / 2 - 6pt, dy: y + label-dy, text(size: 6.4pt, fill: color, label))
  }
}

#let _arr-v(x, y1, y2, color: luma(25), weight: 0.8pt, label: none, label-dx: 4pt) = {
  if y2 > y1 {
    place(top + left, line(start: (x, y1), end: (x, y2 - 5pt), stroke: color + weight))
    _arrow-head(x, y2, dir: "d", color: color)
  } else {
    place(top + left, line(start: (x, y1), end: (x, y2 + 5pt), stroke: color + weight))
    _arrow-head(x, y2, dir: "u", color: color)
  }
  if label != none {
    place(top + left, dx: x + label-dx, dy: (y1 + y2) / 2 - 4pt, text(size: 6.4pt, fill: color, label))
  }
}

#let _arr-diag(x1, y1, x2, y2, dir, color: luma(25), weight: 0.8pt, label: none, label-dx: 0pt, label-dy: 0pt) = {
  place(top + left, line(start: (x1, y1), end: (x2, y2), stroke: color + weight))
  _arrow-head(x2, y2, dir: dir, color: color)
  if label != none {
    place(top + left, dx: (x1 + x2) / 2 + label-dx, dy: (y1 + y2) / 2 + label-dy, text(size: 6.4pt, fill: color, label))
  }
}

#let _diagram-block(label, w: 52pt, h: 18pt, fill: luma(245), stroke: luma(25), text-size: 6.6pt, radius: 2pt) = box(
  width: w,
  height: h,
  fill: fill,
  stroke: stroke + 0.7pt,
  radius: radius,
  align(center + horizon, text(size: text-size, fill: luma(15), label)),
)

#let transformer-diagram = align(center, {
  let W = 224pt
  let H = 142pt
  let ink = luma(15)
  let enc-x = 16pt
  let dec-x = 124pt
  let col-w = 78pt
  let pink = rgb("#F9DCDD")
  let peach = rgb("#FFE3B8")
  let bluefill = rgb("#C5E8F5")
  let normfill = rgb("#F3F5C2")
  let greenfill = rgb("#D8F0D9")
  let violet = rgb("#E4E7F8")
  let block-at(x, y, label, fill, h: 17pt, size: 6.2pt) = place(
    top + left,
    dx: x,
    dy: y,
    _diagram-block(label, w: 56pt, h: h, fill: fill, stroke: ink, text-size: size, radius: 2.2pt),
  )
  let plus(x, y) = place(top + left, dx: x - 5pt, dy: y - 5pt, circle(radius: 5pt, stroke: ink + 0.8pt, fill: white))
  box(width: W, height: H, {
    place(top + left, dx: enc-x - 7pt, dy: 38pt, block(
      width: col-w,
      height: 70pt,
      stroke: ink + 1.3pt,
      radius: 7pt,
      fill: luma(250),
    ))
    place(top + left, dx: dec-x - 7pt, dy: 22pt, block(
      width: col-w,
      height: 91pt,
      stroke: ink + 1.3pt,
      radius: 7pt,
      fill: luma(250),
    ))
    place(top + left, dx: enc-x - 21pt, dy: 67pt, text(size: 12pt, fill: ink, [N×]))
    place(top + left, dx: dec-x + 73pt, dy: 64pt, text(size: 12pt, fill: ink, [N×]))

    block-at(enc-x + 4pt, 118pt, [Input Embedding], pink, h: 16pt, size: 5.8pt)
    plus(enc-x + 32pt, 111pt)
    place(top + left, dx: enc-x - 12pt, dy: 103pt, text(size: 6.6pt, fill: ink)[Positional])
    place(top + left, dx: enc-x - 12pt, dy: 111pt, text(size: 6.6pt, fill: ink)[Encoding])
    place(top + left, dx: enc-x + 21pt, dy: 134pt, text(size: 6.8pt, fill: ink)[Inputs])
    _arr-v(enc-x + 32pt, 140pt, 134pt, color: ink, weight: 0.9pt)
    _arr-v(enc-x + 32pt, 118pt, 50pt, color: ink, weight: 0.9pt)
    block-at(enc-x + 4pt, 82pt, [Multi-Head\ Attention], peach, h: 18pt, size: 5.3pt)
    block-at(enc-x + 4pt, 67pt, [Add & Norm], normfill, h: 11pt, size: 5.5pt)
    block-at(enc-x + 4pt, 50pt, [Feed\ Forward], bluefill, h: 15pt, size: 5.4pt)
    block-at(enc-x + 4pt, 40pt, [Add & Norm], normfill, h: 10pt, size: 5.3pt)
    _arr-r(enc-x + 62pt, 73pt, enc-x + 71pt, color: ink, weight: 0.9pt)
    _arr-r(enc-x + 62pt, 45pt, enc-x + 71pt, color: ink, weight: 0.9pt)

    block-at(dec-x + 4pt, 122pt, [Output Embedding], pink, h: 16pt, size: 5.8pt)
    plus(dec-x + 32pt, 115pt)
    place(top + left, dx: dec-x + 59pt, dy: 107pt, text(size: 6.6pt, fill: ink)[Positional])
    place(top + left, dx: dec-x + 59pt, dy: 115pt, text(size: 6.6pt, fill: ink)[Encoding])
    place(top + left, dx: dec-x + 13pt, dy: 136pt, text(size: 6.8pt, fill: ink)[Outputs])
    _arr-v(dec-x + 32pt, 141pt, 138pt, color: ink, weight: 0.9pt)
    _arr-v(dec-x + 32pt, 122pt, 108pt, color: ink, weight: 0.9pt)
    block-at(dec-x + 4pt, 94pt, [Masked\ Multi-Head\ Attention], peach, h: 18pt, size: 4.8pt)
    block-at(dec-x + 4pt, 81pt, [Add & Norm], normfill, h: 10pt, size: 5.3pt)
    block-at(dec-x + 4pt, 65pt, [Multi-Head\ Attention], peach, h: 14pt, size: 5.0pt)
    block-at(dec-x + 4pt, 52pt, [Add & Norm], normfill, h: 10pt, size: 5.3pt)
    block-at(dec-x + 4pt, 38pt, [Feed\ Forward], bluefill, h: 12pt, size: 5.1pt)
    block-at(dec-x + 4pt, 25pt, [Add & Norm], normfill, h: 10pt, size: 5.3pt)
    block-at(dec-x + 4pt, 12pt, [Linear], violet, h: 10pt, size: 5.2pt)
    block-at(dec-x + 4pt, 0pt, [Softmax], greenfill, h: 10pt, size: 5.2pt)
    place(top + left, dx: dec-x + 63pt, dy: 1pt, text(size: 6.8pt, fill: ink)[Output\ Probs.])
    _arr-r(enc-x + 70pt, 62pt, dec-x + 4pt, color: ink, weight: 0.9pt)
    _arr-r(dec-x + 62pt, 86pt, dec-x + 71pt, color: ink, weight: 0.9pt)
    _arr-r(dec-x + 62pt, 57pt, dec-x + 71pt, color: ink, weight: 0.9pt)
  })
})


#let closed-loop-diagram = align(center, {
  let W = 248pt
  let H = 112pt
  let ink = luma(0)
  let stroke = ink + 1.0pt
  let label(x, y, body, size: 7.2pt) = place(top + left, dx: x, dy: y, text(size: size, fill: ink, body))
  let arrow-r(x1, y, x2) = {
    place(top + left, line(start: (x1, y), end: (x2 - 5pt, y), stroke: stroke))
    _arrow-head(x2, y, dir: "r", color: ink)
  }
  let arrow-l(x1, y, x2) = {
    place(top + left, line(start: (x1, y), end: (x2 + 5pt, y), stroke: stroke))
    _arrow-head(x2, y, dir: "l", color: ink)
  }
  let arrow-u(x, y1, y2) = {
    place(top + left, line(start: (x, y1), end: (x, y2 + 5pt), stroke: stroke))
    _arrow-head(x, y2, dir: "u", color: ink)
  }
  let arrow-d(x, y1, y2) = {
    place(top + left, line(start: (x, y1), end: (x, y2 - 5pt), stroke: stroke))
    _arrow-head(x, y2, dir: "d", color: ink)
  }
  let labeled-arrow(x1, y1, x2, y2, body, label-dx: 0pt, label-dy: 0pt, label-size: 8pt) = {
    if y1 == y2 and x2 > x1 {
      arrow-r(x1, y1, x2)
    } else if y1 == y2 and x2 < x1 {
      arrow-l(x1, y1, x2)
    } else if x1 == x2 and y2 > y1 {
      arrow-d(x1, y1, y2)
    } else if x1 == x2 and y2 < y1 {
      arrow-u(x1, y1, y2)
    } else {
      place(top + left, line(start: (x1, y1), end: (x2, y2), stroke: stroke))
    }
    if body != none {
      label((x1 + x2) / 2 + label-dx, (y1 + y2) / 2 + label-dy, body, size: label-size)
    }
  }


  let sys-box(x, y, label, w: 26pt, h: 26pt) = {
    place(
      top + left,
      dx: x,
      dy: y,
      box(
        width: w,
        height: h,
        fill: white,
        stroke: ink + 1.2pt,
        align(center + horizon, text(size: 8pt, fill: ink, label)),
      ),
    )
  }

  let sum-sign(x, y, body) = place(
    top + left,
    dx: x,
    dy: y,
    box(width: 5.5pt, height: 5.5pt, align(center + horizon, text(size: 5.8pt, fill: ink, body))),
  )
  let sum-node(x, y, kind: "feedback") = {
    let r = 10pt
    let d = 7.1pt
    let signs = if kind == "disturbance" {
      ((-8.6pt, -3.0pt, [+]), (-2.8pt, -8.6pt, [+]))
    } else {
      ((-8.6pt, -3.0pt, [+]), (-2.8pt, 3.2pt, [−]))
    }
    place(top + left, dx: x - r, dy: y - r, circle(radius: r, stroke: ink + 1.0pt, fill: white))
    place(top + left, line(start: (x - d, y - d), end: (x + d, y + d), stroke: ink + 0.65pt))
    place(top + left, line(start: (x - d, y + d), end: (x + d, y - d), stroke: ink + 0.65pt))
    for (sx, sy, sign) in signs {
      sum-sign(x + sx, y + sy, sign)
    }
  }
  box(width: W, height: H, {
    let y = 42pt
    let s1 = 48pt
    let s2 = 154pt
    let low = 85pt
    let arrow-len = 30pt
    let disturbance-arrow-len = 20pt
    let node-r = 10pt
    let box-w = 26pt
    let k-x = s1 + node-r + arrow-len
    let g-x = s2 + node-r + arrow-len
    let branch = g-x + box-w + arrow-len / 2
    let h-x = 144pt

    sum-node(s1, y)
    label(k-x - 4pt, 17pt, [Controller], size: 7pt)

    sys-box(k-x, 29pt, [$K(z)$])
    // sys-box(50pt, 29pt, [$K(z)$])

    sum-node(s2, y, kind: "disturbance")
    label(g-x - 11pt, 17pt, [Target System], size: 7pt)
    sys-box(g-x, 29pt, [$G(z)$])
    sys-box(h-x, 72pt, [$H(z)$])
    label(h-x - 7pt, 103pt, [Transducer], size: 7pt)

    labeled-arrow(s1 - node-r - arrow-len, y, s1 - node-r, y, [$R(z)$], label-dx: -10pt, label-dy: -10pt)
    labeled-arrow(s1 + node-r, y, k-x, y, [$E(z)$], label-dx: -10pt, label-dy: -10pt)
    labeled-arrow(k-x + box-w, y, s2 - node-r, y, [$U(z)$], label-dx: -10pt, label-dy: -10pt)
    labeled-arrow(s2 + node-r, y, g-x, y, [$V(z)$], label-dx: -10pt, label-dy: -10pt)
    labeled-arrow(g-x + box-w, y, g-x + box-w + arrow-len, y, [$Y(z)$], label-dx: -10pt, label-dy: -10pt)
    labeled-arrow(s2, y - node-r - disturbance-arrow-len, s2, y - node-r, [$D(z)$], label-dx: -9pt, label-dy: -21pt)
    place(top + left, line(start: (branch, y), end: (branch, low), stroke: stroke))
    arrow-l(branch, low, h-x + box-w)
    place(top + left, line(start: (h-x, low), end: (s1, low), stroke: stroke))
    arrow-u(s1, low, 52pt)
    label(94pt, 90pt, [$W(z)$], size: 8pt)
  })
})



#let kernel-image-diagram = align(center, {
  let W = 220pt
  let H = 86pt
  let ink = luma(15)
  let label-size = 9pt
  let node(x, y, w, h, body, size) = place(
    top + left,
    dx: x - w / 2,
    dy: y - h / 2,
    box(width: w, height: h, align(center + horizon, text(size: size, fill: ink, body))),
  )
  let arrow-r(x1, y, x2, body, label-dx: 0pt, label-dy: -13pt) = {
    place(top + left, line(start: (x1, y), end: (x2 - 5pt, y), stroke: ink + 0.8pt))
    _arrow-head(x2, y, dir: "r", color: ink)
    place(top + left, dx: (x1 + x2) / 2 + label-dx, dy: y + label-dy, text(size: label-size, fill: ink, body))
  }
  let arrow-v(x, y1, y2, body, label-dx: 7pt, label-dy: -4pt) = {
    if y2 > y1 {
      place(top + left, line(start: (x, y1), end: (x, y2 - 5pt), stroke: ink + 0.8pt))
      _arrow-head(x, y2, dir: "d", color: ink)
    } else {
      place(top + left, line(start: (x, y1), end: (x, y2 + 5pt), stroke: ink + 0.8pt))
      _arrow-head(x, y2, dir: "u", color: ink)
    }
    place(top + left, dx: x + label-dx, dy: (y1 + y2) / 2 + label-dy, text(size: label-size, fill: ink, body))
  }
  box(width: W, height: H, {
    let top-y = 20pt
    let bot-y = 68pt
    let left-x = 66pt
    let right-x = 162pt
    let g-w = 24pt
    let gp-w = 30pt
    let q-w = 92pt
    let im-w = 58pt
    let g-arrow-w = 20pt
    let gp-arrow-w = 24pt
    let q-arrow-w = 74pt
    let im-arrow-w = 42pt
    let node-h = 18pt

    node(left-x, top-y, g-w, node-h, [$G$], 18pt)
    node(right-x, top-y, gp-w, node-h, [$G'$], 18pt)
    node(left-x, bot-y, q-w, node-h, [$G slash ker phi$], 16pt)
    node(right-x, bot-y, im-w, node-h, [$im phi$], 16pt)

    arrow-r(left-x + g-arrow-w / 2 + 2pt, top-y, right-x - gp-arrow-w / 2 + 1pt, [$phi$], label-dx: -4pt)
    arrow-v(left-x, top-y + node-h / 2 + 2pt, bot-y - node-h / 2 + 1pt, [$-$], label-dx: -13pt)
    arrow-r(left-x + q-arrow-w / 2 + 2pt, bot-y, right-x - im-arrow-w / 2 + 1pt, [$overline(phi)$], label-dx: -8pt, label-dy: 5pt)
    arrow-v(right-x, bot-y - node-h / 2 + 1pt, top-y + node-h / 2 + 2pt, [inc], label-dx: 7pt)
  })
})

#let weighted-transition-graph = align(center, {
  let W = 208pt
  let H = 145pt
  let ink = luma(25)
  let edge = rgb("#C66A00")
  let node(x, y, short) = {
    place(top + left, dx: x - 13pt, dy: y - 13pt, box(
      width: 26pt,
      height: 26pt,
      radius: 13pt,
      stroke: ink + 0.7pt,
      fill: white,
      align(center + horizon, text(size: 8.4pt, style: "italic", short)),
    ))
  }
  box(width: W, height: H, {
    _arr-diag(103pt, 28pt, 76pt, 56pt, "dl", color: edge, weight: 0.85pt, label: [10], label-dx: -1pt, label-dy: -8pt)
    _arr-diag(67pt, 75pt, 40pt, 96pt, "dl", color: edge, weight: 0.85pt, label: [10], label-dx: -3pt, label-dy: -9pt)
    _arr-diag(35pt, 105pt, 64pt, 125pt, "dr", color: edge, weight: 0.85pt, label: [4], label-dx: -11pt, label-dy: -8pt)
    _arr-v(74pt, 79pt, 116pt, color: edge, weight: 0.85pt, label: [5], label-dx: 5pt)
    _arr-v(64pt, 116pt, 77pt, color: edge, weight: 0.85pt)
    _arr-diag(122pt, 90pt, 82pt, 69pt, "ul", color: edge, weight: 0.85pt, label: [3], label-dx: -3pt, label-dy: -10pt)
    _arr-diag(118pt, 104pt, 82pt, 125pt, "dl", color: edge, weight: 0.85pt, label: [9], label-dx: -2pt, label-dy: -3pt)
    _arr-v(126pt, 75pt, 36pt, color: edge, weight: 0.85pt, label: [4], label-dx: -7pt)
    _arr-v(137pt, 36pt, 75pt, color: edge, weight: 0.85pt)
    _arr-l(177pt, 126pt, 88pt, color: edge, weight: 0.85pt, label: [10], label-dy: -9pt)
    place(top + left, line(start: (180pt, 112pt), end: (194pt, 79pt), stroke: edge + 0.85pt))
    place(top + left, line(start: (194pt, 79pt), end: (174pt, 17pt), stroke: edge + 0.85pt))
    place(top + left, line(start: (174pt, 17pt), end: (140pt, 20pt), stroke: edge + 0.85pt))
    _arrow-head(140pt, 20pt, dir: "l", color: edge)
    place(top + left, dx: 190pt, dy: 67pt, text(size: 6.4pt, fill: edge)[10])
    node(26pt, 103pt, [$P$])
    node(76pt, 67pt, [$B$])
    node(130pt, 22pt, [$D$])
    node(128pt, 96pt, [$C$])
    node(75pt, 127pt, [$M$])
    node(181pt, 128pt, [$L$])
  })
})

// ---- Chart slide 1: Transformer + Dynamic system -----------
#slide(title: "Block Diagrams")[
  #two-col(
    left-width: 49%,
    [
      The Transformer architecture couples an encoder stack with an autoregressive decoder. Multi-head attention and feed-forward sub-layers are wrapped in residual connections followed by layer normalisation.

      #fs-diagram(caption: [Transformer encoder-decoder block diagram (Vaswani et al., 2017).])[
        #transformer-diagram
      ]
      Residual connections (Add) let gradients flow directly; Layer Norm stabilises training at each depth.
    ],
    [
      A closed-loop controller compares the reference signal with the measured output, drives the plant, and routes the response through a feedback transducer.

      #fs-diagram(
        caption: [Closed-loop control system with controller, plant, disturbance input, and feedback transducer.],
      )[
        #closed-loop-diagram
      ]
      The disturbance $D(z)$ enters before the plant, while $H(z)$ shapes the measured feedback signal $W(z)$ returned to the summing junction.
    ],
  )
]

// ---- Chart slide 2: Linear algebra + Graph -----------------
#slide(title: "Linear Algebra Diagram and Transition Graph")[
  #two-col(
    left-width: 49%,
    [
      For a linear map $T: V -> W$, the *kernel* is mapped to zero and the *image* spans all reachable outputs. Rank-nullity: $dim(ker T) + dim(im T) = dim V$.

      #fs-diagram(caption: [Kernel-image decomposition for a linear map $T: V -> W$.])[
        #kernel-image-diagram
      ]
      Vectors in the kernel map to zero; those outside are mapped injectively onto the image.
    ],
    [
      A weighted directed graph encodes reachable states as nodes and transition costs as labels on the arcs. This version keeps the notation compact to match the reference diagram.

      #fs-diagram(caption: [Weighted directed transition graph; edge labels denote transition costs.])[
        #weighted-transition-graph
      ]
      Parallel and long-range transitions are shown with separate arrows, making bidirectional moves and high-cost paths visible at a glance.
    ],
  )
]

// ---- Chart slide 3: Line chart + Histogram -----------------
#let accuracy-chart = align(center, {
  let W = 248pt
  let H = 126pt
  let pl = 32pt
  let pr = 13pt
  let pt = 21pt
  let pb = 24pt
  let iw = W - pl - pr
  let ih = H - pt - pb
  let xs = (0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0)
  let ya = (0.52, 0.57, 0.63, 0.70, 0.76, 0.81, 0.85, 0.88, 0.90, 0.91, 0.92)
  let yb = (0.48, 0.51, 0.55, 0.60, 0.65, 0.69, 0.73, 0.76, 0.79, 0.81, 0.83)
  let yc = (0.50, 0.50, 0.50, 0.50, 0.50, 0.50, 0.50, 0.50, 0.50, 0.50, 0.50)
  let xmin = 0.0
  let xmax = 5.0
  let ymin = 0.44
  let ymax = 0.96
  let px(xi) = pl + (xi - xmin) / (xmax - xmin) * iw
  let py(yi) = pt + (ymax - yi) / (ymax - ymin) * ih
  let mkpath(ys, col) = {
    let pts = xs.zip(ys).map(p => (px(p.first()), py(p.last())))
    curve(
      stroke: col + 1.35pt,
      fill: none,
      curve.move(pts.first()),
      ..pts.slice(1).map(curve.line),
    )
  }
  let markers(ys, col) = {
    for (xv, yv) in xs.zip(ys) {
      place(top + left, dx: px(xv) - 1.6pt, dy: py(yv) - 1.6pt, circle(radius: 1.6pt, fill: white, stroke: col + 0.7pt))
    }
  }
  box(width: W, height: H, stroke: luma(180) + 0.45pt, fill: luma(252), {
    place(top + left, dx: 8pt, dy: 5pt, text(size: 6.8pt, weight: "bold", fill: luma(25))[Validation accuracy by epoch])
    place(top + left, dx: W - 91pt, dy: 5pt, box(width: 83pt, height: 13pt, fill: white, stroke: luma(220) + 0.35pt, {
      place(top + left, line(start: (5pt, 6.5pt), end: (14pt, 6.5pt), stroke: blue.darken(50%) + 1.1pt))
      place(top + left, dx: 17pt, dy: 3pt, text(size: 5.3pt, fill: luma(45))[A])
      place(top + left, line(start: (28pt, 6.5pt), end: (37pt, 6.5pt), stroke: red.darken(20%) + 1.1pt))
      place(top + left, dx: 40pt, dy: 3pt, text(size: 5.3pt, fill: luma(45))[B])
      place(top + left, line(start: (52pt, 6.5pt), end: (61pt, 6.5pt), stroke: luma(150) + 1.1pt))
      place(top + left, dx: 64pt, dy: 3pt, text(size: 5.3pt, fill: luma(45))[base])
    }))
    place(top + left, dx: pl + 3pt, dy: pt + 3pt, text(size: 5.2pt, fill: luma(75))[Accuracy])
    for yi in (0.5, 0.6, 0.7, 0.8, 0.9) {
      place(top + left, line(start: (pl, py(yi)), end: (W - pr, py(yi)), stroke: luma(222) + 0.45pt))
      place(top + left, dx: 7pt, dy: py(yi) - 3.6pt, text(size: 5.4pt, fill: luma(70), str(yi)))
    }
    place(top + left, line(start: (pl, pt), end: (pl, H - pb), stroke: luma(95) + 0.65pt))
    place(top + left, line(start: (pl, H - pb), end: (W - pr, H - pb), stroke: luma(95) + 0.65pt))
    for xi in (0, 1, 2, 3, 4, 5) {
      place(top + left, line(
        start: (px(float(xi)), H - pb),
        end: (px(float(xi)), H - pb + 2pt),
        stroke: luma(95) + 0.45pt,
      ))
      place(top + left, dx: px(float(xi)) - 2pt, dy: H - pb + 3.5pt, text(size: 5.4pt, fill: luma(70), str(xi)))
    }
    place(top + left, dx: W / 2 - 12pt, dy: H - 9pt, text(size: 5.5pt, fill: luma(65))[Epoch])
    place(top + left, mkpath(ya, blue.darken(50%)))
    place(top + left, mkpath(yb, red.darken(20%)))
    place(top + left, mkpath(yc, luma(160)))
    markers(ya, blue.darken(50%))
    markers(yb, red.darken(20%))
  })
})

#let grouped-bar-chart = align(center, {
  let W = 248pt
  let H = 126pt
  let pl = 32pt
  let pr = 12pt
  let pt = 21pt
  let pb = 26pt
  let ih = H - pt - pb
  let years = (2020, 2021, 2022, 2023, 2024)
  let va = (62, 67, 71, 74, 78)
  let vb = (55, 58, 61, 65, 69)
  let maxv = 85.0
  let bw = 10.5pt
  let gap = 4pt
  let group-step = 40pt
  let ca = blue.darken(50%)
  let cb = red.darken(20%)
  box(width: W, height: H, stroke: luma(180) + 0.45pt, fill: luma(252), {
    place(top + left, dx: 8pt, dy: 5pt, text(size: 6.8pt, weight: "bold", fill: luma(25))[Mean score by cohort])
    place(top + left, dx: W - 58pt, dy: 5pt, box(width: 50pt, height: 13pt, fill: white, stroke: luma(220) + 0.35pt, {
      place(top + left, dx: 5pt, dy: 4pt, rect(width: 6pt, height: 5pt, fill: ca))
      place(top + left, dx: 14pt, dy: 3pt, text(size: 5.3pt, fill: luma(45))[A])
      place(top + left, dx: 27pt, dy: 4pt, rect(width: 6pt, height: 5pt, fill: cb))
      place(top + left, dx: 36pt, dy: 3pt, text(size: 5.3pt, fill: luma(45))[B])
    }))
    place(top + left, dx: pl + 3pt, dy: pt + 3pt, text(size: 5.2pt, fill: luma(75))[Score])
    for score in (20, 40, 60, 80) {
      let yp = H - pb - (score / maxv) * ih
      place(top + left, line(start: (pl, yp), end: (W - pr, yp), stroke: luma(222) + 0.45pt))
      place(top + left, dx: 9pt, dy: yp - 3.5pt, text(size: 5.2pt, fill: luma(70), str(score)))
    }
    place(top + left, line(start: (pl, pt), end: (pl, H - pb), stroke: luma(95) + 0.65pt))
    place(top + left, line(start: (pl, H - pb), end: (W - pr, H - pb), stroke: luma(95) + 0.65pt))
    for (i, yr) in years.enumerate() {
      let a = va.at(i)
      let b = vb.at(i)
      let x0 = pl + 11pt + float(i) * group-step
      let ha = (float(a) / maxv) * ih
      let hb = (float(b) / maxv) * ih
      place(top + left, dx: x0, dy: H - pb - ha, rect(width: bw, height: ha, fill: ca))
      place(top + left, dx: x0 + bw + gap, dy: H - pb - hb, rect(width: bw, height: hb, fill: cb))
      place(top + left, dx: x0 - 2pt, dy: H - pb + 3.5pt, text(size: 5.1pt, fill: luma(55), str(yr)))
      place(top + left, dx: x0 - 1pt, dy: H - pb - ha - 7pt, text(size: 4.8pt, fill: ca, str(a)))
      place(top + left, dx: x0 + bw + gap - 1pt, dy: H - pb - hb - 7pt, text(size: 4.8pt, fill: cb, str(b)))
    }
    place(top + left, dx: W / 2 - 9pt, dy: H - 9pt, text(size: 5.5pt, fill: luma(65))[Year])
  })
})

#slide(title: "Data Visualisation: Curves and Histogram (No Captions)")[
  #two-col(
    left-width: 49%,
    [
      The dataset (`assets/curves.csv`) tracks accuracy for two models and a random baseline over epochs $x in [0,5]$. The line chart below is introduced with enough text to test how plotted figures sit after ordinary explanatory prose.

      #fs-visual[#accuracy-chart]
      At epoch 5: *Model A* 92%, *Model B* 83%, well above the 50% baseline. The gap between models narrows after epoch 3. The paragraph after the chart intentionally spans multiple lines to make the visual-to-text spacing easy to compare.
    ],
    [
      Mean test scores for two groups tracked across five consecutive academic years. Both groups improve; *Group A* consistently leads. The grouped bar chart uses the same visual wrapper, so it should share the same spacing as other images and diagrams.

      #fs-visual[#grouped-bar-chart]
      The gap widens from 7 pts (2020) to 9 pts (2024), suggesting diverging learning trajectories. The extra line of commentary below the figure helps confirm that the lower margin remains consistent across chart types.
    ],
  )
]

#slide(title: "Data Visualisation: Curves and Histogram (With Captions)")[
  #two-col(
    left-width: 49%,
    [
      The dataset (`assets/curves.csv`) tracks accuracy for two models and a random baseline over epochs $x in [0,5]$. The line chart below is introduced with enough text to test how plotted figures sit after ordinary explanatory prose.

      #fs-figure(caption: [Accuracy vs. epoch for Model A, Model B, and random baseline.])[
        #accuracy-chart
      ]
      At epoch 5: *Model A* 92%, *Model B* 83%, well above the 50% baseline. The gap between models narrows after epoch 3. The paragraph after the chart intentionally spans multiple lines to make the caption-to-text spacing easy to compare.
    ],
    [
      Mean test scores for two groups tracked across five consecutive academic years. Both groups improve; *Group A* consistently leads. The grouped bar chart uses the same figure wrapper, so it should share the same spacing as other images and diagrams.

      #fs-figure(caption: [Mean test score by group and year (2020-2024).])[
        #grouped-bar-chart
      ]
      The gap widens from 7 pts (2020) to 9 pts (2024), suggesting diverging learning trajectories. The extra line of commentary below the figure helps confirm that the lower margin remains consistent across chart types.
    ],
  )
]

// ============================================================
// SECTION 8 -- THEOREM-STYLE BOXES
// ============================================================
#new-section("Theorem-style Boxes")
#section-slide("Theorem-style Boxes")

#slide(title: "Definitions, Theorems, and Lemmas")[
  #two-col(
    left-width: 49%,
    [
      #definition(name: "Metric Space")[
        A *metric space* $(M, d)$ is a set $M$ with $d: M times M -> RR_(>=0)$ satisfying non-negativity, identity ($d(x,y)=0 <=> x=y$), symmetry, and the triangle inequality.
      ]
      #theorem(name: "Banach Fixed-Point Theorem")[
        Let $(M, d)$ be complete and $f: M -> M$ a contraction with constant $k < 1$. Then $f$ has a *unique* fixed point $x^* in M$.
      ]
      #lemma()[
        Any contraction $f$ on $(M,d)$ is uniformly continuous and extends uniquely to the completion $overline(M)$.
      ]
    ],
    [
      #corollary(name: "Picard-Lindelof")[
        Under Lipschitz continuity in $y$, the IVP $dot(y)=f(t,y)$, $y(t_0)=y_0$ has a unique local solution.
      ]
      #proof[
        Apply Banach's theorem to the Picard operator $T phi = y_0 + integral_(t_0)^t f(s,phi(s)) d s$, which is contractive on $C([t_0-delta, t_0+delta])$ for small $delta > 0$.
      ]
      #remark(name: "Completeness is necessary")[
        On $(0,1)$ with $f(x)=x/2$, the fixed point $0$ lies outside the space -- Banach's theorem fails.
      ]
    ],
  )
]

#slide(title: "Examples, Exercises, Propositions, and Custom Boxes")[
  #two-col(
    left-width: 49%,
    [
      #example(name: "Euclidean Space")[
        $RR^n$ with $d(x,y)=norm(x-y)_2$ is complete. The iteration $x_(k+1)=A x_k+b$ converges iff $rho(A)<1$, to the unique solution of $x=A x+b$.
      ]
      #exercise()[
        Show that $ZZ_p$ is complete under the $p$-adic metric and use Banach's theorem to prove Hensel's lemma.
      ]
      #proposition(name: "Closed Subsets are Complete")[
        A closed subset of a complete metric space is itself a complete metric space.
      ]
    ],
    [
      #fs-box("note", name: "Implementation tip", color: green.darken(30%))[
        Monitor $norm(x_(k+1)-x_k)$ as a stopping criterion. A-priori error: $norm(x_k - x^*) <= k^m/(1-k) norm(x_1-x_0)$.
      ]
      #fs-box("warning", name: "Common pitfall", color: red.darken(20%))[
        Contraction ($k<1$) is strictly stronger than nonexpansive ($k=1$). Rotations on $S^1$ are nonexpansive but have no fixed points.
      ]
      #fs-box("custom", name: "Any label works", color: purple.darken(15%))[
        Use `#fs-box("kind", name: "...", color: ...)` for any label and color -- observations, facts, algorithms, warnings.
      ]
    ],
  )
]

#slide(title: "Custom Box Widths")[
  #fs-box("custom", name: "Default width", color: purple.darken(15%))[
    This box uses the default width, so it fills the available slide content area. It is the recommended form when the material belongs to the main flow of the slide.
  ]

  #align(center)[
    #fs-box("custom", name: "Narrow custom width", color: purple.darken(15%), width: 62%)[
      This box has a smaller explicit width. It is useful for short claims, reminders, or side notes that should not dominate the slide.
    ]
  ]

  #fs-box("custom", name: "Short content, default width", color: purple.darken(15%))[
    A short phrase.
  ]
]

#slide(title: "Full-Width Mathematical Proof")[
  #theorem(name: "Cauchy-Schwarz Inequality")[
    For all vectors $u, v in RR^n$,
    #fs-equation[$
      abs(u dot v) <= norm(u) norm(v).
    $]
  ]

  #proof[
    If $v = 0$, the claim is immediate, so assume $v != 0$. For every real $t$, the squared norm of $u - t v$ is non-negative:

    #fs-equation[$
      0 <= norm(u - t v)^2 = norm(u)^2 - 2 t (u dot v) + t^2 norm(v)^2.
    $]

    Choose the minimising value $t = (u dot v) / norm(v)^2$. Substitution gives

    #fs-equation[$
      0 <= norm(u)^2 - (u dot v)^2 / norm(v)^2.
    $]

    Multiplying by the positive number $norm(v)^2$, we obtain

    #fs-equation[$
      (u dot v)^2 <= norm(u)^2 norm(v)^2.
    $]

    Taking square roots on both sides yields $abs(u dot v) <= norm(u) norm(v)$. Equality occurs precisely when the non-negative quadratic has a zero at its minimum, which means $u - t v = 0$ for some scalar $t$; equivalently, the two vectors are linearly dependent.
  ]
]

#slide(title: "Narrow Mathematical Proof")[
  Proof environments fill the available content width by default, matching the rhythm of ordinary slide material. When a shorter line length reads better, pass an explicit `width` and center the proof as below.

  #align(center)[
    #proof(width: 68%)[
      We prove Young's inequality in its weighted quadratic form. Let $a, b >= 0$ and fix $epsilon > 0$. Since every square is non-negative,

      #fs-equation[$
        0 <= (sqrt(epsilon) a - b / sqrt(epsilon))^2.
      $]

      Expanding the square gives

      #fs-equation[$
        0 <= epsilon a^2 - 2 a b + b^2 / epsilon.
      $]

      Rearranging terms and dividing by $2$ yields

      #fs-equation[$
        a b <= epsilon a^2 / 2 + b^2 / (2 epsilon).
      $]

      This form is especially useful when a product term must be absorbed into a coercive estimate: one chooses $epsilon$ small enough for the first term and pays for it in the second term.
    ]
  ]
]

#slide(title: "Theorem Box with Internal Proof")[
  #theorem(name: "Cauchy-Schwarz Inequality")[
    For all vectors $u, v in RR^n$,
    #fs-equation[$
      abs(u dot v) <= norm(u) norm(v).
    $]

    #proof[
      If $v = 0$, the claim is immediate. Otherwise, the quadratic expression $norm(u - t v)^2$ is non-negative for every $t in RR$. Expanding and choosing $t = (u dot v) / norm(v)^2$ gives
      #fs-equation[$
        0 <= norm(u)^2 - (u dot v)^2 / norm(v)^2.
      $]
      Multiplying by $norm(v)^2$ and taking square roots yields the desired inequality.
    ]
  ]
]

#slide(title: "Exercise Box with Solution")[
  #exercise(name: "Spectral radius criterion")[
    Let $A in RR^(n times n)$ and suppose $norm(A) < 1$ for a matrix norm compatible with the vector norm. Prove that $I - A$ is invertible and derive a convergent series for its inverse.

    #box-separator("Solution", color: orange.darken(20%))

    Since $norm(A^k) <= norm(A)^k$, the Neumann series $sum_(k=0)^infinity A^k$ converges absolutely. Multiplying partial sums by $I-A$ gives $I - A^(m+1)$, which tends to $I$. Thus,
    #fs-equation[$
      (I - A)^(-1) = sum_(k=0)^infinity A^k.
    $]
  ]
]

#slide(title: "Exercise Box with Two Solutions")[
  #exercise(name: "Arithmetic-geometric mean")[
    Prove that for $x, y >= 0$ one has $sqrt(x y) <= (x + y) / 2$.

    #box-separator("Solution 1", color: orange.darken(20%))

    The square $(sqrt(x) - sqrt(y))^2$ is non-negative, so $x + y - 2 sqrt(x y) >= 0$.

    #box-separator("Solution 2", color: orange.darken(20%))

    The function $log$ is concave on $(0, infinity)$. Applying Jensen's inequality to $x$ and $y$ gives
    #fs-equation[$
      log((x + y) / 2) >= (log x + log y) / 2 = log(sqrt(x y)).
    $]
  ]
]

#slide(title: "Theorem, Text, and Lemma")[
  The next result is stated in the same theorem-style box used throughout the template. The surrounding prose is deliberately included to show how normal paragraphs sit before, between, and after formal statements.

  #theorem(name: "Compactness criterion")[
    Every sequence in a compact metric space has a convergent subsequence whose limit belongs to the same space.
  ]

  This theorem is often the bridge between qualitative assumptions and quantitative estimates. The intermediate text lets the slide show how ordinary prose separates theorem-style boxes without requiring a two-column layout.

  #lemma(name: "Closed image of a convergent sequence")[
    If $x_n -> x$ and $F$ is closed, then every sequence contained in $F$ can only converge to a point of $F$.
  ]

  Together, the theorem and lemma give a compact workflow: first extract convergence, then use closedness to keep the limiting object inside the admissible set. This final paragraph checks the lower spacing after the last formal box.
]

// ============================================================
// Thank you
// ============================================================
#thank-you-slide
