#include "share/atspre_staload_libats_ML.hats"
#include "libats/ML/SATS/SHARE/monad.hats"

datavtype either_vt(a: vt@ype, b: vt@ype+) =
  | left_vt of a
  | right_vt of b

fun {a:vt@ype}{b:vt@ype+} eq_either_either_vt (x : !either_vt(a, INV(b)), y : !either_vt(a, b)) 
  : bool

fun {a:vt@ype}{b:vt@ype+} neq_either_either_vt ( x : !either_vt(a, INV(b))
                                               , y : !either_vt(a, b)
                                               ) : bool

fun {a:vt@ype}{b:vt@ype+} is_left_vt (x : !either_vt(a, b)) : bool

fun {a:vt@ype}{b:vt@ype+} is_right_vt (x : !either_vt(a, b)) : bool

overload = with eq_either_either_vt

overload != with neq_either_either_vt
