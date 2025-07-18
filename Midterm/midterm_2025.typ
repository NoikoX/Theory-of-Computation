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
  fill: rgb("#607d8b"),
  [(#num)]
)

#set math.equation(numbering: eqnum)



// #title-slide()
#title-slide(
  authors: (""),
  title: "Theory of Computation",
  subtitle: "Midterm",
  date: datetime.today().display(),
  institution-name: "Kutaisi International University",
  // logo: image("Images/thumbnail_KIU2-1.png", width: 18%)
  
)


== Version A 

=== Task 1

#text(30pt)[Prove that the difference of two regular languages is regular]


#slide()[
  #idea(title: [Solution])[
    $
      L_1 backslash L_2 = L_1 inter overline(L_2)
    $
    #align(center)[
      #image("Images/setebii.png", height: 50%, width: 80%)
    ]
  ]
]

#slide()[
  We know that if $L_2$ is regular, $overline(L_2)$ is also regular by flipping accepting with non-accepting states in DFA for $L_2$ 

  Intersection is regular cuz its a complement of the union of complements..

  $
    L_1 inter L_2 = overline(overline(L_1) union overline(L_2))
  $
  thats it..
]

=== Task 2

The DFA $M = (Z, A, delta, z_s, Z_A)$ is given below:

#align(center)[#image("Images/dfaFromMidterm.png")]
1. Give a formal description of $M$
2. Give a regular expression for $R(1, 4, 5)$

#slide()[
  #text()[
    First is straightforward. For the second, we want words that go from state 1 to 4 without passing through 6. So, these are words that start with 11 and words that start with 10 and contain one more 1

    In regular expression this will be:
    $
      ((1 compose 1) compose (1 union 0)^*) union ((1 compose 0) compose 0^* compose 1 compose (1 union 0)^*)
    $

  

  ]

]

=== Task 3

#text(30pt)[
  Prove that every NFA can be converted to NFA that accepts the same exact language but has a single accept state
]

#slide()[
  Lets call our NFA $N$, new NFA $N'$ is exactly like $N$ except it has $epsilon$ transitions from the states corresponding to the accept states of $N$, to a new accept state $z_("accept").$
  $N' = (Z union {z_("accept")}, A, delta',z_0, {z_("accept")})$

  $
    delta'(z, a) = cases(
      delta(z, a) & "if" a != epsilon "or" z in.not Z_A,
      
      delta(z, a) union {z_("accept")} & "if" a = epsilon "and" z in Z_A
    )
  $
  $"and "delta'(z_("accept"), a) = emptyset "for each" a in A_epsilon$ 


]

=== Task 4

#text()[
  #align(left)[Give a context-free grammar that generates:] 
  
]
#text(24pt)[
  $
    {w | w in BB^*, "length of" w "is odd and its middle symbol is" 0}
  $
]

#slide()[
  The idea is to generate 0 in the middle and then create all the possible combinations of 0s and 1s on the left and on the right so that every time you use that production rule, the length stays odd

  simply: #align(center)[#text(30pt)[$S -> 0 | 0 S 0 | 0 S 1 | 1 S 0 | 1 S 1$]]
]

=== Task 5

Prove that  the set of primitive recursive functions that are projections is countable

$
  p_i^r : NN_0^r -> NN_0
 $

#slide()[
  #idea(title: [Solution])[
    Every projection $p_i^r : NN_0^r -> NN_0$ is uniquely specified by the pair of natural numbers $(r, i),$ we conclude by observing that $NN_0 times NN_0 $ is countable, thats it..
  ]
]

=== Task 6
Let $G = ({E, T, F}, {times, plus, (, ), a}, P, E)$ where $P$ is given by

$
  E &-> E + T | T, \
  T &-> T times F | F \
  F &-> (E) | a
$
1. give a derivation for the string ((a))
2. give an informal description of NPDA that accepts G

#slide()[
  #text(18pt)[First is obvious, for the second the process would look be:]
  #text(20pt)[
    1. Place $E$ on the stack
    2. Repeat the following steps
      3. if the top of stack is the variable $E$,pop it and nondeterministically push either $E + T$ or $T$
      4. if the top of stack is the variable $T$, pop it and nondeterministically push either $T times F$ or $F$
      5. if the top of stack is the variable $F$, pop it and nondeterministically push either $(E)$ or $a$
      6. if the top of stack is a terminal symbol read the next symbol from the input and compare it to the terminal in the stack, if they match, repeat, if they do not match, reject on this branch of the nondeterminism
      7. if the top of the stack is $epsilon$, enter the accept state. Doing so accepts the input if it has all been read..
  ]
]

=== Task 7

Fix a positive natural number $n$, sketch a proof that the function $f(x) = x^n$ is primitive recursive
\
\
\
\
\
\
\
#slide()[
  #idea(title: [Solution])[
    $f(0) = 0, f(x + 1) = f(x) + sum_(i = 0)^(n - 1) vec(n, i) x^i$ \
    Since 
    $ 
      (x+1)^n - x^n &= \
      &=sum_(i = 0)^n vec(n, i) x^i space space - space space x^n \
      &=sum_(i = 0)^(n - 1) vec(n, i) x^i
       

    $
  ]
]


=== Task 8

