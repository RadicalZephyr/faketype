open Core.Std

let get_next_span () =
  Time.Span.of_float 0.1

let iter ~f str =
  let rec iter i last =
    match i < last with
    | true  ->
       Time.pause (get_next_span ());
       f (String.get str i);
       iter (i+1) last
    | false -> ()
  in
  iter 0 (String.length str)
