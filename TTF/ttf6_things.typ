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


// #components.adaptive-columns(outline(title: none, indent: 1em))

== Random exercises

#slide()[
  #task(title : [Is it Regular? Context Free?...])[
  #text(size: 21pt)[
    $L = {w in {0, 1}^* | w = "reverse"(w) "and the length of" w "is divisible by" 4}$
  ]

  - if you think its regular, try constructing a \ DFA/NFA..
  - if you think its context free, try constructing its grammar/NPDA..

  ]
]

#slide()[
  #text(size: 34pt)[
    *Answer:* $L$ is CFL, $
    G = (N, T, P, S), space N = {S}, space  T = {0, 1}, 
    $\
    starting variable $S$, and rules:
    #text(size: 30pt)[$
      P = {S -> 00S 00 | 01S 10 | 10S 01 | 11S 11 | epsilon}
    $ ]
  ]

]


#slide()[
  #align(center)[

    #fletcher-diagram(
    node-stroke: .1em,
    node-fill: gradient.radial(green.lighten(90%), rgb("#90f386"), center: (30%, 20%), radius: 50%),
    spacing: 4em,
    edge((-1, 0), "r", "-|>", ``, label-pos: 0, label-side: center),
    node((0, 0), text()[$q_1$], radius: 1.1em, extrude: (-2.5, 0)),
    node((1, 0), text()[$q_2$], radius: 1.1em),
    node((3, 0), text()[$q_4$], radius: 1.1em),
    node((4, 0), text()[$q_6$], radius: 1.1em, extrude: (-2.5, 0)),
    node((1, 1), text()[$q_3$], radius: 1.1em),
    node((3, 1), text()[$q_5$], radius: 1.1em),
    edge((0, 0), (1, 0), text()[$epsilon, epsilon -> dollar$], "-|>", bend: 1deg),
    edge((1, 0), (3, 0), text()[$epsilon, epsilon -> epsilon$], "-|>", bend: 1deg),
    edge((3, 0), (4, 0), text()[$epsilon, dollar -> epsilon$], "-|>", bend: 1deg),

    edge((1, 0), (1, 1), 
    text(size: 20pt)[$0, epsilon ->0 \ 1, epsilon -> 1$
    
    ], "-|>", bend: -10deg),

    edge((1, 1), (1, 0), 
    text(size: 20pt)[$0, epsilon ->0 \ 1, epsilon -> 1$
    
    ], "-|>", bend: -10deg),

    edge((3, 0), (3, 1), 
    text(size: 20pt)[$0, 0 ->epsilon \ 1, 1 -> epsilon$
    
    ], "-|>", bend: -10deg),

    edge((3, 1), (3, 0), 
    text(size: 20pt)[$0, 0 ->epsilon \ 1, 1 -> epsilon$
    
    ], "-|>", bend: -10deg),
    // node((0, 1), `a`, radius: 2em, extrude: (-2.5, 0)),
    // edge((0, 0), (0, 0), `a`, "<|-", bend: 120deg),
    // edge((0, 0), (1, 0), `a`, "-|>", bend: 25deg),
    // edge((1, 0), (0, 0), `a`, "-|>", bend: 25deg),
    // edge((1, 0), (0, 0), `b`, "-|>", bend: 65deg),
    // edge((1, 0), (2, 0), `a`, "-|>", bend: 25deg),
    // edge((2, 0), (0, 0), `b`, "-|>", bend: 75deg),
    // edge((0, 0), (0, 1), `a`, "-|>", bend: 0deg),

    // edge(`read()`, "-|>"),
    // node((1, 0), `A`, radius: 2em),
    
    // // edge(`close()`, "-|>"),
    // // node((2, 0), `b`, radius: 2em, extrude: (-2.5, 0)),
    // node((2, 0), `B`, radius: 2em),
    // // edge((0, 0), (2, 0), `close()`, "-|>", bend: -40deg),
    )
  ]
  
]



#slide()[
  #align(center)[
    #text(size: 40pt)[Is it regular?]
  ]
]
#slide()[
  #text(20pt)[
    Lets prove that $L$ is not regular by contradiction, suppose its regular,let $p$  be the pumping length.. consider string
    $s = 0^p 1^(2p)0^p in L$
    $|s|=4p>p$ so the conclusions of the pumping lemma must hold, thus we can split $s = x y z$ $(1) x y^i z in L space forall. i>=0, (2)|y|>0 "and" (3) |x y|<=p$. because all of the first $p$ symbols of $s$ are 0s, $(3)$ implies that $x$ and $y$ must only consist of 0s. Also $z$ must consist of the rest of the  0s at the beginning, followed by $1^(2p)0^p$.
    \
    $x = 0^j, y=0^k, z = 0^m 1^(2p) 0^p$ where $j + k + m = p$.. $(2) "implies that" k > 0$ so by $(1)$ $x y y z$ must belong to $L$.
    $
      x y y z = 0^j 0^k 0^k 0^m 1^(2p) 0^p = 0^(p + k) 1^(2p) 0^p in.not L space space space #text(fill: red, size:30pt)[contradiction] 
    $
  ]
]


