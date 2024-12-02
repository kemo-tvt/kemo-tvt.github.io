-module(sketch@internals@string).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([indent/1, wrap_class/4]).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/string.gleam", 4).
-spec indent(integer()) -> binary().
indent(Indent) ->
    gleam@string:repeat(<<" "/utf8>>, Indent).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/string.gleam", 8).
-spec wrap_class(
    binary(),
    list(binary()),
    integer(),
    gleam@option:option(binary())
) -> binary().
wrap_class(Id, Properties, Idt, Pseudo) ->
    Base_indent = indent(Idt),
    Pseudo_ = gleam@option:unwrap(Pseudo, <<""/utf8>>),
    _pipe = [<<<<<<<<Base_indent/binary, "."/utf8>>/binary, Id/binary>>/binary,
                Pseudo_/binary>>/binary,
            " {"/utf8>> |
        Properties],
    _pipe@1 = gleam@string:join(_pipe, <<"\n"/utf8>>),
    gleam@string:append(
        _pipe@1,
        <<<<"\n"/utf8, Base_indent/binary>>/binary, "}"/utf8>>
    ).
