#import "@preview/touying:0.5.5": *
#import themes.university: *
#import "@preview/cetz:0.3.1"
#import "@preview/fletcher:0.5.3" as fletcher: node, edge
#import "@preview/ctheorems:1.1.3": *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/gentle-clues:1.1.0": *
#set text(
  font : "CodeNewRoman Nerd Font Mono"
)

// cetz and fletcher bindings for touying
#let cetz-canvas = touying-reducer.with(reduce: cetz.canvas, cover: cetz.draw.hide.with(bounds: true))
#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)

// Theorems configuration by ctheorems
#show: thmrules.with(qed-symbol: $square$)
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#95a095"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))
#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

#show: university-theme.with(
  color-a: rgb("#e63939"),
  color-b: rgb("#c8dc44"),
  aspect-ratio: "16-9",
  config-colors(
    primary: rgb("#607d8b"),
    secondary: rgb("#1a1f24"),
    tertiary: rgb("#5c7e97"),
    neutral-lightest: rgb("#fafcfd"),
    neutral-darkest: rgb("#050709"),
  ),
//   config-colors(
//   primary: rgb("#41b0dc"),
//   secondary: rgb("#9f6a9a"),
//   tertiary: rgb("#2b9db3"),
//   neutral-lightest: rgb("#ffffff"),
//   neutral-darkest: rgb("#000000"),
// ),
  align: horizon,
  config-common(handout: true),
  config-info(
    title: [Theory of Computation],
    
    author: [Noe Lomidze],
    date: datetime.today().display(),
    institution: [Kutaisi International University],
    
  ),
)

// #set heading(numbering: numbly("{1}.", default: "1.1"))
#set math.equation(numbering: "(1)")

#let eqnum(num) = text(
  fill: blue,
  [(#num)]
)

#set math.equation(numbering: eqnum)



// #title-slide()
#title-slide(
  authors: ("Noe Lomidze"),
  title: "Theory of Computation",
  subtitle: "G-4",
  date: datetime.today().display(),
  institution-name: "Kutaisi International University",
  // logo: image("Images/thumbnail_KIU2-1.png", width: 18%)
  
)



#slide()[
  
  
  
  #align(center)[#text(40pt)[
    #align(center)[*Construct a TM for language* ]
  ]]
    
  \
  \
  

  #text(28pt)[
    $
    {w | w in BB^*, "contains an equal number of 0s and 1s"}
  $
  ]
]

#slide()[
  $delta(z_0, 0) = (z_1, X, R)\
  delta(z_1, 0 "or" X) = (z_1, 0 "or" X, R) space space <==> z_1 "searches for the matching" 1\
  delta(z_1, 1) = (z_3, X, L) #h(4.88cm) <==> z_3 "goes all the way left" \
  delta(z_3, 0 "or" 1 "or" X) = (z_3, 0 "or" 1 "or" X, L) \
  delta(z_3, B) = (z_0, B, R) \
  delta(z_0, X) = (z_0, X, R) #h(4.4cm) <==>"skips all the" X \
  delta(z_0, 1) = (z_2, X, R) \
  delta(z_2, 1 "or" X) = (z_2, 1 "or" X, R) space space <==> z_2 "searches for the matching" 0 \
  delta(z_2, 0) = (z_3, X, L)
  $
  
  #text(rgb("#25b822"), weight: "bold", size: 25pt)[
    $#h(7cm)"finally " delta(z_0, B) = (z_("accept"), B, L)$
  ]
]

#slide()[
  #align(center)[
    #text(40pt)[
      *What about reject?..*
    ]
  ]
]
#slide()[
  #text(30pt, red)[
    $
    delta(z_1, B) = (z_("reject"), B, L) \
    delta(z_2, B) = (z_("reject"), B, L )
  $

  

 ]
 #text(30pt)[
  $z_1$ searches for the matching $1$ \ $z_2$ searches for the matching $0$

  if they read $B$ while searching, it means that there is no matching symbol..
 ]
]

== Example 

#let xx = text(red)[$X$]

#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, $0$, $0$, $1$, $1$, $B$, "...",
  )

  ]
  #h(10.1cm) #sym.arrow.t

  $
    delta(z_0, 0) = (z_1, X, R)
  $

  \ $z_1$ starts to search for a matching $1$
]

#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, $0$, $1$, $1$, $B$, "...",
  )

  ]
  #h(12.1cm) #sym.arrow.t

  $
    delta(z_1, 0 "or" X) = (z_1, 0 "or" X, R)
  $
  
  


]



