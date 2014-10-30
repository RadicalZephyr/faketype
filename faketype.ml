open Core.Std


let () =
  let arg_string = String.concat (Array.to_list Sys.argv) ~sep:" " in
  print_string arg_string
