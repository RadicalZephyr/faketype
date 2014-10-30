open Core.Std

let flush_char char =
  Out_channel.output_char stdout char;
  Out_channel.flush stdout

let () =
  match Array.to_list Sys.argv with
  | [] -> assert false
  | _ :: args ->
     let arg_string = String.concat args ~sep:" " in
     String.iter arg_string ~f:flush_char
