#define ATS_PACKNAME "complexity"
#define ATS_EXTERN_PREFIX "complexity_"


absview O( time: int, space: int)

prfun
  inc_space
  { t, s: nat}
  ( O: !O(t, s) >> O( t, s + 1)): void

prfun
  add_space
  { t, s, s1: nat}
  ( O: !O(t, s) >> O( t, s + s1)
  , int s1
  ): void

prfun
  inc_time
  { t, s: nat}
  ( O: !O(t, s) >> O( t + 1, s)): void

prfun
  add_time
  { t, s, t1: nat}
  ( O: !O(t, s) >> O( t + t1, s)
  , int t1
  ): void

(* this is a definition of main entry point, which is given the complexity proof
 *)
fn
  mainO0
  ( !O( 0, 0) >> [time,space:nat] O( time, space)
  |
  ): void
