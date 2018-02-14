#include "share/atspre_staload_libats_ML.hats"
#include "libats/ML/SATS/SHARE/monad.hats"

datatype either(a: t@ype, b: t@ype+) =
  | left of a
  | right of b

fun {a:t@ype}{b:t@ype+} eq_either_either (x : either(a, INV(b)), y : either(a, b)) : bool

fun {a:t@ype}{b:t@ype+} neq_either_either (x : either(a, INV(b)), y : either(a, b)) : bool

overload = with eq_either_either

overload != with neq_either_either

fun {a:t@ype}{b:t@ype+} lefts {n:int} (x : list(either(a,b), n)) :
  [ m : int | m <= n ] list(a, m)

fun {a:t@ype}{b:t@ype+} rights {n:int} (x : list(either(a,b), n)) :
  [ m : int | m <= n ] list(b, m)

fun {a:t@ype}{b:t@ype+}{c:t@ype} either_ (f : a -> c, g : b -> c, x : either(a, b)) : c

fun {a:t@ype}{b:t@ype+} is_left (x : either(a, b)) : bool

fun {a:t@ype}{b:t@ype+} is_right (x : either(a, b)) : bool

fun {a:t@ype}{b:t@ype+} from_right (x : b, y : either(a, b)) : b

fun {a:t@ype}{b:t@ype+} from_left (x : a, y : either(a, b)) : a