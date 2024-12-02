-module(sketch@transform).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([translate2/2, translate/1, translate_x/1, translate_y/1, scale2/2, scale/1, scale_x/1, scale_y/1, rotate/1, skew_x/1, skew_y/1, to_string/1]).
-export_type([transform/0]).

-opaque transform() :: {translate, sketch@size:size(), sketch@size:size()} |
    {translate_x, sketch@size:size()} |
    {translate_y, sketch@size:size()} |
    {scale, float(), float()} |
    {scale_x, float()} |
    {scale_y, float()} |
    {rotate, sketch@angle:angle()} |
    {skew_x, sketch@angle:angle()} |
    {skew_y, sketch@angle:angle()}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/transform.gleam", 19).
-spec transform_to_string(transform()) -> binary().
transform_to_string(Value) ->
    case Value of
        {translate, X, Y} ->
            <<<<"translate("/utf8,
                    (gleam@string:join(
                        [sketch@size:to_string(X), sketch@size:to_string(Y)],
                        <<","/utf8>>
                    ))/binary>>/binary,
                ")"/utf8>>;

        {translate_x, X@1} ->
            <<<<"translateX("/utf8, (sketch@size:to_string(X@1))/binary>>/binary,
                ")"/utf8>>;

        {translate_y, Y@1} ->
            <<<<"translateY("/utf8, (sketch@size:to_string(Y@1))/binary>>/binary,
                ")"/utf8>>;

        {scale, X@2, Y@2} ->
            <<<<"scale("/utf8,
                    (gleam@string:join(
                        [gleam_stdlib:float_to_string(X@2),
                            gleam_stdlib:float_to_string(Y@2)],
                        <<","/utf8>>
                    ))/binary>>/binary,
                ")"/utf8>>;

        {scale_x, X@3} ->
            <<<<"scaleX("/utf8, (gleam_stdlib:float_to_string(X@3))/binary>>/binary,
                ")"/utf8>>;

        {scale_y, Y@3} ->
            <<<<"scaleY("/utf8, (gleam_stdlib:float_to_string(Y@3))/binary>>/binary,
                ")"/utf8>>;

        {rotate, Ang} ->
            <<<<"rotate("/utf8, (sketch@angle:to_string(Ang))/binary>>/binary,
                ")"/utf8>>;

        {skew_x, X@4} ->
            <<<<"skewX("/utf8, (sketch@angle:to_string(X@4))/binary>>/binary,
                ")"/utf8>>;

        {skew_y, Y@4} ->
            <<<<"skewY("/utf8, (sketch@angle:to_string(Y@4))/binary>>/binary,
                ")"/utf8>>
    end.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/transform.gleam", 39).
-spec translate2(sketch@size:size(), sketch@size:size()) -> transform().
translate2(X, Y) ->
    {translate, X, Y}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/transform.gleam", 44).
-spec translate(sketch@size:size()) -> transform().
translate(X) ->
    translate2(X, sketch@size:percent(0)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/transform.gleam", 48).
-spec translate_x(sketch@size:size()) -> transform().
translate_x(X) ->
    {translate_x, X}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/transform.gleam", 52).
-spec translate_y(sketch@size:size()) -> transform().
translate_y(Y) ->
    {translate_y, Y}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/transform.gleam", 56).
-spec scale2(float(), float()) -> transform().
scale2(X, Y) ->
    {scale, X, Y}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/transform.gleam", 61).
-spec scale(float()) -> transform().
scale(X) ->
    scale2(X, X).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/transform.gleam", 65).
-spec scale_x(float()) -> transform().
scale_x(X) ->
    {scale_x, X}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/transform.gleam", 69).
-spec scale_y(float()) -> transform().
scale_y(Y) ->
    {scale_y, Y}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/transform.gleam", 73).
-spec rotate(sketch@angle:angle()) -> transform().
rotate(Value) ->
    {rotate, Value}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/transform.gleam", 77).
-spec skew_x(sketch@angle:angle()) -> transform().
skew_x(X) ->
    {skew_x, X}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/transform.gleam", 81).
-spec skew_y(sketch@angle:angle()) -> transform().
skew_y(X) ->
    {skew_y, X}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/transform.gleam", 85).
-spec to_string(list(transform())) -> binary().
to_string(Value) ->
    case Value of
        [] ->
            <<"none"/utf8>>;

        Transform_list ->
            _pipe = gleam@list:map(Transform_list, fun transform_to_string/1),
            gleam@string:join(_pipe, <<" "/utf8>>)
    end.
