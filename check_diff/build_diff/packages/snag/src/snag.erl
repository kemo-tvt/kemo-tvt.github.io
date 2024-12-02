-module(snag).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([new/1, error/1, layer/2, context/2, pretty_print/1, line_print/1]).
-export_type([snag/0]).

-type snag() :: {snag, binary(), list(binary())}.

-file("/Users/louis/src/gleam/snag/src/snag.gleam", 39).
-spec new(binary()) -> snag().
new(Issue) ->
    {snag, Issue, []}.

-file("/Users/louis/src/gleam/snag/src/snag.gleam", 51).
-spec error(binary()) -> {ok, any()} | {error, snag()}.
error(Issue) ->
    {error, new(Issue)}.

-file("/Users/louis/src/gleam/snag/src/snag.gleam", 68).
-spec layer(snag(), binary()) -> snag().
layer(Snag, Issue) ->
    {snag, Issue, [erlang:element(2, Snag) | erlang:element(3, Snag)]}.

-file("/Users/louis/src/gleam/snag/src/snag.gleam", 82).
-spec context({ok, FWR} | {error, snag()}, binary()) -> {ok, FWR} |
    {error, snag()}.
context(Result, Issue) ->
    case Result of
        {ok, _} ->
            Result;

        {error, Snag} ->
            {error, layer(Snag, Issue)}
    end.

-file("/Users/louis/src/gleam/snag/src/snag.gleam", 114).
-spec pretty_print_cause(list(binary())) -> binary().
pretty_print_cause(Cause) ->
    _pipe = Cause,
    _pipe@1 = gleam@list:index_map(
        _pipe,
        fun(Line, Index) ->
            gleam@string:concat(
                [<<"  "/utf8>>,
                    gleam@int:to_string(Index),
                    <<": "/utf8>>,
                    Line,
                    <<"\n"/utf8>>]
            )
        end
    ),
    gleam@string:concat(_pipe@1).

-file("/Users/louis/src/gleam/snag/src/snag.gleam", 105).
-spec pretty_print(snag()) -> binary().
pretty_print(Snag) ->
    Output = <<<<"error: "/utf8, (erlang:element(2, Snag))/binary>>/binary,
        "\n"/utf8>>,
    case erlang:element(3, Snag) of
        [] ->
            Output;

        Cause ->
            <<<<Output/binary, "\ncause:\n"/utf8>>/binary,
                (pretty_print_cause(Cause))/binary>>
    end.

-file("/Users/louis/src/gleam/snag/src/snag.gleam", 134).
-spec line_print(snag()) -> binary().
line_print(Snag) ->
    _pipe = [gleam@string:append(<<"error: "/utf8>>, erlang:element(2, Snag)) |
        erlang:element(3, Snag)],
    gleam@string:join(_pipe, <<" <- "/utf8>>).
