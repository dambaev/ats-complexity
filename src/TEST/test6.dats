#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0
  
#include "HATS/complexity.hats"

fn
  test0
  {t, s: nat}
  ( O: !O(t, s) >> O( t + 2 + 2 + 2 + 4
                    , s
                      + 2 /* 1,2*/
                      + 2 /* 3,4*/
                    )
  |
  ):
  void = {
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
  prval pf = unit_v
  val () = list_vt_foreach_funenv{effall}{2,0} /* 5 */
    ( O
    , pf
    | r
    , foo
    , l
    ) where {
    fn foo
      {t,s:nat}
      ( pf: !unit_v
      , O: !O(t,s) >> O(t + 2, s) /* 6 */
      | vx: &int
      , env: !list_vt(int, 2)
      ):<1> void = {
        val env1 = (unit_v | vx)
        val () = list_vt_foreach_funenv{effall}{0,0} /* 7 */
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
      }
  }
  prval unit_v() = pf
  val () = list_vt_free( O | l) /* 8 */
  val () = list_vt_free( O | r) /* 9 */
}

// 
implement mainO0( O | ) = test0( O |  )
