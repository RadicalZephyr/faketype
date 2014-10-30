open Core.Std

type typist =
  | Best | Good | Average | Poor | Worst


let get_average_time_for_typist typist =
  match typist with
  | Best    -> 0.08
  | Good    -> 0.12
  | Average -> 0.2
  | Poor    -> 0.28
  | Worst   -> 1.2

let get_next_span typist =
  Time.Span.of_float (get_average_time_for_typist typist)

let iter ?(typist=Good) ~f str =
  let rec iter i last =
    match i < last with
    | true  ->
       Time.pause (get_next_span typist);
       f (String.get str i);
       iter (i+1) last
    | false -> ()
  in
  iter 0 (String.length str)
