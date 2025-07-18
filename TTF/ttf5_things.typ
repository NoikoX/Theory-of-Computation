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
    tertiary: rgb("#dde4e9"),
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


// #components.adaptive-columns(outline(title: none, indent: 1em))

== Homework 

#idea()[
  #text(size:25pt)[
  Prove that the language
  $L = {a^n b^n :  n in NN}$ is not regular.
  \ Pumping lemma $=>$ $|w| = n > N$ can be decomposed as $w = x y z $ such that:\
  $|y| > 1,$ \
  $ |x y| <= N$ and you can pump on $y$.\
  $forall i in NN_0$. $x y^i z in L$ \
]
]

== Homework 
#text()[]
#task(title: "Task 1                                Regularity")[
  #text(size: 23pt)[
    Consider the string $w = #text(rgb("#fb3939"))[$a^N b^N$]$, for which $|w| > N$ is clear...\
    Next step is to find where the pumping block $y$ is.
    \
    Consider the substring $a^N$ and then $w = x y^i z, i in NN_0$\
    So we have $w = a^(N - k) a^k b^N$ where
    $x = a^(N-k), y = a^k$ and $z = b^N$ \
    We attempt to pump out the pumping block $y$ once, and obtain the \ string #text(rgb("#ff3e3e"))[$a^(N - k) b^N$] where $k > 0$
    this string is supposed to belong to the language $L$ according to the pumping lemma but as you can see we found a contradiction.
    
  ]
]


#slide()[
  #task(title: text()[
  Task 2 $<==>$ Lemma 4 & Pumping lemma for CFLs
])[
    #text(size: 19pt)[
      #text(fill: rgb("#0d01ea"))[*Lemma 4*] $<==>$ *Theorem 1.49, chapter 1, page 62.* 
      #text(font: "CodeNewRoman Nerd Font Mono")[
        #align(right)[Introduction to the Theory of Computation(Third edition)]
        #align(right)[Michel Sipser.] 
      ]
      
      *Theorem 2.34* $<==>$ #text(font: "CodeNewRoman Nerd Font Mono")[Again the same book, *page 125..*]

    ]
  ]
]
#slide()[
  #task(title: text()[Task 4 $<==>$ Regularity])[
    #text(size: 20pt)[
      $L = {1^n | n  #text()[is prime]}$ is not regular. \
      For pumping length $N$, since there exists arbitrary large prime numbers, there is $p > N$, $1^p = u v x$ and $u v^i x in L$ for all $i$. \
      Say $|v| = k$, we take $i = p - k,$ then $|u v^(p - k)x| = k(p-k) + (p-k)=$ \ $=(p-k)(k+1)$, so $u v^(p-k) x = 1^((p-k)(k+1)) in L$. (#text(rgb("#ff3939"))[Contradiction]) \
      $
        (p-k)(k+1) "is definitely not a prime.."
      $
      

    ]
  ]
]


== Homework Task 5

#slide()[
  $ G = ({S, A, B}, {a, b}, P, S) $ \ Construct NFA With productions 
  $P:$ \
  $ 
    S &->a S \
    S &-> a A \
    A &-> b S \
    A &-> a B \
    B &-> b S \
    S &-> a
    
  $

]








#slide()[
  
  

#align(center)[
  #fletcher-diagram(
  node-stroke: .1em,
  node-fill: gradient.radial(green.lighten(90%), rgb("#5bc7d3"), center: (30%, 20%), radius: 50%),
  spacing: 3em,
  edge((-1, 0), "r", "-|>", ``, label-pos: 0, label-side: center),
  node((0, 0), `S`, radius: 2em),
  node((0, 1), `a`, radius: 2em, extrude: (-2.5, 0)),
  edge((0, 0), (0, 0), `a`, "<|-", bend: 120deg),
  edge((0, 0), (1, 0), `a`, "-|>", bend: 25deg),
  edge((1, 0), (0, 0), `a`, "-|>", bend: 25deg),
  edge((1, 0), (0, 0), `b`, "-|>", bend: 65deg),
  edge((1, 0), (2, 0), `a`, "-|>", bend: 25deg),
  edge((2, 0), (0, 0), `b`, "-|>", bend: 75deg),
  edge((0, 0), (0, 1), `a`, "-|>", bend: 0deg),

  // edge(`read()`, "-|>"),
  node((1, 0), `A`, radius: 2em),
  
  // edge(`close()`, "-|>"),
  // node((2, 0), `b`, radius: 2em, extrude: (-2.5, 0)),
  node((2, 0), `B`, radius: 2em),
  // edge((0, 0), (2, 0), `close()`, "-|>", bend: -40deg),
)
]
]


