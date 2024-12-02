-module(sketch@lustre@element).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([none/0, text/1, element/4, element_/3, namespaced/5, namespaced_/4, fragment/1, keyed/2, map/2, styled/1, unstyled/2]).
-export_type([element/1]).

-opaque element(RAH) :: nothing |
    {text, binary()} |
    {map, fun(() -> element(RAH))} |
    {element,
        binary(),
        binary(),
        binary(),
        gleam@option:option(sketch@internals@style:class()),
        list(lustre@internals@vdom:attribute(RAH)),
        list(element(RAH))}.

-spec none() -> element(any()).
none() ->
    nothing.

-spec text(binary()) -> element(any()).
text(Content) ->
    {text, Content}.

-spec element(
    binary(),
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(RAL)),
    list(element(RAL))
) -> element(RAL).
element(Tag, Class, Attributes, Children) ->
    Class@1 = {some, Class},
    {element, <<""/utf8>>, <<""/utf8>>, Tag, Class@1, Attributes, Children}.

-spec element_(
    binary(),
    list(lustre@internals@vdom:attribute(RAR)),
    list(element(RAR))
) -> element(RAR).
element_(Tag, Attributes, Children) ->
    {element, <<""/utf8>>, <<""/utf8>>, Tag, none, Attributes, Children}.

-spec namespaced(
    binary(),
    binary(),
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(RAX)),
    list(element(RAX))
) -> element(RAX).
namespaced(Namespace, Tag, Class, Attributes, Children) ->
    Class@1 = {some, Class},
    {element, <<""/utf8>>, Namespace, Tag, Class@1, Attributes, Children}.

-spec namespaced_(
    binary(),
    binary(),
    list(lustre@internals@vdom:attribute(RBD)),
    list(element(RBD))
) -> element(RBD).
namespaced_(Namespace, Tag, Attributes, Children) ->
    {element, <<""/utf8>>, Namespace, Tag, none, Attributes, Children}.

-spec fragment(list(element(RBJ))) -> element(RBJ).
fragment(Children) ->
    Attrs = [lustre@attribute:style([{<<"display"/utf8>>, <<"contents"/utf8>>}])],
    {element,
        <<""/utf8>>,
        <<""/utf8>>,
        <<"lustre-fragment"/utf8>>,
        none,
        Attrs,
        Children}.

-spec do_keyed(element(RBU), binary()) -> element(RBU).
do_keyed(Element, Key) ->
    case Element of
        nothing ->
            nothing;

        {text, Content} ->
            {text, Content};

        {map, Subtree} ->
            {map, fun() -> do_keyed(Subtree(), Key) end};

        {element, _, Namespace, Tag, Attributes, Children, Styles} ->
            {element, Key, Namespace, Tag, Attributes, Children, Styles}
    end.

-spec keyed(
    fun((list(element(RBN))) -> element(RBN)),
    list({binary(), element(RBN)})
) -> element(RBN).
keyed(Element, Children) ->
    Element(
        (gleam@list:map(
            Children,
            fun(_use0) ->
                {Key, Child} = _use0,
                do_keyed(Child, Key)
            end
        ))
    ).

-spec map(element(RBX), fun((RBX) -> RBZ)) -> element(RBZ).
map(Element, Mapper) ->
    case Element of
        nothing ->
            nothing;

        {text, Content} ->
            {text, Content};

        {map, Subtree} ->
            {map, fun() -> map(Subtree(), Mapper) end};

        {element, Key, Namespace, Tag, Class, Attributes, Children} ->
            Attributes@1 = gleam@list:map(
                Attributes,
                fun(_capture) -> lustre@attribute:map(_capture, Mapper) end
            ),
            Children@1 = gleam@list:map(
                Children,
                fun(_capture@1) -> map(_capture@1, Mapper) end
            ),
            {element, Key, Namespace, Tag, Class, Attributes@1, Children@1}
    end.

-spec styled(lustre@internals@vdom:element(RCB)) -> element(RCB).
styled(Element) ->
    case Element of
        {map, Subtree} ->
            {map, fun() -> styled(Subtree()) end};

        {text, Content} ->
            {text, Content};

        {element, Key, Namespace, Tag, Attrs, Children, _, _} ->
            Class = none,
            {element,
                Key,
                Namespace,
                Tag,
                Class,
                Attrs,
                gleam@list:map(Children, fun styled/1)}
    end.

-spec unstyled_children(sketch:cache(), list(element(RCE))) -> {sketch:cache(),
    list(lustre@internals@vdom:element(RCE))}.
unstyled_children(Cache, Children) ->
    gleam@list:fold(
        lists:reverse(Children),
        {Cache, []},
        fun(Acc, Child) ->
            {Cache@1, Children@1} = Acc,
            {Cache@2, Child@1} = unstyled(Cache@1, Child),
            {Cache@2, [Child@1 | Children@1]}
        end
    ).

-spec unstyled(sketch:cache(), element(RCE)) -> {sketch:cache(),
    lustre@internals@vdom:element(RCE)}.
unstyled(Cache, Element) ->
    case Element of
        nothing ->
            {Cache, lustre@element:none()};

        {text, Content} ->
            {Cache, lustre@element:text(Content)};

        {map, Subtree} ->
            unstyled(Cache, Subtree());

        {element, Key, Namespace, Tag, Class, Attributes, Children} ->
            Class@1 = gleam@option:map(
                Class,
                fun(_capture) -> sketch:class_name(_capture, Cache) end
            ),
            Class_name = gleam@option:map(Class@1, fun gleam@pair:second/1),
            Cache@1 = begin
                _pipe = gleam@option:map(Class@1, fun gleam@pair:first/1),
                gleam@option:unwrap(_pipe, Cache)
            end,
            {Cache@2, Children@1} = unstyled_children(Cache@1, Children),
            Attributes@1 = case Class_name of
                none ->
                    Attributes;

                {some, Class_name@1} ->
                    Class_name@2 = lustre@attribute:class(Class_name@1),
                    [Class_name@2 | Attributes]
            end,
            {Cache@2,
                case lustre@element:element(Tag, Attributes@1, Children@1) of
                    {element, _, _, T, A, C, S, V} ->
                        {element, Key, Namespace, T, A, C, S, V};

                    E ->
                        E
                end}
    end.
