(***********************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team    *)
(* <O___,, *        INRIA-Rocquencourt  &  LRI-CNRS-Orsay              *)
(*   \VV/  *************************************************************)
(*    //   *      This file is distributed under the terms of the      *)
(*         *       GNU Lesser General Public License Version 2.1       *)
(***********************************************************************)

(*i $Id$ *)

(*i*)
open Names
open Term
open Termops
open Sign
open Environ
open Libnames
open Nametab
open Rawterm
open Pattern
open Topconstr
open Symbols
(*i*)

(* Translation of pattern, cases pattern, rawterm and term into syntax
   trees for printing *)

val extern_cases_pattern : cases_pattern -> cases_pattern_expr
val extern_rawconstr : rawconstr -> constr_expr
val extern_pattern : env -> names_context -> constr_pattern -> constr_expr

(* If [b=true] in [extern_constr b env c] then the variables in the first 
   level of quantification clashing with the variables in [env] are renamed *)

val extern_constr : bool -> env -> constr -> constr_expr
val extern_reference : loc -> global_reference -> reference

(* For debugging *)
val print_implicits : bool ref
val print_arguments : bool ref
val print_evar_arguments : bool ref
val print_coercions : bool ref
val print_universes : bool ref
val print_no_symbol : bool ref

(* This governs printing of implicit arguments. If [with_implicits] is
   on and not [with_arguments] then implicit args are printed prefixed
   by "!"; if [with_implicits] and [with_arguments] are both on the
   function and not the arguments is prefixed by "!" *)
val with_implicits : ('a -> 'b) -> 'a -> 'b
val with_arguments : ('a -> 'b) -> 'a -> 'b

(* This forces printing of coercions *)
val with_coercions : ('a -> 'b) -> 'a -> 'b

(* This forces printing universe names of Type{.} *)
val with_universes : ('a -> 'b) -> 'a -> 'b

(* This suppresses printing of numeral and symbols *)
val without_symbols : ('a -> 'b) -> 'a -> 'b