// == So far so good?...

// #slide()[
//   // #text(size: 50pt)[
//   //   Bye
//   // ]
//   #align(center)[
    
//     #image("Images/Lyzaaa.jpg", width: 90%, height: 90%, scaling: "smooth")
//   ]
// ]

== More exercises

#slide()[
  #task(title: [Task 1])[
     Can a transition function of a dfa be bijective? Explain..

  ]

]

#slide()[
  $
    delta : Z times A -> Z 
    
  $
  For a bijective function between two sets, the domain and codomain must have the same size(cardinality)

  $
    |Z times A| = |Z| space space space  -> space space space 
    |Z| times |A| = |Z|
  $
  $
    ==> |A| = 1.
  $
  So yes, transition function $delta$ of a dfa can be bijective, if alphabet contains just one symbol..
]

#slide()[
  #align(top)[
    #task(title : [Task 2])[
     Sketch a dfa that accepts binary strings that have exactly 4 zeros

  ]
  ]
]

#slide()[
  #align(center)[

    #fletcher-diagram(
    node-stroke: .1em,
    node-fill: gradient.radial(green.lighten(90%), rgb("#90f386"), center: (30%, 20%), radius: 50%),
    spacing: 3em,
    edge((-1, 0), "r", "-|>", ``, label-pos: 0, label-side: center),
    node((0, 0), text()[$z_0$], radius: 1.1em),
    node((1, 0), text()[$z_1$], radius: 1.1em),
    node((2, 0), text()[$z_2$], radius: 1.1em),
    node((3, 0), text()[$z_3$], radius: 1.1em),
    node((4, 0), text()[$z_4$], radius: 1.1em, extrude: (-2.5, 0)),
    node((4, 1), text()[$z_5$], radius: 1.1em),

    edge((0,0), (0,0), `1`, "-|>", bend: 120deg),
    edge((1,0), (1,0), `1`, "-|>", bend: 120deg),
    edge((2,0), (2,0), `1`, "-|>", bend: 120deg),
    edge((3,0), (3,0), `1`, "-|>", bend: 120deg),
    edge((4,0), (4,0), `1`, "-|>", bend: 120deg),

    edge((0,0), (1,0), `0`, "-|>", bend: 1deg),
    edge((1,0), (2,0), `0`, "-|>", bend: 1deg),
    edge((2,0), (3,0), `0`, "-|>", bend: 1deg),
    edge((3,0), (4,0), `0`, "-|>", bend: 1deg),
    edge((4,0), (4,1), `0`, "-|>", bend: 1deg),
    edge((4,1), (4,1), text()[$0, 1$], "-|>", bend: -130deg),
    
    
    )
  ]
]

#slide()[
  #align(top)[
    #task(title: [Task 3])[
    #text(size: 20pt)[
      Give an example of an accepting computation (by writing down the sequence of configurations)
    ]
  ]
  ]
  #align(center)[

    #fletcher-diagram(
    node-stroke: .1em,
    node-fill: gradient.radial(green.lighten(90%), rgb("#3bdbe9"), center: (30%, 20%), radius: 50%),
    spacing: 2em,
    edge((-1, 0), "r", "-|>", ``, label-pos: 0, label-side: center),
    node((0, 0), text()[$z_0$], radius: 1.1em),
    node((0, -1), text()[$z_1$], radius: 1.1em),
    node((1, -1), text()[$z_2$], radius: 1.1em),
    node((1, 0), text()[$z_3$], radius: 1.1em, extrude: (-2.5, 0)),
    

    edge((1,-1), (1,-1), text()[$x, y$], "-|>", bend: 120deg),
    

    edge((0,0), (0,-1), `x`, "-|>", bend: 1deg),
    edge((0, -1), (1,-1), `y`, "-|>", bend: 1deg),
    edge((1,-1), (1,0), `x`, "-|>", bend: 1deg),
    
    
    
    )
  ]
]

