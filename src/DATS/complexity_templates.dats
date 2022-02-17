(* this module should contain ONLY generic template implementations, that are
   intended to be staloaded into a caller's DATS file. Otherwise, compiler will not
   be able to generate a resolved template's code
*)
#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "./../SATS/complexity.sats"
staload "./../SATS/list_vt.sats"

staload L="prelude/SATS/list_vt.sats"

implement {a} list_vt_cons_( O | elem, ls) = list_vt_cons( elem, ls) where {
  prval () = inc_space( O)
}

implement {a} list_vt_free( O | ls) = $L.list_vt_free( ls) where {
  prval () = add_time( O, pr_list_vt_length( ls))
}

implement {a} list_vt_reverse( O | ls) = $L.list_vt_reverse( ls) where {
  prval () = add_time( O, pr_list_vt_length( ls))
}

implement {a}{vt} list_vt_foreach_funenv{fe}{t1,s1}{v}{n}{t,s}( O, pf | ls, f, env) = {
  fun
    loop
    {n:nat}
    .<n>.
    ( pf: !v
    | ls: !list_vt(INV(a), n)
    , env: !vt
    ):<fe,!wrt> void =
    case+ ls of
    | list_vt_nil() => ()
    | @list_vt_cons(vx, rest) => {
      extern prfun believemeO(): O(t,s)
      prval localO = believemeO()
      val () = f( pf, localO | vx, env)
      prval () =  consume_complexity( localO) where {
        extern prfun consume_complexity{t,s:nat}( c: O(t, s)): void
      }
      val () = loop( pf | rest, env)
      prval () = fold@ (ls)
    }
  val () = loop( pf | ls, env)
  prval _ = adjust_time_space( O) where {
    extern prfun adjust_time_space
      ( !O(t,s) >> O( t + n + n*t1 /* even if f() has 0 time complexity, we still will need to walk through n elements */
                    , s + n*s1
                    )
      ):<> void
  }
  prval () = prop_verify {n >= 0} ()
  prval () = prop_verify {t1 >= 0} ()
  prval () = prop_verify {s1 >= 0} ()
  prval _ = believeme() where {
    extern praxi
      believeme
      (
      ):
      [ n * t1 >= 0]
      [ n * s1 >= 0]
      void
  }
}