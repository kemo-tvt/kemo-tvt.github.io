-module(sketch@angle).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([deg/1, rad/1, grad/1, turn/1, to_string/1]).
-export_type([angle/0]).

-opaque angle() :: {deg, float()} |
    {rad, float()} |
    {grad, float()} |
    {turn, float()}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/angle.gleam", 10).
-spec deg(float()) -> angle().
deg(Value) ->
    {deg, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/angle.gleam", 14).
-spec rad(float()) -> angle().
rad(Value) ->
    {rad, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/angle.gleam", 18).
-spec grad(float()) -> angle().
grad(Value) ->
    {grad, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/angle.gleam", 22).
-spec turn(float()) -> angle().
turn(Value) ->
    {turn, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/angle.gleam", 26).
-spec to_string(angle()) -> binary().
to_string(Angle) ->
    case Angle of
        {deg, Value} ->
            <<(gleam_stdlib:float_to_string(Value))/binary, "deg"/utf8>>;

        {rad, Value@1} ->
            <<(gleam_stdlib:float_to_string(Value@1))/binary, "rad"/utf8>>;

        {grad, Value@2} ->
            <<(gleam_stdlib:float_to_string(Value@2))/binary, "grad"/utf8>>;

        {turn, Value@3} ->
            <<(gleam_stdlib:float_to_string(Value@3))/binary, "turn"/utf8>>
    end.