#slide()[
  #text(size: 30pt)[
    #align(left)[Accepting string can be for example $x y x$]
  Configurations: \ \ 
  $(z_0, x y x) -> (z_1, y x) -> (z_2, x) -> (z_3, epsilon)$ 
  
  thats it...
  ]
]

#slide()[
  #task(title: [Task 4])[
    #align(center)[Describe the language accepted by DFA]
  ]
  #align(center)[

    #fletcher-diagram(
    node-stroke: .1em,
    node-fill: gradient.radial(green.lighten(90%), rgb("#90f386"), center: (30%, 20%), radius: 50%),
    spacing: 3em,
    edge((-1, 0), "r", "-|>", ``, label-pos: 0, label-side: center),
    node((0, 0), text()[$z_0$], radius: 1.1em, extrude: (-2.5, 0)),
    node((1, 0), text()[$z_1$], radius: 1.1em),

    edge((0,0), (0,0), `1`, "-|>", bend: 120deg),
    edge((0,0), (1,0), `0`, "-|>", bend: 40deg),
    edge((1,0), (1,0), `1`, "-|>", bend: 120deg),
    edge((1,0), (0,0), `0`, "-|>", bend: 40deg),
    
    
    
    )
  ]
]

#slide()[
  its easy to see...

  #text(size: 40pt)[
    $
    1^* (0 (1^*)0)^* 1^*
  $
  ]
]

#slide()[
  #task(title : [Task 5])[
    Say $k = (z_4, 01100, s 0 a 0)$ is the configuration of NPDA, and $(z_1, "push" a) in delta(z_4, 0, epsilon)$. Write down a possible successor configuration of k.
  ]
]

#slide()[
  $
    k = (z_4, 01100, s 0 a 0) \
    delta(z_4, 0, epsilon) -> (z_1, "push" a) 
  $
  means that if we are in the state $z_4$ and read $0$, we push $a$ on top of the stack, no matter what is on top..

  successor configuration would look like this:
  $
    k_("succ") = (z_1, 1100, a s 0 a 0)
  $
]

#slide()[
  #task(title : [Task 6])[
    Let $A, B$ be two alphabets. Does $A^* union B^* = (A union B)^*?$
  ]

]

#slide()[
  #align(center)[$A^* union B^* = (A union B)^*$?] \
  Lets consider two alphabets:
  $A = {a}, space space B = {b}$ \
  $A^* = {epsilon, a, a a, dots}$ #h(0.7cm) 
  $B^* = {epsilon, b, b b, dots}$
  $A^* union B^* = {epsilon, a, b, a a, b b ...}$ \
  Note that the string #text(red)[$a b$] is in $(A union B)^*$ but not in \
  $A^* union B^*$ \

  #align(center)[
    #text(size: 30pt)[
      #text(red)[$A^* union B^* != (A union B)^*$] \
      #text(green)[$A^* union B^* subset.eq (A union B)^*$]
    ]
  ]


]

#slide()[
  #align(top)[#task(title: [Task 7])[
    Say $N$ is a given nfa that accepts the language $L$ over the 
    alphabet $A = {0, 1}$. Construct an nfa that accepts $L union {10}$
  ]
  ]
]

#slide()[
  #text(size: 15pt)[N is our given nfa, to construct union of two nfas we can just use $epsilon$ moves like that:]
  #align(center)[

    #fletcher-diagram(
    node-stroke: .1em,
    node-fill: gradient.radial(green.lighten(90%), rgb("#90f386"), center: (30%, 20%), radius: 50%),
    spacing: 1em,
    edge((-1, 0), "r", "-|>", ``, label-pos: 0, label-side: center),
    node((0, 0), text()[$$], radius: 1.1em, ),
    node((1.2, -1), text()[$N$], radius: 2.1em),

    node((1, 1), text()[$$], radius: 1.1em),
    node((2, 1), text()[$$], radius: 1.1em),
    node((3, 1), text()[$$], radius: 1.1em, extrude: (-2.5, 0)),
    
    
    

    edge((0,0), (1,-1), text()[$epsilon$], "-|>", bend: 0deg),
    edge((0,0), (1,1), text()[$epsilon$], "-|>", bend: 0deg),
    edge((1,1), (2,1), text()[$1$], "-|>", bend: 0deg),
    edge((2,1), (3,1), text()[$0$], "-|>", bend: 0deg),
    
    
    
    
    )
  ]

]

#slide()[
  #task(title : [Task 8])[
    Prove that the set of integers
    $
      ZZ = {dots -2, -1, 0, 1, 2, 3 dots}
    $
    is countable

  ]
]

