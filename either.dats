staload "either.sats"

assume monad_type(b : t0p) = [a:t0p] either(a, b)

implement {a} monad_return (x) =
  right(x)

implement {a} monad_join (x) =
  case+ x of
    | left (y) => left(y)
    | right (left (y)) => left(y)
    | right (right (x)) => right(x)

implement {a}{b} monad_bind (x, fopr) =
  case+ x of
    | left (y) => left(y)
    | right (y) => fopr(y)