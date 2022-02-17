#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0
  
#include "HATS/complexity.hats"

fn
  test1
  {ln,rn : nat}
  {t, s: nat}
  ( O: !O(t, s) >> O( t
                      + (rn + rn * ln)
                      + rn
                    , s
                    )
  | l: !list_vt( int, ln)
  , r: !list_vt( int, rn)
  ):
  void = {
  prval pf = unit_v
  prval _ = $showtype r
  val () = list_vt_foreach_funenv{effall}{ln,0}{..}{rn}
    ( O
    , pf
    | r
    , foo
    , l
    ) where {
    fn foo
      {t,s:nat}
      ( pf: !unit_v
      , O: !O(t,s) >> O(t + ln, s)
      | vx: &int
      , env: !list_vt(int, ln)
      ):<1> void = {
        val env1 = (unit_v | vx)
        val () = list_vt_foreach_funenv{effall}{0,0}{..}{ln}
          ( O
          , pf
          | env
          , foo1
          , env1
          ) where {
          fn foo1
            {t,s:nat}
            ( pf: !unit_v
            , O: !O(t,s)
            | y: &int
            , pfx: !(unit_v | int)
            ):<1> void = {
              val () = println!("[", pfx.1, ";" , y, "]")
            }
        }
        val (unit_v() | _) = env1
        val () = vx := 10
      }
  }
  val env1 = (unit_v | 0)
  val () = list_vt_foreach_funenv{effall}{0,0}{..}{rn} // t + rn
    ( O
    , pf
    | r
    , foo
    , env1
    ) where {
    fn foo
      {t,s:nat}
      ( pf: !unit_v
      , O: !O(t,s)
      | vx: &int
      , env: !(unit_v | int)
      ):<1> void = {
        val () = println!("l = ", vx)
      }
  }

  val (unit_v() | _ ) = env1
  prval unit_v() = pf
}

fn
  test0
  {t,s:nat}
  ( O: !O(t,s) >> O( t
                     + (2 + 2 * 2)
                      + 2
                      + 4
                   , s
                     + 4
                   )
  |
  ): void = {
  val l = list_vt_cons_<int>
            ( O | 1 /* 1 */
            , list_vt_cons_( O | 2 /* 2 */
              , list_vt_nil()
              )
            )
  val r = list_vt_cons_<int>
            ( O | 3 /* 3 */
            , list_vt_cons_( O | 4 /* 4 */
              , list_vt_nil()
              )
            )
  val () = test1( O | l, r)
  val () = list_vt_free( O | l)
  val () = list_vt_free( O | r)
}

// 
implement mainO0( O | ) = test0( O |  )
