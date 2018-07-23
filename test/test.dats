#include "share/atspre_staload.hats"
#include "share/atspre_staload_libats_ML.hats"
#include "mylibies.hats"
#include "$PATSHOMELOCS/specats-0.4.0/mylibies.hats"

staload "prelude/SATS/tostring.sats"
staload "libats/ML/SATS/string.sats"

fn test_eq1() : bool =
  let
    val rhs = right{string,string}("eq")
    val lhs = right("eq")
  in
    rhs = lhs
  end

fn test_eq2() : bool =
  let
    val rhs = left{string,string}("eq")
    val lhs = right("eq")
  in
    rhs != lhs
  end

fn test_from_left() : bool =
  let
    val rhs = from_left("", left{string,string}("eq"))
    val lhs = "eq"
  in
    rhs = lhs
  end

fun test_is_left() : bool =
  let
    val rhs = is_left(right{string,string}("eq"))
    val lhs = false
  in
    rhs = lhs
  end

implement main0 () =
  {
    var n0 = @{ test_name = "eq (1/2)", test_result = test_eq1() }
    var n1 = @{ test_name = "eq (2/2)", test_result = test_eq2() }
    var n2 = @{ test_name = "from_left", test_result = test_from_left() }
    var n3 = @{ test_name = "is_left", test_result = test_is_left() }
    var xs = n0 :: n1 :: n2 :: n3 :: nil
    var total = list_vt_length(xs)
    val g = @{ group = "either", leaves = xs } : test_tree
    val _ = iterate_list(g, 0, total)
  }
