open Core.Std

let flush_char char =
  Out_channel.output_char stdout char;
  Out_channel.flush stdout

let iter_humanly ~f str =
  let rec iter i last =
    match i < last with
    | true  ->
       Time.pause (Time.Span.of_float 0.1);
       f (String.get str i);
       iter (i+1) last
    | false -> ()
  in
  iter 0 (String.length str)

let () =
  match Array.to_list Sys.argv with
  | [] -> assert false
  | _ :: args ->
     let arg_string = String.concat args ~sep:" " in
     iter_humanly ~f:flush_char arg_string
