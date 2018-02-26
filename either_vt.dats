staload "./either_vt.sats"
staload "libats/ML/SATS/list0_vt.sats"

#include "share/atspre_staload_libats_ML.hats"

implement {a}{b} lefts (ys) =
  case+ ys of
    | ~list0_vt_nil() => list0_vt_nil
    | ~list0_vt_cons (right_vt (x), xs) => lefts(xs)
    | ~list0_vt_cons (left_vt (x), xs) => list0_vt_cons(x, lefts(xs))