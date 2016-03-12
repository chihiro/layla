open Service
open Sexplib.Std
open Core.Std

let () =
  let open Printf in
    printf "%s\n" @@ Sexp.to_string @@ sexp_of_service {
      params = ["-A"; "-t"];
      start = Multiple [];
      stop = Multiple [];
      init = Multiple []
    } 
