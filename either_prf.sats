datasort list =
  | NIL
  | CONS of list

dataprop LENGTH(list, int) =
  | L_NIL(NIL, 0)
  | {l:list}{len:nat} L_CONS(CONS(l), 1 + len) of (LENGTH(l, len))