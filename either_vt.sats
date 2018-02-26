#include "share/atspre_staload_libats_ML.hats"
#include "libats/ML/SATS/SHARE/monad.hats"

datavtype either_vt(a: vt@ype, b: vt@ype+) =
  | left_vt of a
  | right_vt of b

fun {a:t@ype}{b:t@ype+} lefts (x : list0_vt(either_vt(a,b))) : list0_vt(a)