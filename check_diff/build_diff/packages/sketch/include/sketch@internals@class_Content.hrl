-record(content, {
    class_name :: binary(),
    class_id :: integer(),
    definitions :: sketch@internals@class:definitions(),
    rules :: gleam@option:option(list(integer()))
}).
