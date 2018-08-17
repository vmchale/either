staload "./either_vt.sats"
staload "libats/ML/SATS/list0_vt.sats"

#include "share/atspre_staload_libats_ML.hats"

implement {a}{b} is_left_vt (x) =
  case+ x of
    | left_vt (_) => true
    | right_vt (_) => false

implement {a}{b} is_right_vt (x) =
  case+ x of
    | right_vt (_) => true
    | left_vt (_) => false
