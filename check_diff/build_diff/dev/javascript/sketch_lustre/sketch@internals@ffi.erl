-module(sketch@internals@ffi).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([wrap/1, set/2, get/1, create_document_stylesheet/0, create_shadow_root_stylesheet/1, set_stylesheet/2]).
-export_type([mutable/1]).

-opaque mutable(QZT) :: {mutable, QZT}.

-spec wrap(QZU) -> mutable(QZU).
wrap(Value) ->
    {mutable, Value}.

-spec set(mutable(QZW), QZW) -> mutable(QZW).
set(_, Value) ->
    {mutable, Value}.

-spec get(mutable(QZZ)) -> QZZ.
get(Variable) ->
    erlang:element(2, Variable).

-spec create_document_stylesheet() -> gleam@dynamic:dynamic_().
create_document_stylesheet() ->
    gleam_stdlib:identity(0).

-spec create_shadow_root_stylesheet(plinth@browser@shadow:shadow_root()) -> gleam@dynamic:dynamic_().
create_shadow_root_stylesheet(_) ->
    gleam_stdlib:identity(0).

-spec set_stylesheet(binary(), gleam@dynamic:dynamic_()) -> nil.
set_stylesheet(_, _) ->
    nil.
