
#define ATS_PACKNAME "complexity"
#define ATS_EXTERN_PREFIX "complexity_list_vt"

staload "./complexity.sats"


fn
  {a:viewt0ype}
  list_vt_cons_
  {t, s: nat}
  {n: nat}
  ( O: !O(t, s) >> O(t, s + 1)
  | elem: a
  , ls: list_vt( a, n)
  ):<>
  list_vt( a, n + 1)
fn
  {a:t0ype}
  list_vt_free
  {n:nat}
  {t,s: nat}
  ( O: !O( t, s) >> O( t + n, s)
  | ls: list_vt( INV(a), n)
  ):<!wrt>
  void

fn
  {a:viewt0ype}
  list_vt_nil_
  (
  ):<>
  list_vt( a, 0)

(* ****** ****** *)

vtypedef
RD(a:vt0p) = a // for commenting: read-only
#define NSH (x) x // for commenting: no sharing
#define SHR (x) x // for commenting: it is shared

(* ****** ****** *)

fn
  {a:vt0p}
  list_vt_sing
  {t,s:nat}
  ( !O(t,s) >> O( t, s + 1)
  | a
  ):<>
  list_vt( a, 1)
fn
  {a:vt0p}
  list_vt_pair
  {t,s:nat}
  ( !O(t,s) >> O( t, s + 2)
  | a
  , a
  ):<>
  list_vt(a, 2)

(* ****** ****** *)
//
fun{a:vt0p}
list_vt_tuple_0(): list_vt(a, 0)
//
fun
  {a:vt0p}
  list_vt_tuple_1
  {t,s:nat}
  ( O: !O(t,s) >> O(t, s + 1) 
  | x0: a
  ): list_vt(a, 1)
fun
  {a:vt0p}
  list_vt_tuple_2
  {t,s:nat}
  ( O: !O(t,s) >> O(t, s + 2) 
  | x0: a
  , x1: a
  ): list_vt(a, 2)
fun
  {a:vt0p}
  list_vt_tuple_3
  {t,s:nat}
  ( !O(t,s) >> O(t, s + 3) 
  | x0: a
  , x1: a
  , x2: a
  ): list_vt(a, 3)
//
fun
  {a:vt0p}
  list_vt_tuple_4
  {t,s:nat}
  ( !O(t,s) >> O(t, s + 4)
  | x0: a
  , x1: a
  , x2: a
  , x3: a
  ): list_vt(a, 4)
fun
  {a:vt0p}
  list_vt_tuple_5
  {t,s:nat}
  ( !O(t,s) >> O(t, s + 5) 
  | x0: a
  , x1: a
  , x2: a
  , x3: a
  , x4: a
  ): list_vt(a, 5)
fun
  {a:vt0p}
  list_vt_tuple_6
  {t,s:nat}
  ( !O(t,s) >> O(t, s + 6) 
  | x0: a
  , x1: a
  , x2: a
  , x3: a
  , x4: a
  , x5: a
  ): list_vt(a, 6)
//
(* ****** ****** *)
//
symintr list_vt_tuple
//
overload
list_vt_tuple with list_vt_tuple_0
overload
list_vt_tuple with list_vt_tuple_1
overload
list_vt_tuple with list_vt_tuple_2
overload
list_vt_tuple with list_vt_tuple_3
overload
list_vt_tuple with list_vt_tuple_4
overload
list_vt_tuple with list_vt_tuple_5
overload
list_vt_tuple with list_vt_tuple_6
//
(* ****** ****** *)

fun{x:vt0p}
list_vt_make_sing
  {t,s:nat}
  ( !O(t,s) >> O(t, s + 1)
  | x: x
  ):<!wrt> list_vt(x, 1)
fun{x:vt0p}
  list_vt_make_pair
  {t,s:nat}
  ( !O(t,s) >> O(t, s + 2)
  | x1: x
  , x2: x
  ):<!wrt> list_vt(x, 2)

(* ****** ****** *)
//
fun
  {x:vt0p}
  print_list_vt
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s) 
  | xs: !list_vt(INV(x), n)
  ): void
