# formal-slides

A Typst presentation template with a square, minimal, academic design language: a solid navigation bar on top, a two-level footer with page number, a tinted title strip for regular content slides, and compact box environments without wasted whitespace.

---

## Quick start

```typst
#import "formal-slides.typ": *

#show: formal-slides.with(
  title:       "My Presentation",
  subtitle:    "An optional subtitle",
  institution: "Institution Name",
  authors:     ("Alice", "Bob"),
  date:        "May 2025",
  ratio:       16/9,
  title-color: rgb("#1C1C1C"),
  secondary-color: rgb("#D9D9D9"),
)

#new-section("Introduction")
#section-slide("Introduction")

#slide(title: "First slide")[
  - Bullet one
  - Bullet two
]

#thank-you-slide
```

Compile with:

```bash
typst compile example.typ example.pdf --font-path assets/fonts
```

For VS Code + Tinymist, the workspace already includes `.vscode/settings.json` with `tinymist.fontPaths = ["assets/fonts"]`, so IBM Plex is discovered automatically inside this repository.

---

## Template parameters (`formal-slides.with(...)`)

| Parameter | Description | Default |
|-----------|-------------|---------|
| `title` | Title shown on the title slide and footer | **required** |
| `subtitle` | Subtitle shown on the title slide and footer | `none` |
| `institution` | Institution name shown on the title slide and footer | `none` |
| `institute` | Backward-compatible alias for `institution` | `none` |
| `authors` | String or array of strings | `none` |
| `date` | Date string shown on title slide | `none` |
| `ratio` | Slide aspect ratio (e.g. `16/9`, `4/3`) | `4/3` |
| `title-color` | Primary color for bars, boxes, and highlights | `rgb("#1C1C1C")` |
| `secondary-color` | Secondary color for the title/footer bands | `rgb("#D9D9D9")` |
| `bg-color` | Slide background color | `white` |
| `toc` | Whether to show the table of contents slide | `true` |
| `footer-title` | Custom left footer text (defaults to `title`) | `auto` |
| `footer-subtitle` | Custom center footer text (defaults to `subtitle`) | `auto` |
| `logo` | Path to a logo image shown on the title slide | `none` |

When `logo` is `none` the template renders a small `typst` wordmark as a placeholder.

---

## Fonts

The template uses three IBM Plex families. The font files are included in `assets/fonts/` so no external installation is needed.

| Role | Font |
|------|------|
| Body text | IBM Plex Serif |
| Titles and UI elements | IBM Plex Sans |
| Code and verbatim | IBM Plex Mono |

Fallback chains include Liberation and DejaVu, so the template works even if the IBM Plex files are unavailable.

---

## Slide functions

### `#slide(title: "...", body)`

Standard content slide. Content is vertically centred in the available area.

```typst
#slide(title: "My Slide")[
  Content goes here.
]
```

### `#new-section("Name")`

Registers a section (increments section counter, resets figure and theorem counters, updates the navigation bar label).

### `#section-slide("Name")`

Renders a full-page section divider. Typically called right after `#new-section`.

### `#new-subsection("Name")`

Registers a subsection in the TOC without rendering a divider slide.

### `#thank-you-slide`

A centered italic "Thank You" slide. No parentheses — this is a content value, not a function call.

---

## Layout helpers

### `#two-col(left, right, left-width: 48%, gutter: 4%)`

Splits the slide into two columns.

```typst
#two-col(
  [Left column content],
  [Right column content],
  left-width: 55%,
)
```

---

## Figures

### `#fs-figure(caption: [...], body)`

Numbered figure. The counter resets at each `#new-section`. Reference by number in surrounding text.

```typst
#fs-figure(caption: [A diagram showing the architecture.])[
  #image("diagram.svg", width: 80%)
]
```

---

## Theorem-style boxes

All boxes display a colored header with `Kind N.M` (section.number) and an optional name panel.

