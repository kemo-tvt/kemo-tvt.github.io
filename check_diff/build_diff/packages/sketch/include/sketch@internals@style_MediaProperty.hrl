-record(media_property, {
    'query' :: binary(),
    properties :: list(binary()),
    pseudo_selectors :: list(sketch@internals@style:pseudo_property())
}).
