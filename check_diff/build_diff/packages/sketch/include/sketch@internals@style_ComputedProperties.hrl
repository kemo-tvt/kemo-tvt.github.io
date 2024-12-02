-record(computed_properties, {
    properties :: list(binary()),
    medias :: list(sketch@internals@style:media_property()),
    pseudo_selectors :: list(sketch@internals@style:pseudo_property()),
    indent :: integer()
}).