== Blank

#slide()[
  #text(size: 24pt)[
    // Consider regular expression: $$
    #hide()[a]
  ]
]

== Exercise 1
#slide()[
  #text(size: 20pt)[
    #align(left)[
      Consider regular expression: $(1 union 0)^*01^*$ \

      Construct 1) NFA; 2) Regular Grammar
      \
      \
      \
      \
      \
      \
      \
      \
      \
      \
      \
      \
      \
      
    ]
    
  ]
]

#slide()[
  #align(center)[
    #fletcher-diagram(
  node-stroke: .1em,
  node-fill: gradient.radial(green.lighten(90%), rgb("#cd4141"), center: (40%, 20%), radius: 50%),
  spacing: 3em,
  edge((-1, 0), "r", "-|>", ``, label-pos: 0, label-side: center),
  node((0, 0), `S`, radius: 3em),
  node((1, 0), `T`, radius: 3em, extrude: (-2.5, 0)),

  edge((0, 0), (0, 0), `0,1`, "-|>", bend: 120deg),
  edge((0, 0), (1, 0), `0`, "-|>", bend: 0deg),
  edge((1, 0), (1, 0), `1`, "-|>", bend: 120deg )
  
  
)
\
#align(left)[
  $(1 union 0)^*01^*$
]
  ]
]


#slide()[
  #text(size: 40pt)[
    $
      S &-> 0S | 1S | 0T \
      T &-> 1T | epsilon


    $
  ]
]

== Exercise 2 (Which of the following L is regular)

#slide()[
  #text(size: 30pt)[${a^n b^m | n >= m or n <= m}$] \ \ \ \ \ \ \ \ \ \ \
]

#slide()[
  #text(size: 30pt)[${a^n b^m | n >= m or n <= m}$] \ \ is the same as #text(size: 30pt)[$a^ast.op b^ast.op$] 
  so its regular..
  
  
   \ \ \ \ \  \ 
  
]

#slide()[
  #text(size: 30pt)[${a^n b^m | n > m and n < m}$] \ \ \ \ \ \ \ \ \ \ \
]

#slide()[
  #text(size: 30pt)[${a^n b^m | n > m or n < m}$] \ \
  is empty $  ==>$ regular
  
  
   \ \ \ \ \  \ 
  
]

#slide()[
  #text(size: 30pt)[${a^n b^m | n >= m and n <= m}$] \ \ \ \ \ \ \ \ \ \ \
]

#slide()[
  #text(size: 30pt)[${a^n b^m | n >= m and n <= m}$] \ \
  is the same as #text(size: 30pt)[$a^n b^n$] $=>$ not regular (already seen why)
  
  
  
   \ \ \ \ \  \ 
  
]


#slide()[
  #text(size: 30pt)[${a^n b^m | n > m or n < m}$] \ \ \ \ \ \ \ \ \ \ \
]

#slide()[
  #text(size: 30pt)[${a^n b^m | n > m or n < m}$] \ \
  It is the same language as $&{a^n b^m | n != m}$ \
  which is complement to #h(55pt) $&{a^n b^m | n = m}$.
  \
  \

  Since regularity is *closed under complementation*, the considered language can not be regular. \ (cuz it would imply that ${a^n b^m | n = m}$ is regular)
  
  
  
    \ \ \  
  
]


== Chomsky normal form