| Function | Default color |
|----------|---------------|
| `#theorem(name: "...", body)` | `blue.darken(50%)` |
| `#lemma(name: "...", body)` | `blue.darken(30%)` |
| `#corollary(name: "...", body)` | `blue.darken(40%)` |
| `#proposition(name: "...", body)` | `teal.darken(30%)` |
| `#definition(name: "...", body)` | `purple.darken(20%)` |
| `#example(name: "...", body)` | `green.darken(30%)` |
| `#exercise(name: "...", body)` | `orange.darken(20%)` |
| `#remark(name: "...", body)` | `luma(90)` |
| `#proof(body)` | left-border style |
| `#fs-box("kind", name: "...", color: ..., body)` | any color |

The `color:` parameter can be overridden on any box. `#fs-box` accepts any string as the kind label.

```typst
#theorem(name: "Banach Fixed-Point Theorem")[
  Let $(M, d)$ be a complete metric space and $f$ a contraction. Then $f$ has a unique fixed point.
]

#fs-box("warning", name: "Careful!", color: red.darken(20%))[
  Do not confuse contractions with nonexpansive maps.
]
```

## Code and pseudo-code boxes

Code fragments and pseudo-code can use the same framed header style as theorem boxes, with a `type` label and optional `title`.

| Function | Purpose |
|----------|---------|
| `#code-box("...", type: "...", title: "...", lang: "...")` | Source code with optional syntax highlighting |
| `#pseudo-code("...", type: "...", title: "...")` | Pseudo-code with the same box chrome |

```typst
#code-box(
  "def train_step(x):\n  return model(x)",
  type: "Source Code",
  title: "Python",
  lang: "python",
)

#pseudo-code(
  "for t <- 1 to T\n  update theta\nend",
  title: "Training Loop",
)
```

---

## Example slides (`example.typ`)

The file `example.typ` is a complete demo presentation covering all template features. Below is a summary of each section.

### Section 1 — Typography
- **Slide 1**: Side-by-side comparison of the three IBM Plex families (Serif, Sans, Mono) with representative weight and style variants.
- **Slide 2**: Size scale from 8 pt to 18 pt; semantic use of bold, italic, color, and underline.

### Section 2 — Lists & Enumerations
- **Slide 3**: Unordered bullet list (3 levels) and ordered enumeration (3 levels) side by side in two columns.

### Section 3 — Figures
- **Slide 4**: Two numbered figures with placeholder rectangles and captions. Explains how to replace placeholders with real images.

### Section 4 — Layouts
- **Slide 5**: A two-column layout with explanatory text on the left and a content block on the right.

### Section 5 — Code Blocks
- **Slide 6**: Python source code and pseudo-code side by side, both rendered as framed boxes with a theorem-style `type | title` header.

### Section 6 — Tables
- **Slide 7**: Paper-style booktabs table (horizontal rules only) and grid-style table (full borders, colored header, alternating row shading) side by side.

### Section 7 — Diagrams & Charts
- **Slide 8**: Two block diagrams — a Transformer encoder block (matching the original color scheme: orange FFN, blue Add & Norm, green attention) and a state-space system block diagram.
- **Slide 9**: A linear-algebra kernel/image decomposition diagram and a three-state Markov chain transition graph with labeled arcs.
- **Slide 10**: A line chart of model accuracy vs. epoch (data from `assets/curves.csv`) and a grouped bar histogram of test scores by group and year (2020–2024).

### Section 8 — Theorem-style Boxes
- **Slide 11**: `#definition`, `#theorem`, `#lemma`, `#corollary`, and `#proof` environments demonstrated with the Banach fixed-point theorem and Picard–Lindelöf corollary.
- **Slide 12**: `#example`, `#exercise`, `#proposition`, and three `#fs-box` calls with custom kind labels ("note", "warning", "custom") and custom colors.

---

## Repository layout

```
formal-slides/
├── formal-slides.typ       # Template — import this
├── example.typ             # Full demo presentation
├── example.pdf             # Pre-compiled demo PDF
├── assets/
│   ├── fonts/              # IBM Plex Serif / Sans / Mono TTF files
│   └── curves.csv          # Sample data for the line chart slide
└── README.md
```

---

## License

The template code is released under the MIT License. The IBM Plex fonts are distributed under the [SIL Open Font License 1.1](https://scripts.sil.org/OFL).
