#include "share/atspre_staload_libats_ML.hats"
#include "libats/ML/SATS/SHARE/monad.hats"

datavtype either_vt(a: vt@ype, b: vt@ype+) =
  | left_vt of a
  | right_vt of b

fun {a:vt@ype}{b:vt@ype+} is_left_vt (x : !either_vt(a, b)) : bool

fun {a:vt@ype}{b:vt@ype+} is_right_vt (x : !either_vt(a, b)) : bool