#slide()[
  
  #abstract(title: [])[
    - $A -> B C $ #h(5pt)with $A, B, C in N$ \
  - $A -> b space  space space space$ with $A in N$ and $b in T$
  - $S -> epsilon$ \
  every context free grammar can be transformed into Chomsky normal form

  ]
  
  
]

#slide()[
  #text(size: 22pt)[
  1. Start symbol does not appear on right (add $S' -> S$)
  2. Eliminate right hand sides with more than $2$ symbols $P: n -> a_1 dots a_s$ where $s >= 2$, introduce a new non terminal $x$ $  n ->a_1 dots a_(s-2)x,space space space x -> a_(s-1)a_s$, repeat until `len(rhs) <=2`
  3. Eliminate $epsilon$ rules, for all non terminals 1..m (besides S) \        for `i = 1 to m:` if $n_i -> epsilon: $ \
    i) #h(10pt)drop this rule \
    ii) for each rule with $n_i$ on the right side add a rule where each occurence of $n_i$ is dropped
    $
      n &-> x n_i "or" n-> n_i x : "add" n-> x\
      n_k &-> n_i n_i and k > i : "     add" n -> epsilon
    $
  
  4. for all chain rules between nonterminals $A -> B$ \ with $A, B in N$ drop $A -> B$ and for all productions
    \ $ B -> u: "add" A -> u $
    repeat until no chain rules between nonterminals are left
  5. What about $A -> b C$ ? \
    add a nonterminal $X$ and do the following: $ X -> b, A -> X C $ thats it..
  ]
]

== Convert Grammar into Chomsky normal form
#let Left_text = $
    S &-> A B | a B \
    A &-> a a b | epsilon \
    B &-> b b A
  $
#slide()[
  #text(size: 40pt)[
    $
    S &-> A B | a B \
    A &-> a a b | epsilon \
    B &-> b b A
  $
  ]
  
  // #grid(
  // columns: (1fr, 1fr),
  // [#align(left)[#Left_text]], [#align(right)[Right_text]],
  // )
]

== Eliminate epsilon rules
#slide()[
  #grid(
  columns: (1fr, 1fr),
  [#align(left)[#Left_text]], [#align(right)[
    $
    S &-> A B | B | a B \
    A &-> a a b \
    B &-> b b A | b b
  $
  ]],
  )

]

== Removal of the unit-production
#slide()[
  #grid(
  columns: (1fr, 1fr),
  [#align(left)[
    $
    S &-> A B | B | a B \
    A &-> a a b \
    B &-> b b A | b b
  $
  ]], [#align(right)[
    $
    S &-> A B | b b A |  a B | b b \
    A &-> a a b \
    B &-> b b A | b b
  $
  ]],
  )

]

== Make RHS <=2
#slide()[
  #grid(
  columns: (1fr, 1fr),
  [#align(left)[
    $
    S &-> A B | b b A |  a B | b b \
    A &-> a a b \
    B &-> b b A | b b
  $
  ]], [#align(right)[
    $
    S &-> A B | V_b V_b A |  V_a B | V_b V_b \
    A &-> V_a V_a V_b \
    B &-> V_b V_b A | V_b V_b
  $
  ]],
  )

]

== Final result
#slide()[
  #grid(
  columns: (1fr, 1fr),
  [#align(left)[
    $
    S &-> A B | V_b V_b A |  V_a B | V_b V_b \
    A &-> V_a V_a V_b \
    B &-> V_b V_b A | V_b V_b
  $
  ]], [#align(right)[
    $
    S &-> A B | V_c A |  V_a B | V_b V_b \
    A &-> V_d V_b \
    B &-> V_c A | V_b V_b \
    V_c &-> V_b V_b \
    V_d &-> V_a V_a \
    V_a &-> a \
    V_b &-> b \
    

  $
  ]],
  )
  thats it..(hope u undertand how it works)

]
== Bye
#slide()[
  // #text(size: 50pt)[
  //   Bye
  // ]
  #align(center)[
    #image("../Images/Rei.jpg", width: 90%, height: 90%, scaling: "smooth")
  ]
]
