-module(sketch@internals@style).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([persistent/0, ephemeral/0, compute_classes/2, class/1, render/1, compute_properties/3, compute_class/2, class_name/2]).
-export_type([class/0, cache/0, style/0, computed_properties/0, media_property/0, pseudo_property/0, computed_class/0]).

-type class() :: {class, binary(), list(style())}.

-type cache() :: {ephemeral_cache,
        gleam@dict:dict(binary(), {sketch@internals@class:content(),
            computed_properties()})} |
    {persistent_cache,
        gleam@dict:dict(binary(), {sketch@internals@class:content(),
            computed_properties()}),
        integer()}.

-type style() :: {class_name, class()} |
    {media, binary(), list(style())} |
    {pseudo_selector, binary(), list(style())} |
    {property, binary(), binary(), boolean()} |
    no_style.

-type computed_properties() :: {computed_properties,
        list(binary()),
        list(media_property()),
        list(pseudo_property()),
        integer()}.

-type media_property() :: {media_property,
        binary(),
        list(binary()),
        list(pseudo_property())}.

-type pseudo_property() :: {pseudo_property, binary(), list(binary())}.

-type computed_class() :: {computed_class,
        binary(),
        list(binary()),
        list(binary()),
        binary()}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 40).
-spec persistent() -> cache().
persistent() ->
    {persistent_cache, maps:new(), 0}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 44).
-spec ephemeral() -> cache().
ephemeral() ->
    {ephemeral_cache, maps:new()}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 79).
-spec compute_property(integer(), binary(), binary(), boolean()) -> binary().
compute_property(Indent, Key, Value, Important) ->
    Base_indent = sketch@internals@string:indent(Indent),
    Important_ = case Important of
        true ->
            <<" !important"/utf8>>;

        false ->
            <<""/utf8>>
    end,
    <<<<<<<<<<Base_indent/binary, Key/binary>>/binary, ": "/utf8>>/binary,
                Value/binary>>/binary,
            Important_/binary>>/binary,
        ";"/utf8>>.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 88).
-spec init_computed_properties(integer()) -> computed_properties().
init_computed_properties(Indent) ->
    {computed_properties, [], [], [], Indent}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 92).
-spec merge_computed_properties(computed_properties(), computed_properties()) -> computed_properties().
merge_computed_properties(Target, Argument) ->
    {computed_properties,
        lists:append(erlang:element(2, Argument), erlang:element(2, Target)),
        lists:append(erlang:element(3, Argument), erlang:element(3, Target)),
        lists:append(erlang:element(4, Argument), erlang:element(4, Target)),
        erlang:element(5, Target)}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 132).
-spec handle_property(computed_properties(), style()) -> computed_properties().
handle_property(Props, Style) ->
    {property, Key, Value, Important} = case Style of
        {property, _, _, _} -> Style;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        value => _assert_fail,
                        module => <<"sketch/internals/style"/utf8>>,
                        function => <<"handle_property"/utf8>>,
                        line => 133})
    end,
    Css_property = compute_property(
        erlang:element(5, Props),
        Key,
        Value,
        Important
    ),
    Properties = [Css_property | erlang:element(2, Props)],
    erlang:setelement(2, Props, Properties).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 178).
-spec wrap_pseudo_selectors(binary(), integer(), list(pseudo_property())) -> list(binary()).
wrap_pseudo_selectors(Id, Indent, Pseudo_selectors) ->
    gleam@list:map(
        Pseudo_selectors,
        fun(P) ->
            sketch@internals@string:wrap_class(
                Id,
                erlang:element(3, P),
                Indent,
                {some, erlang:element(2, P)}
            )
        end
    ).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 189).
-spec compute_classes(binary(), computed_properties()) -> computed_class().
compute_classes(Class_name, Computed_properties) ->
    {computed_properties, Properties, Medias, Pseudo_selectors, _} = Computed_properties,
    Class_def = sketch@internals@string:wrap_class(
        Class_name,
        Properties,
        0,
        none
    ),
    Medias_def = (gleam@list:map(
        Medias,
        fun(_use0) ->
            {media_property, Query, Properties@1, Pseudo_selectors@1} = _use0,
            Selectors_def = wrap_pseudo_selectors(
                Class_name,
                2,
                Pseudo_selectors@1
            ),
            _pipe = [<<Query/binary, " {"/utf8>>,
                sketch@internals@string:wrap_class(
                    Class_name,
                    Properties@1,
                    2,
                    none
                )],
            _pipe@1 = gleam@list:prepend([Selectors_def, [<<"}"/utf8>>]], _pipe),
            _pipe@2 = gleam@list:flatten(_pipe@1),
            gleam@string:join(_pipe@2, <<"\n"/utf8>>)
        end
    )),
    Selectors_def@1 = wrap_pseudo_selectors(Class_name, 0, Pseudo_selectors),
    Name = Class_name,
    {computed_class, Class_def, Medias_def, Selectors_def@1, Name}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 209).
-spec class(list(style())) -> class().
class(Styles) ->
    String_representation = gleam@string:inspect(Styles),
    {class, String_representation, Styles}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 34).
-spec render_cache_dict(
    gleam@dict:dict(binary(), {sketch@internals@class:content(),
        computed_properties()})
) -> binary().
render_cache_dict(Cache) ->
    _pipe = maps:values(Cache),
    _pipe@1 = gleam@list:flat_map(
        _pipe,
        fun(C) -> sketch@internals@class:definitions(erlang:element(1, C)) end
    ),
    gleam@string:join(_pipe@1, <<"\n\n"/utf8>>).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 27).