fun{x:vt0p}
prerr_list_vt
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s) 
  | xs: !list_vt(INV(x), n)
  ): void
//
fun
  {x:vt0p}
  fprint_list_vt
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s) 
  | out: FILEref, xs: !list_vt(INV(x), n)
  ): void
fun{}
  fprint_list_vt$sep
  {t,s:nat}
  ( out: FILEref
  ): void
//
fun{x:vt0p}
  fprint_list_vt_sep
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | out: FILEref
  , xs: !list_vt(INV(x), n)
  , sep: NSH(string)
  ) : void // end of [fprint_list_vt_sep]
//
(* ****** ****** *)
//
fun{x:vt0p}
list_vt_is_nil
  {n:nat}
  ( xs: !list_vt(INV(x), n)
  ):<> bool (n==0)
//
fun{x:vt0p}
  list_vt_is_cons
  {n:nat}
  ( xs: !list_vt(INV(x), n)
  ):<> bool (n > 0)
//
(* ****** ****** *)

fun{x:vt0p}
  list_vt_is_sing
  {n:nat}
  ( xs: !list_vt(INV(x), n)
  ):<> bool (n==1)
// end of [list_vt_is_sing]

fun{x:vt0p}
  list_vt_is_pair
  {n:nat}
  ( xs: !list_vt(INV(x), n)
  ):<> bool (n==2)
// end of [list_vt_is_pair]

(* ****** ****** *)

fun{}
list_vt_unnil{x:vt0p} (xs: list_vt(x, 0)):<> void

(* ****** ****** *)

fun{x:vt0p}
list_vt_uncons{n:pos}
  ( xs: &list_vt(INV(x), n) >> list_vt(x, n-1)
  ):<!wrt> x
// end of [list_vt_uncons]

(* ****** ****** *)

prfun{x:vt0p}
  pr_list_vt_length
  {n:nat}
  ( xs: !list_vt(INV(x), n)
  ):<> int n

fun{x:vt0p}
  list_vt_length
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n,s)
  | xs: !list_vt(INV(x), n)
  ):<> int n

(* ****** ****** *)

fun{x:vt0p}
list_vt_getref_at
  {n:nat}{i:nat | i <= n}
  {t,s:nat}
  ( !O(t + i,s)
  | xs: &list_vt(INV(x), n)
  , i: int i
  ):<> cPtr1 (list_vt(x, n-i))
// end of [list_vt_getref_at]

(* ****** ****** *)
//
fun{x:t0p}
  list_vt_get_at
  {n:nat}
  {t,s:nat}
  ( !O(t + n,s)
  | xs: !list_vt(INV(x), n)
  , i: natLt n
  ):<> x
//
fun{x:t0p}
  list_vt_set_at{n:nat}
  {t,s:nat}
  ( !O(t + n,s)
  | xs: !list_vt(INV(x), n)
  , i: natLt n
  , x: x
  ):<!wrt> void
//
(* ****** ****** *)

fun{x:vt0p}
  list_vt_exch_at
  {n:nat}
  {t,s:nat}
  ( !O(t + n,s)
  | xs: !list_vt(INV(x), n)
  , i: natLt n
  , x: &x >> _
  ):<!wrt> void
// end of [list_vt_exch_at]

(* ****** ****** *)

fun{x:vt0p}
list_vt_insert_at
  {n:nat}
  {t,s:nat}
  ( !O(t + n,s)
  | xs: &list_vt(INV(x), n) >> list_vt(x, n+1)
  , i: natLte n
  , x: x
  ) :<!wrt> void // end of [list_vt_insert_at]

fun{x:vt0p}
list_vt_takeout_at{n:nat}
  {t,s:nat}
  ( !O(t + n,s)
  | xs: &list_vt(INV(x), n) >> list_vt(x, n-1)
  , i: natLt n
  ):<!wrt> x
// end of [list_vt_takeout_at]

(* ****** ****** *)

fun{x:t0p}
list_vt_copy{n:nat}
  {t,s:nat}
  ( !O(t + n, s + n)
  | xs: !list_vt(INV(x), n)
  ):<!wrt> list_vt(x, n)