State pumping lemma for regular languages. Give an example of a language that is not regular Sketch an idea (without the proof) how we prove that the language you gave is not regular

#slide()[
  #idea(title: [Solution])[
    From slides TCS-2, language ${a^n b^n | n in NN}$
  ]
]

== Version 2

=== Task 1

Construct a DFA that accepts a language given by the following regular expression written for the alphabet ${0, 1}.$ 

$
  ((0 compose 0) union (0 compose 1) union (1 compose 0) union (1 compose 1))^*
$

#slide()[
  If you take a closer look, these are all string of even length (including an $epsilon$). You can easily construct a DFA for this..
]

#align(center)[
  
  #fletcher-diagram(
    node-stroke: .1em,
    node-fill: gradient.radial(green.lighten(90%), rgb("#4570e5"), center: (30%, 20%), radius: 50%),
    spacing: 4em,
    edge((-1, 0), "r", "-|>", ``, label-pos: 0, label-side: center),
    node((0, 0), text()[$z_1$], radius: 4.8em, extrude: (-2.5, 0)),
    node((1, 0), text()[$z_2$], radius: 4.8em),
    
    
    edge((0, 0), (1, 0), text()[$0, 1$], "-|>", bend: 60deg),
    edge((1, 0), (0, 0), text()[$0, 1$], "-|>", bend: 60deg),
  
    )
    
    
]



=== Task 2

The DFA $M$ is given
1. Give a formal description of $M$
2. Give a regular expression for $R(1, 5, 5)$
#align(center)[
  #figure(image("Images/AnotherDFA.png", height: 60%, width: 40%))<dfa>
]

#slide()[
  First one is easy, for the second, we want words that start with odd number of 1's, followed by 01 and no more zeros after

  $
    1 compose (1 compose 1)^* compose (0 compose 1) compose 1^*
  $
  
]

=== Task 3

Construct NFA with a single accepting state, that accepts the same exact language as DFA @dfa

#slide()[
  #idea(title: [Solution])[
    Just add $epsilon$ moves from old accepting states to the newly created single accepting state. 0 and 1 both go to empty set from the new accepting state
  ]
]

=== Task 4
Give a context-free grammar that generates

#text(31pt)[
  $
    {w | w in BB^* "and" w "contains at least three 1s"}
  $
]

#slide()[
  #idea(title: [Solution])[
    so the idea is to generate three 1s first and then random number of 0s and 1s between them
    $
      S -> R 1 R 1 R 1 R \
      R -> 0 R | 1 R | epsilon
    $
  ]
]

=== Task 5

Prove that the set of primitive recursive functions that are constants is countable

$
  c_i^r : NN^r_0 -> NN_0
$

#slide()[
  #idea(title: [Solution])[
    Every constant $c_i^r : NN^r_0 -> NN_0$ is uniquely specified by the pair of natural numbers $(r, i).$ We conclude by observing that $NN_0 times NN_0$ is countable
  ]
]

=== Task 6
Let $G = ({R, X, S, T}, {a, b}, P, R)$ where $P$ is given by:
$
  R ->& X R X | S, \
  S ->& a T b | b T a, \
  T ->& X T X | X | epsilon \
  X ->& a | b
$
1. Give a derivation of XXX starting from $T$

 $T arrow.long_G^* X X X$
2. Give an informal description of NPDA that accepts G


#text(18pt)[
    1. Place start variable $R$ on the stack
    2. Repeat the following steps
      3. if the top of stack is the variable $R$,pop it and nondeterministically push either $X R X$ or $S$
      4. if the top of stack is the variable $S$, pop it and nondeterministically push either $a T b$ or $b T a$
      5. if the top of stack is the variable $T$, pop it and nondeterministically push either $X T X$, $X$ or $epsilon$
      6. if the top of stack is the variable $X$, pop it and nondeterministically push either $a$ or $b$
      7. if the top of stack is a terminal symbol read the next symbol from the input and compare it to the terminal in the stack, if they match, repeat, if they do not match, reject on this branch of the nondeterminism
      8. if the top of the stack is $epsilon$, enter the accept state. Doing so accepts the input if it has all been read..
  ]


=== Task 7

lets say $f:NN_0 times NN_0 -> NN_0$ is given by
$ f(m, x) = (4m + 2x) dot.op(-) 11 $
Determine $mu f(x), $ show your work..

#slide()[
  #idea(title: [Solution])[
    $mu f(0) = "min"_m {4m + 2 dot 0 dot.op(-)11 = 0} = 0$ \
    $mu f(1) = "min"_m {4m + 2 dot 1 dot.op(-)11 = 0} = 0$ \
    similarly $mu f(2) = mu f(3) = mu f(4) = mu f(5) = 0.$ \
    $mu f(i)$ is undefined for $i > 5$ cuz #text(red)[$4m + 2 dot i dot.op(-)11 > 0$]
  ]
]

=== Task 8

State pumping lemma for context free languages. Give an example of a language that is not context free. Sketch an idea(without proof) how we prove that the language is not context free..

#slide()[
  #idea(title : [Solution])[
    From slides TCS-4, language ${a^n b^n c^n | n in NN}$
  ]
]

#align(center)[
  #image("Images/Pumbaaa.png")
]