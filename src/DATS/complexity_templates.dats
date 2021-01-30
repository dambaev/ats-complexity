(* this module should contain ONLY generic template implementations, that are
   intended to be staloaded into a caller's DATS file. Otherwise, compiler will not
   be able to generate a resolved template's code
*)
#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "./../SATS/complexity.sats"

staload L="prelude/SATS/list_vt.sats"

implement {a} list_vt_cons_( O | elem, ls) = list_vt_cons( elem, ls) where {
  prval () = inc_space( O)
}

implement {a} list_vt_free{n}( O | ls) = $L.list_vt_free( ls) where {
  prval () = add_time( O, list_vt_length( ls))
}