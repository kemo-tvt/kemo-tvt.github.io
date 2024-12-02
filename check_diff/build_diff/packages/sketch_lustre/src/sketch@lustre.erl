-module(sketch@lustre).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([compose/3, ssr/2, node/0, document/0, shadow/1]).
-export_type([style_sheet_option/0, options/0, style_sheet/0]).

-type style_sheet_option() :: node |
    document |
    {shadow, plinth@browser@shadow:shadow_root()}.

-opaque options() :: {options, style_sheet_option()}.

-type style_sheet() :: {css_style_sheet, gleam@dynamic:dynamic_()} |
    node_style_sheet.

-spec to_stylesheet(any()) -> style_sheet().
to_stylesheet(_) ->
    node_style_sheet.

-spec render_stylesheet(
    binary(),
    lustre@internals@vdom:element(RHB),
    style_sheet()
) -> lustre@internals@vdom:element(RHB).
render_stylesheet(Content, Node, Stylesheet) ->
    case Stylesheet of
        node_style_sheet ->
            case Node of
                {element, _, _, <<"lustre-fragment"/utf8>>, _, Children, _, _} ->
                    lustre@element:fragment(
                        [lustre@element:element(
                                <<"style"/utf8>>,
                                [],
                                [lustre@element:text(Content)]
                            ) |
                            Children]
                    );

                _ ->
                    lustre@element:fragment(
                        [lustre@element:element(
                                <<"style"/utf8>>,
                                [],
                                [lustre@element:text(Content)]
                            ),
                            Node]
                    )
            end;

        {css_style_sheet, Stylesheet@1} ->
            sketch@internals@ffi:set_stylesheet(Content, Stylesheet@1),
            Node
    end.

-spec compose(
    options(),
    fun((RGG) -> sketch@lustre@element:element(RGH)),
    sketch:cache()
) -> fun((RGG) -> lustre@internals@vdom:element(RGH)).
compose(Options, View, Cache) ->
    Cache@1 = sketch@internals@ffi:wrap(Cache),
    Stylesheet = to_stylesheet(Options),
    fun(Model) ->
        Node = View(Model),
        {Result, Node@1} = sketch@lustre@element:unstyled(
            sketch@internals@ffi:get(Cache@1),
            Node
        ),
        Content = sketch:render(Result),
        sketch@internals@ffi:set(Cache@1, Result),
        render_stylesheet(Content, Node@1, Stylesheet)
    end.

-spec contains_head(lustre@internals@vdom:element(any())) -> boolean().
contains_head(El) ->
    case El of
        {element, _, _, <<"head"/utf8>>, _, _, _, _} ->
            true;

        {element, _, _, _, _, Children, _, _} ->
            gleam@list:fold(
                Children,
                false,
                fun(Acc, Val) -> Acc orelse contains_head(Val) end
            );

        _ ->
            false
    end.

-spec put_in_head(lustre@internals@vdom:element(RGT), binary()) -> lustre@internals@vdom:element(RGT).
put_in_head(El, Content) ->
    case El of
        {element, K, N, <<"head"/utf8>>, A, Children, S, V} ->
            _pipe = Children,
            _pipe@1 = lists:append(
                _pipe,
                [lustre@element@html:style([], Content)]
            ),
            {element, K, N, <<"head"/utf8>>, A, _pipe@1, S, V};

        {element, K@1, N@1, <<"html"/utf8>>, A@1, Children@1, S@1, V@1} ->
            _pipe@2 = Children@1,
            _pipe@3 = gleam@list:map(
                _pipe@2,
                fun(Child) -> put_in_head(Child, Content) end
            ),
            {element, K@1, N@1, <<"html"/utf8>>, A@1, _pipe@3, S@1, V@1};

        Node ->
            Node
    end.

-spec ssr(sketch@lustre@element:element(RGW), sketch:cache()) -> lustre@internals@vdom:element(RGW).
ssr(El, Cache) ->
    {Cache@1, El@1} = sketch@lustre@element:unstyled(Cache, El),
    Stylesheet = sketch:render(Cache@1),
    case contains_head(El@1) of
        true ->
            put_in_head(El@1, Stylesheet);

        false ->
            lustre@element:fragment(
                [lustre@element@html:style([], Stylesheet), El@1]
            )
    end.

-spec node() -> options().
node() ->
    {options, node}.

-spec document() -> options().
document() ->
    {options, document}.

-spec shadow(plinth@browser@shadow:shadow_root()) -> options().
shadow(Root) ->
    {options, {shadow, Root}}.
