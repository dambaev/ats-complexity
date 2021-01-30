#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0
  
#include "HATS/complexity.hats"

fn
  test0
  {t, s: nat}
  ( O: !O(t, s) >> O(t + 1, s + 1)
  |
  ):<!wrt>
  void = {
  val ls = list_vt_cons_<int>( O | 1, list_vt_nil())
  val () = list_vt_free( O | ls)
}

// 
implement mainO0( O | ) = test0( O | )
