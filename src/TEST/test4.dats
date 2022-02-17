#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0
  
#include "HATS/complexity.hats"

// this test should show how 'O' proof variable is being passed implicitly, but this is not yet working

fn
  test0
  {t, s: nat}
  ( O: !O(t, s) >> O(t + 2, s + 1)
  |
  ):<!wrt>
  void = {
  val l = list_vt_cons_<int>( O | 1, list_vt_nil())
  val lr = list_vt_reverse( O | l)
  val () = list_vt_free( O | lr)
}

// 
implement mainO0( O | ) = test0( O |  )