// end of [list_vt_copy]

(* ****** ****** *)
//
fun{x:vt0p}
list_vt_copylin{n:nat}
  {t,s:nat}
  ( !O(t + n, s + n)
  | xs: !list_vt(INV(x), n)
  ):<!wrt> list_vt(x, n)
fun{x:vt0p}
list_vt_copylin$copy
  ( x: &RD(x)
  ): (x)
//
fun{x:vt0p}
list_vt_copylin_fun{n:nat}{fe:eff}
  {t,s:nat}
  ( !O(t + n, s + n)
  | xs: !list_vt(INV(x), n)
  , f: (&RD(x)) -<fe> x
  ):<!wrt,fe>
  list_vt(x, n)
//
(* ****** ****** *)

fun{x:t0p}
list_vt_free
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | xs: list_vt(INV(x), n)
  ):<!wrt> void

(* ****** ****** *)
//
fun{x:vt0p}
list_vt_freelin
  {n:int}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | xs: list_vt(INV(x), n)
  ):<!wrt> void
fun{x:vt0p}
list_vt_freelin$clear (x: &x >> x?):<!wrt> void
//
fun{x:vt0p}
list_vt_freelin_fun{fe:eff}
  {n:nat}
  {t,s:nat}
  ( !O(t + n, s)
  | xs: list_vt(INV(x), n)
  , f: (&x>>x?) -<fe> void
  ):<!wrt,fe> void
//
(* ****** ****** *)
//
fun{
x:vt0p
} list_vt_uninitize
  {n:nat}
  {t,s:nat}
  ( !O(t + n, s)
  | xs: !list_vt(INV(x), n) >> list_vt(x?, n)
  ) :<!wrt> void // end of [list_vt_uninitize]
//
fun{x:vt0p}
list_vt_uninitize$clear (x: &(x) >> x?):<!wrt> void
//
fun{
x:vt0p
} list_vt_uninitize_fun
  {n:nat}{fe:eff}
  {t,s:nat}
  ( !O(t, s) >> O(t + n, s)
  | xs: !list_vt(INV(x), n) >> list_vt(x?, n)
  , f: (&x>>x?) -<fe> void
  ) :<!wrt,fe> void // end of [list_vt_uninitize_fun]
//
(* ****** ****** *)

fun{
a:vt0p
} list_vt_append
  {n1,n2:int}
  {t,s:nat}
  ( !O(t, s)
  | xs1: list_vt(INV(a), n1)
  , xs2: list_vt(a, n2)
  ) :<!wrt> list_vt(a, n1+n2) // endfun

(* ****** ****** *)

fun{
x:vt0p
} list_vt_extend{n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t, s + 1)
  | xs1: list_vt(INV(x), n)
  , x2: x
  ):<!wrt> list_vt(x, n+1)
// end of [list_vt_extend]

fun{x:vt0p}
list_vt_unextend{n:pos}
  {t,s:nat}
  ( !O(t,s)
  | xs: &list_vt(INV(x), n) >> list_vt(x, n-1)
  ):<!wrt> (x)
// end of [list_vt_unextend]

(* ****** ****** *)

macdef list_vt_snoc = list_vt_extend
macdef list_vt_unsnoc = list_vt_unextend

(* ****** ****** *)

fun{x:vt0p}
list_vt_reverse{n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | xs: list_vt(INV(x), n)
  ):<!wrt> list_vt(x, n)
// end of [list_vt_reverse]

fun{a:vt0p}
list_vt_reverse_append{m,n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + m + n, s)
  | list_vt(INV(a), m), list_vt(a, n)
  ):<!wrt> list_vt(a, m+n)
// end of [list_vt_reverse_append]

(* ****** ****** *)

fun{x:vt0p}
list_vt_split_at
  {n:nat}{i:nat | i <= n}
  {t,s:nat}
  ( !O(t,s) >> O(t + i, s)
  | list_vt(INV(x), n)
  , int i
  ):<!wrt> (list_vt(x, i), list_vt(x, n-i))
// end of [list_vt_split_at]

