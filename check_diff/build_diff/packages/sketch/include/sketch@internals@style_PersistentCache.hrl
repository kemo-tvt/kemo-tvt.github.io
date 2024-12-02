-record(persistent_cache, {
    cache :: gleam@dict:dict(binary(), {sketch@internals@class:content(),
        sketch@internals@style:computed_properties()}),
    current_id :: integer()
}).
