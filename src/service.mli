type command = Single of string | Multiple of string list [@@deriving sexp, show]

type service = {
  params : string list;
  start  : command;
  stop   : command;
  init   : command
} [@@deriving sexp, show]

val load_from_file : string -> service
