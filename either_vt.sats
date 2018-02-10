datavtype either_vt(a: vt@ype, b: vt@ype+) =
  | left_vt of a
  | right_vt of b

// TODO monadicity??
fun either_vt_fun {a:vt@ype}{b:vt@ype+}{c:vt@ype} ( f : a -> c
                                                  , g : b -> c
                                                  , x : either_vt(a, b)
                                                  ) : c

fun is_left_vt {a:vt@ype}{b:vt@ype+} (x : either_vt(a, b)) : bool

fun rights_vt {a:vt@ype}{b:vt@ype+} (xs : List_vt(either_vt(a,b))) :
  List_vt(a)

fun lefts_vt {a:vt@ype}{b:vt@ype+} (xs : List_vt(either_vt(a,b))) :
  List_vt(b)