#import "../lib.typ": *

#pipe(
  5,
  (
    x => x + 1,
    x => x + 2,
    x => assert(x == 8),
  ),
)

#compose(
  "y",
  (
    c => assert(c == "xyz"),
    c => c + "z",
    c => "x" + c,
  ),
)

#let pipeline = pipe_.with((
  c => c + "c",
  c => "a" + c,
))
#assert(pipeline("b") == "abc")

#let composed = compose_.with((
  c => "a" + c,
  c => c + "c",
))
#assert(composed("b") == "abc")

#assert(
  // composed
  compose_((
    emph,
    strong,
    underline,
    strike,
  ))[This is a very long content with a lot of words]
==
  // classic
  emph(
    strong(
      underline(
        strike[This is a very long content with a lot of words],
      ),
    ),
  )
)

#assert(
  // composed
  compose_((
    figure.with(supplement: none, caption: [Am stram gram]),
    table.with(columns: (auto, auto)),
  ))[Am, stram, gram,][Pic et pic et colégram,][Bour et bour et ratatam,][Am, stram, gram.]
==
  // classic
  figure(
    supplement: none,
    caption: [Am stram gram],
    table(
      columns: (auto, auto),
      [Am, stram, gram,], [Pic et pic et colégram,],
      [Bour et bour et ratatam,], [Am, stram, gram.],
    ),
  )
)