(* ****** ****** *)

fun{x:vt0p}
list_vt_concat
  {t,s:nat}
  ( !O(t,s) >> [i:nat] O(t + i, s + i)
  | xss: List_vt(List_vt(INV(x)))
  ):<!wrt> List0_vt(x)
// end of [list_vt_concat]

(* ****** ****** *)
//
fun{x:t0p}
list_vt_filter{n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | list_vt(INV(x), n)
  ):<!wrt> listLte_vt(x, n)
// end of [list_vt_filter]
//
fun{x:t0p}
list_vt_filter$pred (x: &RD(x)):<> bool
//
(* ****** ****** *)
//
fun{x:vt0p}
list_vt_filterlin{n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | list_vt(INV(x), n)
  ):<!wrt> listLte_vt(x, n)
//
fun{x:vt0p}
list_vt_filterlin$pred (x: &RD(x)):<> bool
fun{x:vt0p}
list_vt_filterlin$clear (x: &x >> x?):<!wrt> void
//
(* ****** ****** *)

fun{x:vt0p}
  list_vt_separate{n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | xs: &list_vt(INV(x), n) >> list_vt(x, n1)
  , n1: &int? >> int(n1)
  ) : #[n1:nat|n1 <= n] list_vt(x, n-n1)

fun{x:vt0p}
list_vt_separate$pred(x: &RD(x)): bool

(* ****** ****** *)

fun{x:vt0p}
list_vt_take_until{n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | xs: &list_vt(INV(x), n) >> list_vt(x, n-n1)
  , n1: &int? >> int(n1)
  ) : #[n1:nat|n1 <= n] list_vt(x, n1)

fun{x:vt0p}
list_vt_take_until$pred(x: &RD(x)): bool

(* ****** ****** *)
//
fun
{x:vt0p}
list_vt_app
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | xs: !list_vt(INV(x), n)
  ): void
fun
{x:vt0p}
list_vt_app$fwork(x: &x >> _): void
//
(* ****** ****** *)
//
fun{x:vt0p}
list_vt_appfree
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | xs: list_vt(INV(x), n)
  ): void
//
fun{x:vt0p}
list_vt_appfree$fwork(x: &x>>x?): void
//
(* ****** ****** *)
//
fun
{x:vt0p}
list_vt_iapp
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | xs: !list_vt(INV(x), n)
  ): void
fun
{x:vt0p}
list_vt_iapp$fwork
  (index: intGte(0), x: &x >> _): void
//
(* ****** ****** *)
//
fun{x:vt0p}
list_vt_iappfree
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | xs: list_vt(INV(x), n)
  ): void
//
fun{x:vt0p}
list_vt_iappfree$fwork
  (index: intGte(0), x: &x >> x?): void
//
(* ****** ****** *)
//
fun{
x:vt0p}{y:vt0p
} list_vt_map$fopr(x: &x >> _): (y)
//
fun{
x:vt0p}{y:vt0p
}
  list_vt_map{n:nat}
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s + n)
  | xs: !list_vt(INV(x), n)
  ): list_vt(y, n)
//
(* ****** ****** *)
//
fun{
x:vt0p}{y:vt0p
} list_vt_mapfree$fopr(x: &(x) >> x?): (y)
//
fun{
x:vt0p}{y:vt0p
} list_vt_mapfree{n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | xs: list_vt(INV(x), n)
  ) : list_vt(y, n)
//
(* ****** ****** *)
//
fun{
x:vt0p
}
  list_vt_foreach
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | xs: !list_vt(INV(x), n)
  ): void
//
fun{x:vt0p}{env:vt0p}
  list_vt_foreach_env
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | xs: !list_vt(INV(x), n)
  , env: &(env) >> _
  ): void
