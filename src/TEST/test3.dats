#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0
  
#include "HATS/complexity.hats"

// this test should show how 'O' proof variable is being passed implicitly, but this is not yet working

fn
  test0
  {t, s: nat}
  ( O: !O(t, s) >> O(t + 1, s + 1)
  |
  ):<!wrt>
  void = {
  val ls = list_vt_cons_<int>( 1, list_vt_nil())
  val () = list_vt_free( ls)
}

// 
implement mainO0( ) = test0( )