#slide()[
  #text(size: 24pt)[Lets try to come up with a bijective function
  $f : NN -> ZZ$]
  $
    f(n) = cases(
      n/2  "        n is even", 
      -(n + 1)/2  "   n is odd"
    )
  $
  $
    0 -> #text(green)[0],space 1 -> #text(green)[-1],space 2 -> #text(green)[1],space 3 -> #text(green)[-2],space
    4 -> #text(green)[2] "and so on" dots
  $
]

#slide()[
  #task(title : [Task 9])[
    Is every countably infinite language regular?
    (provide proof for your answer)
  ]
]
#slide()[
  $ {0^n 1^n | n in NN_n} $
  Is countable and not regular by pumping lemma. 

  The bijection is $n |-> 0^n 1^n$, thats it..
]

#slide()[
  #task(title : [Task 10])[
    Find a regular expression which represents the set of strings over ${a, b}$ which contain the two substrings #text(green)[aa] and #text(green)[bb]
  ]

]

#slide()[
  #text(size: 36pt)[
    $
    (a union b)^*((a a (a union b)^*b b) union(b b (a union b)^* a a))(a union b)^*$
  ]
  
  
  \
  that  might not be intuitive at first but...
]


== (Which of the following L is regular)

#slide()[
  #text(size: 30pt)[${a^n b^m  | n >= m or n <= m}$] \ \ \ \ \ \ \ \ \ \ \
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
  #text(size: 30pt)[${a^n b^m | n > m and n < m}$] \ \
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

== More exercises

#slide()[
  #task(title: [Task 999])[
    Define a primitive recursive function $f: NN -> NN$ that counts the number of occurences of the digit 5 in a natural number
  ]
]



#slide()[
  #code()[
    ```py
    count = 0
    while n > 0:
      last_digit = n % 10  
      if last_digit == 5:
        count += 1
      n //= 10
    print(count)
    ```
  ]
]
#slide()[
  At first we need some auxiliary primitive recursive functions

  
]
#slide()[
  #text(32pt)[
    - quotient $floor(x/y) : NN times NN -> NN$ \ \
      $q u o(x, y) &= min{m : m <= x and (m + 1)y > x} \
      q u o(5, 2) &= dots \
      & "for" m = 0, 0 <= 5, 1 dot 2 gt 5 "? no" \
      & "for" m = 1, 1 <= 5, 2 dot 2 > 5 "? no" \
      & "for" m = 2, 2 <= 5, 3 dot 2 > 5 "? yes" \
      
      $
      
      outputs `quo(5, 2) = 2` 
  ]

]

#slide()[
  #text(36pt)[
    - remainder $r e m(x, y) : NN times NN -> NN$ \ \
      $r e m(x, y) &= x accent(-, dot) (y dot q u o(x, y)) \
      r e m(17, 5) &= 17 accent(-, dot) (5 dot q u o(17, 5)) \
      &= 17 accent(-, dot) 5 dot 3 \
      &= 2$ 
  ]

]

#slide()[
  #text(30pt)[
    - length(number of digits) : $NN -> NN$ \
      $l e n g t h(x) = min{j : j <= x, space 10^(j + 1) > x} + 1$ \

      $l e n g t h(12)  = ... \ 
      j &= 0, 0 <=12 "but" 10^1 >12? \
      j &= 1, 1 <= 12 , "and" 10^2 > 12  $
      
      so length(12) outputs simply 2
  ]
]

#slide()[
  #text(32pt)[
    $f: NN -> NN$ is then defined as: \ 

    \
  
  $f(m) = sum_(i = 1)^(l e n g t h (m)) e q(5, r e m(q u o(m, 10^(i - 1)), 10))$
  ]
]

#slide()[
  #align(top+left)[Example:]
  #text(40pt)[
    $f(253) &= e q (5, r e m(q u o(253, 1), 10)) \
  &+ space e q (5, r e m(q u o(253, 10), 10)) \ 
  &+ space e q (5, r e m(q u o(253, 100), 10)) \ 
  & =0 + 1 + 0 = 1  $
  ]
]

// #show link: underline
#slide()[
  #link("https://www.inf.unibz.it/~calvanese/teaching/09-10-tc/lecture-notes/chapter-13-sudkamp.pdf")[#text(blue)[Useful book  to understand $mu$ recursive functions]]

  \
  \
  \
  #align(center)[click it...]
]

== Good luck on midterm..

#slide()[
  // #text(size: 50pt)[
  //   Bye
  // ]
  #align(center)[
    #image("../Images/RememberLionKing.jpeg", scaling: "smooth")
  ]
]