-module(sketch@size).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([px/1, px_/1, pt/1, pt_/1, percent/1, percent_/1, vh/1, vh_/1, vw/1, vw_/1, em/1, 'rem'/1, lh/1, rlh/1, ch/1, ch_/1, to_string/1]).
-export_type([size/0]).

-opaque size() :: {px, float()} |
    {pt, float()} |
    {vh, float()} |
    {vw, float()} |
    {em, float()} |
    {'rem', float()} |
    {lh, float()} |
    {rlh, float()} |
    {ch, float()} |
    {pct, float()}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 25).
-spec px(integer()) -> size().
px(Value) ->
    {px, erlang:float(Value)}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 29).
-spec px_(float()) -> size().
px_(Value) ->
    {px, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 33).
-spec pt(integer()) -> size().
pt(Value) ->
    {pt, erlang:float(Value)}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 37).
-spec pt_(float()) -> size().
pt_(Value) ->
    {pt, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 41).
-spec percent(integer()) -> size().
percent(Value) ->
    {pct, erlang:float(Value)}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 45).
-spec percent_(float()) -> size().
percent_(Value) ->
    {pct, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 49).
-spec vh(integer()) -> size().
vh(Value) ->
    {vh, erlang:float(Value)}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 53).
-spec vh_(float()) -> size().
vh_(Value) ->
    {vh, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 57).
-spec vw(integer()) -> size().
vw(Value) ->
    {vw, erlang:float(Value)}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 61).
-spec vw_(float()) -> size().
vw_(Value) ->
    {vw, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 65).
-spec em(float()) -> size().
em(Value) ->
    {em, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 69).
-spec 'rem'(float()) -> size().
'rem'(Value) ->
    {'rem', Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 73).
-spec lh(float()) -> size().
lh(Value) ->
    {lh, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 77).
-spec rlh(float()) -> size().
rlh(Value) ->
    {rlh, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 81).
-spec ch(integer()) -> size().
ch(Value) ->
    {ch, erlang:float(Value)}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 85).
-spec ch_(float()) -> size().
ch_(Value) ->
    {ch, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/size.gleam", 91).
-spec to_string(size()) -> binary().
to_string(Size) ->
    case Size of
        {px, Value} ->
            gleam@string:append(
                gleam_stdlib:float_to_string(Value),
                <<"px"/utf8>>
            );

        {pt, Value@1} ->
            gleam@string:append(
                gleam_stdlib:float_to_string(Value@1),
                <<"pt"/utf8>>
            );

        {pct, Value@2} ->
            gleam@string:append(
                gleam_stdlib:float_to_string(Value@2),
                <<"%"/utf8>>
            );

        {vh, Value@3} ->
            gleam@string:append(
                gleam_stdlib:float_to_string(Value@3),
                <<"vh"/utf8>>
            );

        {vw, Value@4} ->
            gleam@string:append(
                gleam_stdlib:float_to_string(Value@4),
                <<"vw"/utf8>>
            );

        {em, Value@5} ->
            gleam@string:append(
                gleam_stdlib:float_to_string(Value@5),
                <<"em"/utf8>>
            );

        {'rem', Value@6} ->
            gleam@string:append(
                gleam_stdlib:float_to_string(Value@6),
                <<"rem"/utf8>>
            );

        {lh, Value@7} ->
            gleam@string:append(
                gleam_stdlib:float_to_string(Value@7),
                <<"lh"/utf8>>
            );

        {rlh, Value@8} ->
            gleam@string:append(
                gleam_stdlib:float_to_string(Value@8),
                <<"rlh"/utf8>>
            );

        {ch, Value@9} ->
            gleam@string:append(
                gleam_stdlib:float_to_string(Value@9),
                <<"ch"/utf8>>
            )
    end.
