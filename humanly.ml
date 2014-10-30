open Core.Std

let iter ~f str =
  let rec iter i last =
    match i < last with
    | true  ->
       Time.pause (Time.Span.of_float 0.1);
       f (String.get str i);
       iter (i+1) last
    | false -> ()
  in
  iter 0 (String.length str)
