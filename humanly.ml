open Core.Std

type typist =
  | Best | Good | Average | Poor | Worst


let get_average_time_for_typist t =
  match t with
  | Best    -> 0.08
  | Good    -> 0.12
  | Average -> 0.2
  | Poor    -> 0.28
  | Worst   -> 1.2

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
