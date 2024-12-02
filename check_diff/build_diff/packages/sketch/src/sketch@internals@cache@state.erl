-module(sketch@internals@cache@state).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([loop/2]).
-export_type([request/0]).

-type request() :: {render, gleam@erlang@process:subject(binary())} |
    {fetch,
        sketch@internals@style:class(),
        gleam@erlang@process:subject(binary())}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/cache/state.gleam", 13).
-spec loop(request(), sketch@internals@style:cache()) -> gleam@otp@actor:next(any(), sketch@internals@style:cache()).
loop(Msg, Cache) ->
    case Msg of
        {render, Subject} ->
            gleam@erlang@process:send(
                Subject,
                sketch@internals@style:render(Cache)
            ),
            gleam@otp@actor:continue(Cache);

        {fetch, Class, Subject@1} ->
            {Cache@1, Class_name} = sketch@internals@style:class_name(
                Class,
                Cache
            ),
            gleam@erlang@process:send(Subject@1, Class_name),
            gleam@otp@actor:continue(Cache@1)
    end.
