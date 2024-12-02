-module(sketch@internals@class).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([no_class/0, class_id/1, class_name/1, rules/1, definitions/1, set_rules/2, create/4]).
-export_type([definitions/0, content/0]).

-type definitions() :: {definitions, list(binary()), list(binary()), binary()}.

-opaque content() :: {content,
        binary(),
        integer(),
        definitions(),
        gleam@option:option(list(integer()))}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/class.gleam", 23).
-spec no_class() -> content().
no_class() ->
    Defs = {definitions, [], [], <<""/utf8>>},
    {content, <<""/utf8>>, -1, Defs, none}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/class.gleam", 28).
-spec class_id(content()) -> integer().
class_id(Class) ->
    erlang:element(3, Class).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/class.gleam", 32).
-spec class_name(content()) -> binary().
class_name(Class) ->
    erlang:element(2, Class).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/class.gleam", 36).
-spec rules(content()) -> gleam@option:option(list(integer())).
rules(Class) ->
    erlang:element(5, Class).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/class.gleam", 40).
-spec definitions(content()) -> list(binary()).
definitions(Class) ->
    {definitions, Medias, Selectors, Class@1} = erlang:element(4, Class),
    _pipe = [[Class@1], Selectors, Medias],
    gleam@list:flatten(_pipe).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/class.gleam", 46).
-spec set_rules(content(), list(integer())) -> content().
set_rules(Class, Rules) ->
    erlang:setelement(5, Class, {some, Rules}).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/class.gleam", 50).
-spec create(
    binary(),
    integer(),
    gleam@option:option(list(integer())),
    definitions()
) -> content().
create(Class_name, Class_id, Rules, Definitions) ->
    {content, Class_name, Class_id, Definitions, Rules}.
