#include "$PATSHOMELOCS/ats-linecount-0.2.1/lines.dats"
#include "share/atspre_staload_libats_ML.hats"

staload "libats/ML/SATS/string.sats"

fun display_help() : void =
  println!("ats-wc - line counter written in ATS
\33[36mUSAGE:\33[0m ats-wc [FLAG] ... [FILE] ...
\33[36mFLAGS:\33[0m
    -h, --help             Distplay this help")

fun is_flag(s : string) : bool =
  string_is_prefix("-", s)

fun should_help { n : nat | n > 0 }(argc : int(n), argv : !argv(n)) : bool =
  let
    fun loop {n:nat}{ m : nat | m < n }(i : int(m), argc : int(n), argv : !argv(n)) : bool =
      ifcase
        | i + 1 < argc => loop(i + 1, argc, argv)
        | let
          var s = argv[i]
        in
          s = "-h" || s = "--help"
        end => true
        | _ => false
  in
    loop(0, argc, argv)
  end

fun cli_loop { n : nat | n > 1 }(argc : int(n), argv : !argv(n)) : void =
  let
    fun p_wc {n:nat}{ m : nat | m < n }(i : int(m), argv : !argv(n)) : int =
      let
        var s = argv[i]
        var c = line_count(s)
        val _ = if test_file_isdir(s) = 0 then
          println!(c, " ", s)
      in
        c
      end
    
    fun loop {n:nat}{ m : nat | m < n }(i : int(m), argc : int(n), argv : !argv(n)) : int =
      ifcase
        | i + 1 < argc => let
          var total = p_wc(i, argv)
        in
          total + loop(i + 1, argc, argv)
        end
        | _ => p_wc(i, argv)
    
    var total = loop(1, argc, argv)
  in
    if argc >= 3 then
      println!(total, " total")
  end

implement main0 (argc, argv) =
  if should_help(argc, argv) then
    display_help()
  else
    if argc > 1 then
      cli_loop(argc, argv)
    else
      (prerr!("\33[31mError:\33[0m no input given\n") ; exit(1))