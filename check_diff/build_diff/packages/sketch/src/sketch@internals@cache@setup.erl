-module(sketch@internals@cache@setup).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([ephemeral/0, persistent/0, render/1, class_name/2]).
-export_type([cache/0]).

-opaque cache() :: {persistent_cache,
        gleam@erlang@process:subject(sketch@internals@cache@state:request())} |
    {ephemeral_cache, sketch@internals@style:cache()}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/cache/setup.gleam", 20).
-spec ephemeral() -> cache().
ephemeral() ->
    {ephemeral_cache, sketch@internals@style:ephemeral()}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/cache/setup.gleam", 25).
-spec persistent() -> {ok, cache()} | {error, sketch@error:sketch_error()}.
persistent() ->
    Subject = gleam@otp@actor:start(
        sketch@internals@style:persistent(),
        fun sketch@internals@cache@state:loop/2
    ),
    _pipe = Subject,
    _pipe@1 = gleam@result:map(
        _pipe,
        fun(Field@0) -> {persistent_cache, Field@0} end
    ),
    gleam@result:map_error(_pipe@1, fun(Field@0) -> {otp_error, Field@0} end).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/cache/setup.gleam", 33).
-spec render(cache()) -> binary().
render(Cache) ->
    case Cache of
        {ephemeral_cache, Cache@1} ->
            sketch@internals@style:render(Cache@1);

        {persistent_cache, Subject} ->
            _pipe = gleam@erlang@process:try_call(
                Subject,
                fun(Field@0) -> {render, Field@0} end,
                1000
            ),
            _pipe@1 = gleam@result:replace_error(_pipe, nil),
            gleam@result:unwrap(_pipe@1, <<""/utf8>>)
    end.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/cache/setup.gleam", 45).
-spec class_name(sketch@internals@style:class(), cache()) -> {cache(), binary()}.
class_name(Class, Cache) ->
    case Cache of
        {ephemeral_cache, Cache@1} ->
            {Cache@2, Class_name} = sketch@internals@style:class_name(
                Class,
                Cache@1
            ),
            {{ephemeral_cache, Cache@2}, Class_name};

        {persistent_cache, Subject} ->
            {class, _, C} = Class,
            gleam@bool:guard(
                gleam@list:is_empty(C),
                {Cache, <<""/utf8>>},
                fun() ->
                    _pipe = gleam@erlang@process:try_call(
                        Subject,
                        fun(_capture) -> {fetch, Class, _capture} end,
                        100
                    ),
                    _pipe@1 = gleam@result:unwrap(_pipe, <<""/utf8>>),
                    gleam@pair:new(Cache, _pipe@1)
                end
            )
    end.
