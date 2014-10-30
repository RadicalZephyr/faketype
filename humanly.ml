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
  let avg_time = get_average_time_for_typist typist in
  let mod_range = avg_time *. 1.5 in
  let mod_offset = avg_time /. 1. in
  let modulation = (Random.float mod_range) -. mod_offset in
  Time.Span.of_float (Float.abs (avg_time +. modulation))

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