-spec render(cache()) -> binary().
render(Cache) ->
    case Cache of
        {ephemeral_cache, Cache@1} ->
            render_cache_dict(Cache@1);

        {persistent_cache, Cache@2, _} ->
            render_cache_dict(Cache@2)
    end.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 139).
-spec handle_media(cache(), computed_properties(), style()) -> {cache(),
    computed_properties()}.
handle_media(Cache, Props, Style) ->
    {media, Query, Styles} = case Style of
        {media, _, _} -> Style;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        value => _assert_fail,
                        module => <<"sketch/internals/style"/utf8>>,
                        function => <<"handle_media"/utf8>>,
                        line => 140})
    end,
    {Cache@1, Computed_props} = compute_properties(
        Cache,
        Styles,
        erlang:element(5, Props) + 2
    ),
    _pipe = {media_property,
        Query,
        erlang:element(2, Computed_props),
        erlang:element(4, Computed_props)},
    _pipe@1 = gleam@list:prepend(erlang:element(3, Props), _pipe),
    _pipe@2 = (fun(M) -> erlang:setelement(3, Props, M) end)(_pipe@1),
    gleam@pair:new(Cache@1, _pipe@2).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 109).
-spec compute_properties(cache(), list(style()), integer()) -> {cache(),
    computed_properties()}.
compute_properties(Cache, Properties, Indent) ->
    Init = init_computed_properties(Indent),
    gleam@list:fold(
        lists:reverse(Properties),
        {Cache, Init},
        fun(_use0, Prop) ->
            {Cache@1, Acc} = _use0,
            case Prop of
                no_style ->
                    {Cache@1, Acc};

                {property, _, _, _} ->
                    {Cache@1, handle_property(Acc, Prop)};

                {media, _, _} ->
                    handle_media(Cache@1, Acc, Prop);

                {pseudo_selector, _, _} ->
                    handle_pseudo_selector(Cache@1, Acc, Prop);

                {class_name, Class} ->
                    case gleam_stdlib:map_get(
                        erlang:element(2, Cache@1),
                        erlang:element(2, Class)
                    ) of
                        {ok, {_, Props}} ->
                            {Cache@1, merge_computed_properties(Acc, Props)};

                        {error, _} ->
                            _pipe = compute_properties(
                                Cache@1,
                                erlang:element(3, Class),
                                Indent
                            ),
                            gleam@pair:map_second(
                                _pipe,
                                fun(_capture) ->
                                    merge_computed_properties(Acc, _capture)
                                end
                            )
                    end
            end
        end
    ).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 153).
-spec handle_pseudo_selector(cache(), computed_properties(), style()) -> {cache(),
    computed_properties()}.
handle_pseudo_selector(Cache, Props, Style) ->
    {pseudo_selector, Pseudo_selector, Styles} = case Style of
        {pseudo_selector, _, _} -> Style;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        value => _assert_fail,
                        module => <<"sketch/internals/style"/utf8>>,
                        function => <<"handle_pseudo_selector"/utf8>>,
                        line => 154})
    end,
    {Cache@1, Computed_props} = compute_properties(
        Cache,
        Styles,
        erlang:element(5, Props) + 2
    ),
    _pipe = {pseudo_property,
        Pseudo_selector,
        erlang:element(2, Computed_props)},
    _pipe@1 = gleam@list:prepend(erlang:element(4, Computed_props), _pipe),
    _pipe@2 = lists:append(_pipe@1, erlang:element(4, Props)),
    _pipe@3 = (fun(P) -> erlang:setelement(4, Props, P) end)(_pipe@2),
    gleam@pair:new(Cache@1, _pipe@3).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 223).
-spec compute_class(cache(), class()) -> {cache(),
    sketch@internals@class:content()}.
compute_class(Cache, Class) ->
    {class, String_representation, Content} = Class,
    {Cache@1, Properties} = compute_properties(Cache, Content, 2),
    Class_id = case Cache@1 of
        {ephemeral_cache, _} ->
            erlang:phash2(String_representation);

        {persistent_cache, _, Cid} ->
            Cid
    end,
    Class_name = <<"css-"/utf8, (erlang:integer_to_binary(Class_id))/binary>>,
    _pipe = compute_classes(Class_name, Properties),
    _pipe@1 = (fun(C) ->
        sketch@internals@class:create(
            erlang:element(5, C),
            Class_id,
            none,
            {definitions,
                erlang:element(3, C),
                erlang:element(4, C),
                erlang:element(2, C)}
        )
    end)(_pipe),
    (fun(Class@1) ->
        C@1 = gleam@dict:insert(
            erlang:element(2, Cache@1),
            String_representation,
            {Class@1, Properties}
        ),
        _pipe@2 = case Cache@1 of
            {ephemeral_cache, _} ->
                {ephemeral_cache, C@1};

            {persistent_cache, _, _} ->
                {persistent_cache, C@1, Class_id + 1}
        end,
        gleam@pair:new(_pipe@2, Class@1)
    end)(_pipe@1).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch/internals/style.gleam", 214).
-spec class_name(class(), cache()) -> {cache(), binary()}.
class_name(Class, Cache) ->
    {class, S, C} = Class,
    gleam@bool:guard(
        gleam@list:is_empty(C),
        {Cache, <<""/utf8>>},
        fun() -> case gleam_stdlib:map_get(erlang:element(2, Cache), S) of
                {ok, {Content, _}} ->
                    {Cache, sketch@internals@class:class_name(Content)};

                {error, _} ->
                    _pipe = compute_class(Cache, Class),
                    gleam@pair:map_second(
                        _pipe,
                        fun sketch@internals@class:class_name/1
                    )
            end end
    ).
