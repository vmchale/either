staload "either.sats"
staload "prelude/SATS/list.sats"

#include "prelude/DATS/basics.dats"
#include "prelude/DATS/list.dats"

assume monad_type(b : t0p) = [a:t0p] either(a, b)

implement {a}{b} eq_either_either (x, y) =
  case+ (x, y) of
    | (right (_), left (_)) => false
    | (left (_), right (_)) => false
    | (left (x), left (y)) => gequal_val_val<a>(x, y)
    | (right (x), right (y)) => gequal_val_val<b>(x, y)

implement {a}{b} neq_either_either (x, y) =
  not(eq_either_either(x, y))

implement {a}{b} is_left (x) =
  case+ x of
    | left (_) => true
    | right (_) => false

implement {a}{b} is_right (x) =
  case+ x of
    | left (_) => false
    | right (_) => true

implement {a}{b} from_right (x, y) =
  case+ y of
    | right (y0) => y0
    | left (_) => x

implement {a}{b} from_left (x, y) =
  case+ y of
    | left (y0) => y0
    | right (_) => x

implement {a}{b}{c} either_ (f, g, x) =
  case+ x of
    | left (x0) => f(x0)
    | right (x0) => g(x0)

implement {a}{b} lefts (ys) =
  case- ys of
    | list_nil() => list_nil()
    | list_cons (right (x), xs) => lefts(xs)

//| list_cons (left (x), xs) => list_cons(x, lefts(xs))
implement {a} monad_return (x) =
  right(x)

implement {a} monad_join (x) =
  case+ x of
    | left (y) => left(y)
    | right (left (y)) => left(y)
    | right (right (x)) => right(x)

implement {a}{b} monad_fmap (fopr, x) =
  case+ x of
    | left (y) => left(y)
    | right (x) => right(fopr(x))

implement {a}{b} monad_bind (x, fopr) =
  case+ x of
    | left (y) => left(y)
    | right (y) => fopr(y)