-module(sketch@media).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([dark_theme/0, light_theme/0, max_width/1, min_width/1, max_height/1, min_height/1, 'and'/2, 'or'/2, 'not'/1, landscape/0, portrait/0, to_string/1]).
-export_type([color_mode/0, 'query'/0]).

-opaque color_mode() :: dark | light.

-opaque 'query'() :: {max_width, sketch@size:size()} |
    {min_width, sketch@size:size()} |
    {max_height, sketch@size:size()} |
    {min_height, sketch@size:size()} |
    {color_scheme, color_mode()} |
    {'and', 'query'(), 'query'()} |
    {'or', 'query'(), 'query'()} |
    {'not', 'query'()} |
    {orientation, binary()}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/media.gleam", 32).
-spec dark_theme() -> 'query'().
dark_theme() ->
    {color_scheme, dark}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/media.gleam", 36).
-spec light_theme() -> 'query'().
light_theme() ->
    {color_scheme, light}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/media.gleam", 40).
-spec max_width(sketch@size:size()) -> 'query'().
max_width(Size) ->
    {max_width, Size}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/media.gleam", 44).
-spec min_width(sketch@size:size()) -> 'query'().
min_width(Size) ->
    {min_width, Size}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/media.gleam", 48).
-spec max_height(sketch@size:size()) -> 'query'().
max_height(Size) ->
    {max_height, Size}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/media.gleam", 52).
-spec min_height(sketch@size:size()) -> 'query'().
min_height(Size) ->
    {min_height, Size}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/media.gleam", 56).
-spec 'and'('query'(), 'query'()) -> 'query'().
'and'(First, Second) ->
    {'and', First, Second}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/media.gleam", 60).
-spec 'or'('query'(), 'query'()) -> 'query'().
'or'(First, Second) ->
    {'or', First, Second}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/media.gleam", 64).
-spec 'not'('query'()) -> 'query'().
'not'(Query) ->
    {'not', Query}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/media.gleam", 68).
-spec landscape() -> 'query'().
landscape() ->
    {orientation, <<"landscape"/utf8>>}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/media.gleam", 72).
-spec portrait() -> 'query'().
portrait() ->
    {orientation, <<"portrait"/utf8>>}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/media.gleam", 76).
-spec q_to_str('query'()) -> binary().
q_to_str(Query) ->
    case Query of
        {color_scheme, dark} ->
            <<"(prefers-color-scheme: dark)"/utf8>>;

        {color_scheme, light} ->
            <<"(prefers-color-scheme: light)"/utf8>>;

        {max_width, S} ->
            gleam@string:join(
                [<<"(max-width: "/utf8>>,
                    sketch@size:to_string(S),
                    <<")"/utf8>>],
                <<""/utf8>>
            );

        {min_width, S@1} ->
            gleam@string:join(
                [<<"(min-width: "/utf8>>,
                    sketch@size:to_string(S@1),
                    <<")"/utf8>>],
                <<""/utf8>>
            );

        {max_height, S@2} ->
            gleam@string:join(
                [<<"(max-height: "/utf8>>,
                    sketch@size:to_string(S@2),
                    <<")"/utf8>>],
                <<""/utf8>>
            );

        {min_height, S@3} ->
            gleam@string:join(
                [<<"(min-height: "/utf8>>,
                    sketch@size:to_string(S@3),
                    <<")"/utf8>>],
                <<""/utf8>>
            );

        {orientation, O} ->
            gleam@string:join(
                [<<"(orientation: "/utf8>>, O, <<")"/utf8>>],
                <<""/utf8>>
            );

        {'not', Q} ->
            gleam@string:append(<<"not "/utf8>>, q_to_str(Q));

        {'and', Fst, Snd} ->
            gleam@string:join(
                [q_to_str(Fst), <<"and"/utf8>>, q_to_str(Snd)],
                <<" "/utf8>>
            );

        {'or', Fst@1, Snd@1} ->
            gleam@string:join(
                [q_to_str(Fst@1), <<"or"/utf8>>, q_to_str(Snd@1)],
                <<" "/utf8>>
            )
    end.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/media.gleam", 93).
-spec to_string('query'()) -> binary().
to_string(Query) ->
    Content = q_to_str(Query),
    gleam@string:append(<<"@media "/utf8>>, Content).
