#import "@preview/blackboard-frame:0.1.0": *

#let presentation-config = (
  title: "My Presentation",
  subtitle: "An optional subtitle",
  authors: "Author Name",
  institution: "Institution Name",
  date: "May 2026",
  final-message: "Thank you for your attention",
  TOC: true,
)

#show: blackboard-frame.with(config: presentation-config)

#new-section("Introduction")

#slide(title: "First slide")[
  - First point
  - Second point
]

#thank-you-slide