#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, $0$, $1$, $1$, $B$, "...",
  )

  ]
  #h(14.0cm) #sym.arrow.t

  $
    delta(z_1, 1) = (z_3, X, L)
  $

  $z_1$ found a matching 1, it marks it as X and goes all the way to the left..
  
  using $z_3$ which has only one job to go left until $B$


]

#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, $0$, xx, $1$, $B$, "...",
  )

  ]
  #h(12.0cm) #sym.arrow.t

  $
    delta(z_3, 0 "or" 1 "or" X) = (z_3, 0 "or" 1 "or" X, L)
  $

  


]
#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, $0$, xx, $1$, $B$, "...",
  )

  ]
  #h(9.97cm) #sym.arrow.t

  $
    delta(z_3, 0 "or" 1 "or" X) = (z_3, 0 "or" 1 "or" X, L)
  $

  


]

#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, $0$, xx, $1$, $B$, "...",
  )

  ]
  #h(7.8cm) #sym.arrow.t

  $
    delta(z_3, B) = (z_0, B, R)
  $

  


]


#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, $0$, xx, $1$, $B$, "...",
  )

  ]
  #h(9.9cm) #sym.arrow.t

  $
    delta(z_0, X) = (z_0, X, R)
  $

  $z_0$ skips all the #xx and moves to the right

  


]


#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, $0$, xx, $1$, $B$, "...",
  )

  ]
  #h(11.9cm) #sym.arrow.t

  $
    delta(z_0, 0) = (z_1, X, R)
  $

  $z_1$ again starts to search for a matching $1$ 

  


]

#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, xx, xx, $1$, $B$, "...",
  )

  ]
  #h(14.1cm) #sym.arrow.t

  $
    delta(z_1, 0 "or" X) = (z_1, 0 "or" X, R)
  $

  $z_1$ ignores 0s and Xs and moves to the right

  


]


#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, xx, xx, $1$, $B$, "...",
  )

  ]
  #h(16.1cm) #sym.arrow.t

  $
    delta(z_1, 1) = (z_3, X, L)
  $

  Found a matching one, time to go all the way left..

  


]


#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, xx, xx, xx, $B$, "...",
  )

  ]
  #h(14.0cm) #sym.arrow.t

  $
    delta(z_3, 0 "or" 1 "or" X) = 
    (z_3, 0 "or" 1 "or" X, L)
  $

 


]

#slide()[
  #align(center)[
    #text(100pt)[
      $...$
    ]
  ]
]



#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, xx, xx, xx, $B$, "...",
  )

  ]
  #h(7.4cm) #sym.arrow.t

  $
    delta(z_3, B) = 
    (z_0, B, R)
  $

 


]



#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, xx, xx, xx, $B$, "...",
  )

  ]
  #h(9.6cm) #sym.arrow.t

  $
    delta(z_0, X) = 
    (z_0, X, R)
  $

  skips all the Xs and moves to the right


 


]


#slide()[
  #align(center)[
    #text(100pt)[
      $...$
    ]
  ]
]

#slide()[


// Tape cells
  #align(center)[
  #table(
  columns: 8,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, xx, xx, xx, $B$, "...",
  )

  ]
  #h(18.4cm) #sym.arrow.t

  $
    delta(z_0, B) = 
    (z_("accept"), B, L)
  $

  #text(rgb("#07d10a"))[it accepts..]
  

 


]

== Another example

#slide()[



  #align(center)[
  #table(
  columns: 6,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, $0$, $0$, $B $, "...",
  )

  ]
  #h(12cm) #sym.arrow.t

  $
    delta(z_0, 0) = (z_1, X, R)
  $


  $z_1$ starts searching
]



#slide()[



  #align(center)[
  #table(
  columns: 6,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, $0$, $B$, "...",
  )

  ]
  #h(14cm) #sym.arrow.t

  $
    delta(z_1, 0 "or" X) = (z_1, 0 "or" X, R)
  $


]



#slide()[



  #align(center)[
  #table(
  columns: 6,
  stroke: 3pt,
  align: center,
  inset: 20pt,
  "...", $B$, xx, $0$, $B$, "...",
  )

  ]
  #h(16cm) #sym.arrow.t

  $
    delta(z_1, B) = (z_("reject"), B, L)
  $

  $z_1$ couldnt find the matching 1 so it #text(red)[rejects..]


]



