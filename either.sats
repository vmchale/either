#include "share/atspre_staload_libats_ML.hats"
#include "libats/ML/SATS/SHARE/monad.hats"

datatype either(a: t@ype, b: t@ype+) =
  | left of a
  | right of b