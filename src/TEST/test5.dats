#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0
  
#include "HATS/complexity.hats"

fn
  test0
  {t, s: nat}
  ( O: !O(t, s) >> O(t + 4, s + 4)
  | i: int
  ):
  void =
  if i = 0
  then {
    val l = list_vt_cons_<int>
              ( O | 1
              , list_vt_cons_( O | 2
                , list_vt_nil()
                )
              )
    val r = list_vt_cons_<int>
              ( O | 3
              , list_vt_cons_( O | 4
                , list_vt_nil()
                )
              )
    val () = list_vt_free( O | l)
    val () = list_vt_free( O | r)
  }
  else {
    // we have to follow constraints and satisfy O representation even if we haven't actually done anything
    // it seems logical, in case of following the worst case scenario for complexity
    prval () = add_space( O, 4)
    prval () = add_time( O, 4)
  }

// 
implement mainO0( O | ) = test0( O | 1  )
