open Sexplib.Std
open Core.Std

type command = Single of string | Multiple of string list

type service = {
  params : string list;
  start  : command;
  stop   : command;
  init   : command
}

let sexp_of_command t =
  let sa x = Sexp.Atom x and sl x = Sexp.List x in
    match t with
      | Single s    -> sl [sa "Single"; sa s]
      | Multiple strings -> sl [sa "Multiple"; List.sexp_of_t sa strings]

let sexp_of_service t =
  let sa x = Sexp.Atom x and sl x = Sexp.List x in
    sl [ sl [sa "params"; List.sexp_of_t sa t.params];
         sl [sa "start"; sexp_of_command t.start];
         sl [sa "stop"; sexp_of_command t.stop];
         sl [sa "init"; sexp_of_command t.init] ]
