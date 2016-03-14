open Service
open Core.Std
open Sexplib.Std

let example : service = {
  params = [];
  start = Single "ls";
  stop = Single "ls /";
  init = Multiple ["cd /"; "ls"]
}

let () =
  let parsed = load_from_file "test.svc" in
    Printf.printf "%b\n" @@ ((show_service example) = (show_service parsed))
