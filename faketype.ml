open Core.Std


let () =
  match Array.to_list Sys.argv with
  | [] -> assert false
  | _ :: args ->
     let arg_string = String.concat args ~sep:" " in
     print_string arg_string;
     print_newline ()
