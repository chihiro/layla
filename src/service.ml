open Sexplib.Std
open Core.Std

type command = Single of string | Multiple of string list [@@deriving sexp, show]

type service = {
  params : string list;
  start  : command;
  stop   : command;
  init   : command
} [@@deriving sexp, show]

let load_from_file filename =
  let contents = In_channel.with_file filename ~f:In_channel.input_all in
    service_of_sexp @@ Sexp.of_string @@ String.strip contents
