-record(element, {
    key :: binary(),
    namespace :: binary(),
    tag :: binary(),
    class :: gleam@option:option(sketch@internals@style:class()),
    attributes :: list(lustre@internals@vdom:attribute(any())),
    children :: list(sketch@lustre@element:element(any()))
}).
