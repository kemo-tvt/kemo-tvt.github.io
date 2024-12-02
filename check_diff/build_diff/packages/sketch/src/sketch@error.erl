-module(sketch@error).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export_type([sketch_error/0]).

-type sketch_error() :: not_a_browser |
    {otp_error, gleam@otp@actor:start_error()}.


