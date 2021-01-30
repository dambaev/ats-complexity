#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

#include "./../HATS/complexity.hats"

implement main0() = {
  prval cmpl = believeme() where {
    extern prfun believeme(): O(0,0)
  }
  val () = mainO0( cmpl | )
  prval () = consume_complexity( cmpl ) where {
    extern prfun consume_complexity{t,s:nat}( c: O(t, s)): void
  }
}