//
fun{
x:vt0p}{env:vt0p
} list_vt_foreach$cont(x: &x, env: &env): bool
fun{
x:vt0p}{env:vt0p
} list_vt_foreach$fwork(x: &x >> _, env: &(env) >> _): void
//
(* ****** ****** *)
fun
  {x:vt0p}
  {vt:viewt0ype}
  list_vt_foreach_funenv
  {fe:eff}
  {t1,s1:nat}
  {v:view}
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n + n * t1, s + n * s1)
  , pfv: !INV(v)
  | xs: !list_vt(INV(x), n)
  , f: {t,s:nat}
       ( !INV(v)
       , !O(t,s) >> O(t + t1, s + s1)
       | &x
       , !INV(vt)
       ) -<fe> void
  , env: !vt
  ) :<fe,!wrt> void // end of [list_vt_foreach_funenv]
//
(* ****** ****** *)
(* ****** ****** *)
fun
  {x:vt0p}
  {vt:viewt0ype}
  list_vt_iforeach_funenv
  {fe:eff}
  {t1,s1:nat}
  {v:view}
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n + n * t1, s + n * s1)
  , pfv: !INV(v)
  | xs: !list_vt(INV(x), n)
  , f: {t,s:nat}
       ( !INV(v)
       , !O(t,s) >> O(t + t1, s + s1)
       | intGte(0)
       , &x
       , !INV(vt)
       ) -<fe> bool
  , env: !vt
  ) :<fe,!wrt> void // end of [list_vt_foreach_funenv]
//
(* ****** ****** *)
//
//
(* ****** ****** *)
//
(*
HX-2016-12:
Fisher–Yates shuffle
*)
//
fun{a:t0p}
list_vt_permute
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n, s)
  | xs: list_vt(INV(a), n)
  ):<> list_vt(a, n)
//
fun{(*void*)}
list_vt_permute$randint{n:nat | n > 0}(int(n)): natLt(n)
//
(* ****** ****** *)
//
fun{
a:vt0p
} list_vt_mergesort
  {n:nat} 
  {t,s:nat}
  ( !O(t,s) >> [i:nat | i < n] O(t + n * i, s + n)
  | xs: list_vt(INV(a), n)
  ):<!wrt> list_vt(a, n)
fun{
a:vt0p
} list_vt_mergesort$cmp(x1: &RD(a), x2: &RD(a)):<> int(*sgn*)
//
fun{
a:vt0p
} list_vt_mergesort_fun
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> [i:nat | i < n] O(t + n * i, s + n)
  | xs: list_vt(INV(a), n)
  , cmp: cmpref (a)
  ) :<!wrt> list_vt(a, n) // end of [list_vt_mergesort_fun]
//
(* ****** ****** *)
//
fun{
a:vt0p
} list_vt_quicksort
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n * n, s + n)
  | xs: list_vt(INV(a), n)
  ):<!wrt> list_vt(a, n)
fun{
a:vt0p
} list_vt_quicksort$cmp(x1: &RD(a), x2: &RD(a)):<> int(*sgn*)
//
fun{
a:vt0p
} list_vt_quicksort_fun
  {n:nat}
  {t,s:nat}
  ( !O(t,s) >> O(t + n * n, s + n)
  | xs: list_vt(INV(a), n)
  , cmp: cmpref (a)
  ) :<!wrt> list_vt(a, n) // end of [list_vt_quicksort_fun]
//
(* ****** ****** *)
//
fun
{a:vt0p}
streamize_list_vt_elt(List_vt(INV(a))):<!wrt> stream_vt(a)
//
fun
{a,b:vt0p}
streamize_list_vt_zip{n:nat}
(list_vt(INV(a), n), list_vt(INV(b), n)):<!wrt> stream_vt(@(a, b))
//
(* ****** ****** *)
//
// HX: overloading
// for certain symbols
//
(* ****** ****** *)
//
overload [] with list_vt_get_at
overload [] with list_vt_set_at
//
overload iseqz with list_vt_is_nil
overload isneqz with list_vt_is_cons
//
overload length with list_vt_length
//
overload copy with list_vt_copy
overload free with list_vt_free
//
overload print with print_list_vt
overload prerr with prerr_list_vt
overload fprint with fprint_list_vt
overload fprint with fprint_list_vt_sep
//
(* ****** ****** *)

overload reverse with list_vt_reverse

(* ****** ****** *)

(* end of [list_vt.sats] *)