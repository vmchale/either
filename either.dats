staload "either.sats"

assume monad_type(b : t0p) = [a:t0p] either(a, b)

datasort list =
  | NIL
  | CONS of list

dataprop LENGTH (list, int) =
  | L_NIL (NIL, 0)
  | {l:list}{len:nat} L_CONS (CONS l, 1+len) of (LENGTH(l, len))

// prfun length_list{m:int}(x: [n:int | n <= m]) 

// functorial proof functions?
// want to prove: if length(f(xs)) <= n, length(xs) = n, length(cons(x, xs)) <= length(cons(x, f(xs)))
implement lefts (ys) =
  case- ys of
    | list_nil() => list_nil()
    | list_cons (right (x), xs) => lefts(xs)

// | list_cons (left (x), xs) => list_cons(x, lefts(xs))
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
