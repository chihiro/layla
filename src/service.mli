type command = Single of string | Multiple of string list

type service = {
  params : string list;
  start  : command;
  stop   : command;
  init   : command
}

val sexp_of_service : service -> Sexplib.Type.t
val sexp_of_command : command -> Sexplib.Type.t
(* TODO *)
(* val command_of_sexp : Sexplib.Type.t -> command *)
(* val service_of_sexp : Sexplib.Type.t -> service *)
