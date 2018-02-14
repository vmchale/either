#include "share/atspre_staload.hats"
#include "share/atspre_staload_libats_ML.hats"
#include "mylibies.hats"

staload "prelude/SATS/tostring.sats"
staload "libats/ML/SATS/string.sats"

#define nil list_vt_nil

#define :: list_vt_cons

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

vtypedef named = @{ fst = string, snd = bool }
vtypedef test_tree = @{ group = string, leaves = List_vt(named) }

fn fail_incomplete(i : int, n : int) : void =
  {
    val _ = prerr!("\nTest suite complete (" + tostring_int(i) + "/" + tostring_int(n) + ")\n")
    val _ = if n != i then
      (exit(1) ; ())
    else
      ()
  }

fnx iterate_list(t : test_tree, i : int, n : int) : void =
  let
    val _ = if i = 0 then
      println!(t.group + ":")
    else
      ()
    
    fun handle_loop(s : string, b : bool, xs : test_tree) : void =
      if b then
        (println!("  \33[32msucceeded:\33[0m " + s) ; iterate_list(xs, i + 1, n))
      else
        (println!("  \33[31mfailed:\33[0m " + s) ; iterate_list(xs, i, n))
  in
    case+ t.leaves of
      | ~list_vt_nil() => fail_incomplete(i, n)
      | ~list_vt_cons (x, xs) => handle_loop(x.fst, x.snd, @{ group = t.group, leaves = xs })
  end

implement main0 () =
  {
    var n0 = @{ fst = "eq (1/2)", snd = test_eq1() }
    var n1 = @{ fst = "eq (2/2)", snd = test_eq2() }
    var n2 = @{ fst = "from_left", snd = test_from_left() }
    var n3 = @{ fst = "is_left", snd = test_is_left() }
    var xs = n0 :: n1 :: n2 :: n3 :: nil
    var total = list_vt_length(xs)
    val g = @{ group = "either", leaves = xs } : test_tree
    val _ = iterate_list(g, 0, total)
  }