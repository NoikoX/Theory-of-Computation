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
  fill: gray,
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
  These exercises are not mandatory..

  if you have extra time to practice on them, go ahead
]

== Exercises about TMs

#slide()[

  #text(30pt)[
    1. Construct a regular Turing Machine that       tests whether a binary input has exactly one zero
  ]
]



#slide()[

  #text(28pt)[
     2. Explain what the following Turing Machine does if an input is a string from: ${x, y, X, Y}^*$
     \
     $
       delta(z_0, x) &= (z_0, X, R), #h(3cm) delta(z_0, X) = (z_0, X, R),\
       delta(z_0, y) &= (z_0, Y, R),
       #h(3.123cm) delta(z_0, Y) = (z_0, Y, R),
       \
       delta(z_0, B) &= (z_("acc"), B, R),\
     $
      
     
  ]
]


#slide()[
  #text(28pt)[
    3. Give a description of a Turing Machine that converts binary input to unary
    #text(18pt)[
      (you dont have to construct it, just the idea)
    ]
    #align(right)[
      #text(rgb("#3b52c4"))[
      (use as many tapes as u want)
    ]
    ]

    For example: 
    $ 
      101 &--> 11111 \
      11 &--> 111 \
      underbrace(111, "7 in binary") &--> underbrace(1111111, "seven 1s")
      
    $
    
  ]
]


#slide()[
  #text(28pt)[
    4. Now give a description of a Turing Machine that converts unary input to binary
    #align(right)[
      #text(rgb("#3b52c4"))[
      (use as many tapes as u want again)
    ]
    ]

    For example: 
    $ 
      1111 &--> 100 \
      underbrace(111111, "six 1s") &--> underbrace(110, "six in binary")
      
    $
    
  ]
]


#slide()[
  #text(25pt)[
    5. TM is given $M = ({z_0, z_1, z_2}, {0, 1, B}, delta, z_0, {z_2})$ 
      and transition function:
    
    #align(center)[
      $delta: {z_0, z_1} times {0, 1, B} -> {z_0, z_1, z_2} times {0, 1, B} times {L, N, R}$
    ]
    given by:
    $
      delta(z_0, 0) = (z_0, 0, R), #h(1.6cm) 
      delta(z_0, 1) = (z_1, 1, R), #h(1.6cm)
      delta(z_0, B) = (z_0, B, N) \
      
      delta(z_1, 1) = (z_1, 0, N), #h(1.6cm)
      delta(z_1, 1) = (z_2, 1, R), #h(1.6cm)
      delta(z_1, B) = (z_1, B, N)
    $
  
  ]
  
]
#slide()[
  #text(24pt)[
    1. Give an example of an accepting computation of $M$. Give an example of a rejecting (not halting) computation of $M$


    2. Describe the language $L_M$ accepted by $M$



    3. Is $M$ $n$-time bounded? Is $M$ $n$-space bounded?
  ]
]

#slide()[
  #text(32pt)[#align(center+top)[*YES or NO questions*]]

  1. can a turing machine write the blank symbol on its tape?
  2. can the tape alphabet be the same as the input alphabet?
  3. can a turing machine's head ever be in the same location in two successive steps?

]

#slide()[
  #text()[
    Solutions are here -->    #text(purple)[#link("https://matias.me/nsfw/")]
  ]
]

