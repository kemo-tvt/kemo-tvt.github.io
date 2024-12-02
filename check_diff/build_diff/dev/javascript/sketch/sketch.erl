-module(sketch).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([class/1, render/1, class_name/2, cache/1, none/0, property/2, accent_color/1, align_content/1, align_items/1, align_self/1, align_tracks/1, all/1, animation/1, animation_composition/1, animation_delay/1, animation_direction/1, animation_duration/1, animation_fill_mode/1, animation_iteration_count/1, animation_name/1, animation_play_state/1, animation_timing_function/1, appearance/1, aspect_ratio/1, backdrop_filter/1, backface_visibility/1, background/1, background_attachment/1, background_blend_mode/1, background_clip/1, background_color/1, background_image/1, background_origin/1, background_position/1, background_position_x/1, background_position_y/1, background_repeat/1, background_size/1, block_size/1, block_size_/1, border/1, border_block/1, border_block_color/1, border_block_end/1, border_block_end_color/1, border_block_end_style/1, border_block_end_width/1, border_block_end_width_/1, border_block_start/1, border_block_start_color/1, border_block_start_style/1, border_block_start_width/1, border_block_start_width_/1, border_block_style/1, border_block_width/1, border_block_width_/1, border_bottom/1, border_bottom_color/1, border_bottom_left_radius/1, border_bottom_left_radius_/1, border_bottom_right_radius/1, border_bottom_right_radius_/1, border_bottom_style/1, border_bottom_width/1, border_bottom_width_/1, border_collapse/1, border_color/1, border_end_end_radius/1, border_end_start_radius/1, border_image/1, border_image_outset/1, border_image_outset_/1, border_image_repeat/1, border_image_slice/1, border_image_source/1, border_image_width/1, border_image_width_/1, border_inline/1, border_inline_color/1, border_inline_end/1, border_inline_end_color/1, border_inline_end_style/1, border_inline_end_width/1, border_inline_end_width_/1, border_inline_start/1, border_inline_start_color/1, border_inline_start_style/1, border_inline_start_width/1, border_inline_start_width_/1, border_inline_style/1, border_inline_width/1, border_inline_width_/1, border_left/1, border_left_color/1, border_left_style/1, border_left_width/1, border_left_width_/1, border_radius/1, border_radius_/1, border_right/1, border_right_color/1, border_right_style/1, border_right_width/1, border_right_width_/1, border_spacing/1, border_spacing_/1, border_start_end_radius/1, border_start_start_radius/1, border_style/1, border_top/1, border_top_color/1, border_top_left_radius/1, border_top_left_radius_/1, border_top_right_radius/1, border_top_right_radius_/1, border_top_style/1, border_top_width/1, border_top_width_/1, border_width/1, border_width_/1, bottom/1, bottom_/1, box_shadow/1, box_sizing/1, caption_side/1, caret_color/1, clear/1, clip_path/1, color/1, color_interpolation/1, color_scheme/1, column_count/1, column_fill/1, column_gap/1, column_rule/1, column_rule_color/1, column_rule_style/1, column_rule_width/1, column_span/1, column_width/1, columns/1, contain/1, contain_intrinsic_block_size/1, contain_intrinsic_block_size_/1, contain_intrinsic_height/1, contain_intrinsic_height_/1, contain_intrinsic_inline_size/1, contain_intrinsic_inline_size_/1, contain_intrinsic_size/1, contain_intrinsic_size_/1, contain_intrinsic_width/1, contain_intrinsic_width_/1, container/1, container_name/1, container_type/1, content/1, counter_increment/1, counter_reset/1, counter_set/1, cursor/1, cx/1, cx_/1, cy/1, cy_/1, direction/1, display/1, empty_cells/1, field_sizing/1, filter/1, flex/1, flex_basis/1, flex_direction/1, flex_flow/1, flex_grow/1, flex_grow_/1, flex_shrink_/1, flex_wrap/1, float/1, flex_shrink/1, font/1, font_family/1, font_feature_settings/1, font_kerning/1, font_language_override/1, font_optical_sizing/1, font_palette/1, font_size/1, font_size_/1, font_size_adjust/1, font_stretch/1, font_style/1, font_synthesis/1, font_synthesis_position/1, font_synthesis_small_caps/1, font_synthesis_style/1, font_synthesis_weight/1, font_variant/1, font_variant_alternates/1, font_variant_caps/1, font_variant_east_asian/1, font_variant_emoji/1, font_variant_ligatures/1, font_variant_numeric/1, font_variant_position/1, font_variation_settings/1, font_weight/1, forced_color_adjust/1, gap/1, gap_/1, grid_area/1, grid_auto_columns/1, grid_auto_flow/1, grid_auto_rows/1, grid_column/1, grid_column_end/1, grid_column_start/1, grid_row/1, grid_row_end/1, grid_row_start/1, grid_template/1, grid_template_areas/1, grid_template_columns/1, grid_template_rows/1, hanging_punctuation/1, height/1, height_/1, hyphenate_character/1, hyphenate_limit_chars/1, hyphens/1, image_orientation/1, image_rendering/1, inline_size/1, inset/1, inset_area/1, inset_block/1, inset_block_end/1, inset_block_start/1, inset_inline/1, inset_inline_end/1, inset_inline_start/1, isolation/1, justify_content/1, justify_items/1, justify_self/1, justify_tracks/1, left/1, left_/1, letter_spacing/1, line_break/1, line_height/1, list_style/1, list_style_image/1, list_style_position/1, list_style_type/1, margin/1, margin_/1, margin_block/1, margin_block_/1, margin_block_end/1, margin_block_end_/1, margin_block_start/1, margin_block_start_/1, margin_bottom/1, margin_bottom_/1, margin_inline/1, margin_inline_/1, margin_inline_end/1, margin_inline_end_/1, margin_inline_start/1, margin_inline_start_/1, margin_left/1, margin_left_/1, margin_right/1, margin_right_/1, margin_top/1, margin_top_/1, mask/1, mask_border/1, mask_border_mode/1, mask_border_outset/1, mask_border_repeat/1, mask_border_slice/1, mask_border_source/1, mask_border_width/1, mask_clip/1, mask_composite/1, mask_image/1, mask_mode/1, mask_origin/1, mask_position/1, mask_repeat/1, mask_size/1, mask_type/1, math_depth/1, math_style/1, max_block_size/1, max_block_size_/1, max_height/1, max_height_/1, max_inline_size/1, max_inline_size_/1, max_width/1, max_width_/1, min_block_size/1, min_block_size_/1, min_height/1, min_height_/1, min_inline_size/1, min_inline_size_/1, min_width/1, min_width_/1, mix_blend_mode/1, object_fit/1, object_position/1, offset/1, offset_anchor/1, offset_distance/1, offset_path/1, offset_position/1, offset_rotate/1, opacity/1, order/1, order_/1, orphans/1, orphans_/1, outline/1, outline_color/1, outline_offset/1, outline_style/1, outline_width/1, overflow/1, overflow_anchor/1, overflow_block/1, overflow_clip_margin/1, overflow_inline/1, overflow_wrap/1, overflow_x/1, overflow_y/1, overscroll_behavior/1, overscroll_behavior_block/1, overscroll_behavior_inline/1, overscroll_behavior_x/1, overscroll_behavior_y/1, padding/1, padding_/1, padding_block/1, padding_block_/1, padding_block_end/1, padding_block_end_/1, padding_block_start/1, padding_block_start_/1, padding_bottom/1, padding_inline/1, padding_inline_/1, padding_inline_end/1, padding_inline_end_/1, padding_inline_start/1, padding_inline_start_/1, padding_left/1, padding_right/1, padding_top/1, page/1, page_break_after/1, page_break_before/1, page_break_inside/1, paint_order/1, perspective/1, perspective_origin/1, place_content/1, place_items/1, place_self/1, pointer_events/1, position/1, print_color_adjust/1, quotes/1, r/1, resize/1, right/1, right_/1, rotate/1, row_gap/1, ruby_position/1, rx/1, rx_/1, ry/1, ry_/1, scale/1, scroll_behavior/1, scroll_margin/1, scroll_margin_/1, scroll_margin_block/1, scroll_margin_block_/1, scroll_margin_block_end/1, scroll_margin_block_end_/1, scroll_margin_block_start/1, scroll_margin_block_start_/1, scroll_margin_bottom/1, scroll_margin_bottom_/1, scroll_margin_inline/1, scroll_margin_inline_/1, scroll_margin_inline_end/1, scroll_margin_inline_end_/1, scroll_margin_inline_start/1, scroll_margin_inline_start_/1, scroll_margin_left/1, scroll_margin_left_/1, scroll_margin_right/1, scroll_margin_right_/1, scroll_margin_top/1, scroll_margin_top_/1, scroll_padding/1, scroll_padding_/1, scroll_padding_block/1, scroll_padding_block_/1, scroll_padding_block_end/1, scroll_padding_block_end_/1, scroll_padding_block_start/1, scroll_padding_block_start_/1, scroll_padding_bottom/1, scroll_padding_bottom_/1, scroll_padding_inline/1, scroll_padding_inline_/1, scroll_padding_inline_end/1, scroll_padding_inline_end_/1, scroll_padding_inline_start/1, scroll_padding_inline_start_/1, scroll_padding_left/1, scroll_padding_left_/1, scroll_padding_right/1, scroll_padding_right_/1, scroll_padding_top/1, scroll_padding_top_/1, scroll_snap_align/1, scroll_snap_stop/1, scroll_snap_type/1, scrollbar_color/1, scrollbar_gutter/1, scrollbar_width/1, shape_image_threshold/1, shape_image_threshold_/1, shape_margin/1, shape_margin_/1, shape_outside/1, tab_size/1, tab_size_/1, table_layout/1, text_align/1, text_align_last/1, text_combine_upright/1, text_decoration/1, text_decoration_color/1, text_decoration_line/1, text_decoration_skip_ink/1, text_decoration_style/1, text_decoration_thickness/1, text_emphasis/1, text_emphasis_color/1, text_emphasis_position/1, text_emphasis_style/1, text_indent/1, text_justify/1, text_orientation/1, text_overflow/1, text_rendering/1, text_shadow/1, text_transform/1, text_underline_offset/1, text_underline_offset_/1, text_underline_position/1, text_wrap/1, text_wrap_mode/1, text_wrap_style/1, top/1, top_/1, touch_action/1, transform/1, transform_/1, transform_box/1, transform_origin/1, transform_style/1, transition/1, transition_behavior/1, transition_delay/1, transition_duration/1, transition_property/1, transition_timing_function/1, translate/1, unicode_bidi/1, user_select/1, vertical_align/1, visibility/1, white_space/1, white_space_collapse/1, widows/1, width/1, width_/1, will_change/1, word_break/1, word_spacing/1, word_wrap/1, writing_mode/1, z_index/1, zoom/1, media/2, pseudo_selector/2, placeholder/1, hover/1, active/1, focus/1, focus_visible/1, focus_within/1, enabled/1, disabled/1, read_only/1, read_write/1, checked/1, blank/1, valid/1, invalid/1, required/1, optional/1, link/1, visited/1, target/1, nth_child/2, nth_last_child/2, nth_of_type/2, nth_last_of_type/2, first_child/1, last_child/1, only_child/1, first_of_type/1, last_of_type/1, only_of_type/1, important/1, compose/1]).
-export_type([cache/0, strategy/0]).

-opaque cache() :: {js_cache, sketch@internals@style:cache()} |
    {beam_cache, sketch@internals@cache@setup:cache()}.

-type strategy() :: ephemeral | persistent.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 31).
-spec class(list(sketch@internals@style:style())) -> sketch@internals@style:class().
class(Styles) ->
    sketch@internals@style:class(Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 43).
-spec render(cache()) -> binary().
render(Cache) ->
    {beam_cache, Cache@1} = case Cache of
        {beam_cache, _} -> Cache;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        value => _assert_fail,
                        module => <<"sketch"/utf8>>,
                        function => <<"render"/utf8>>,
                        line => 44})
    end,
    sketch@internals@cache@setup:render(Cache@1).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 58).
-spec class_name(sketch@internals@style:class(), cache()) -> {cache(), binary()}.
class_name(Class, Cache) ->
    {beam_cache, C} = case Cache of
        {beam_cache, _} -> Cache;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Pattern match failed, no pattern matched the value."/utf8>>,
                        value => _assert_fail,
                        module => <<"sketch"/utf8>>,
                        function => <<"class_name"/utf8>>,
                        line => 59})
    end,
    _pipe = sketch@internals@cache@setup:class_name(Class, C),
    gleam@pair:map_first(_pipe, fun(Field@0) -> {beam_cache, Field@0} end).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 86).
-spec cache(strategy()) -> {ok, cache()} | {error, sketch@error:sketch_error()}.
cache(Strategy) ->
    case Strategy of
        ephemeral ->
            {ok, {beam_cache, sketch@internals@cache@setup:ephemeral()}};

        persistent ->
            _pipe = sketch@internals@cache@setup:persistent(),
            gleam@result:map(_pipe, fun(Field@0) -> {beam_cache, Field@0} end)
    end.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2099).
-spec none() -> sketch@internals@style:style().
none() ->
    no_style.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2103).
-spec property(binary(), binary()) -> sketch@internals@style:style().
property(Field, Content) ->
    {property, Field, Content, false}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 99).
-spec accent_color(binary()) -> sketch@internals@style:style().
accent_color(Value) ->
    property(<<"accent-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 103).
-spec align_content(binary()) -> sketch@internals@style:style().
align_content(Align) ->
    property(<<"align-content"/utf8>>, Align).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 107).
-spec align_items(binary()) -> sketch@internals@style:style().
align_items(Align) ->
    property(<<"align-items"/utf8>>, Align).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 111).
-spec align_self(binary()) -> sketch@internals@style:style().
align_self(Align) ->
    property(<<"align-self"/utf8>>, Align).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 115).
-spec align_tracks(binary()) -> sketch@internals@style:style().
align_tracks(Align) ->
    property(<<"align-tracks"/utf8>>, Align).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 119).
-spec all(binary()) -> sketch@internals@style:style().
all(Value) ->
    property(<<"all"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 123).
-spec animation(binary()) -> sketch@internals@style:style().
animation(Animation) ->
    property(<<"animation"/utf8>>, Animation).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 127).
-spec animation_composition(binary()) -> sketch@internals@style:style().
animation_composition(Animation) ->
    property(<<"animation-composition"/utf8>>, Animation).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 131).
-spec animation_delay(binary()) -> sketch@internals@style:style().
animation_delay(Animation) ->
    property(<<"animation-delay"/utf8>>, Animation).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 135).
-spec animation_direction(binary()) -> sketch@internals@style:style().
animation_direction(Animation) ->
    property(<<"animation-direction"/utf8>>, Animation).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 139).
-spec animation_duration(binary()) -> sketch@internals@style:style().
animation_duration(Animation) ->
    property(<<"animation-duration"/utf8>>, Animation).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 143).
-spec animation_fill_mode(binary()) -> sketch@internals@style:style().
animation_fill_mode(Animation) ->
    property(<<"animation-fill-mode"/utf8>>, Animation).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 147).
-spec animation_iteration_count(binary()) -> sketch@internals@style:style().
animation_iteration_count(Animation) ->
    property(<<"animation-iteration-count"/utf8>>, Animation).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 151).
-spec animation_name(binary()) -> sketch@internals@style:style().
animation_name(Animation) ->
    property(<<"animation-name"/utf8>>, Animation).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 155).
-spec animation_play_state(binary()) -> sketch@internals@style:style().
animation_play_state(Animation) ->
    property(<<"animation-play-state"/utf8>>, Animation).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 159).
-spec animation_timing_function(binary()) -> sketch@internals@style:style().
animation_timing_function(Animation) ->
    property(<<"animation-timing-function"/utf8>>, Animation).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 163).
-spec appearance(binary()) -> sketch@internals@style:style().
appearance(Appearance) ->
    property(<<"appearance"/utf8>>, Appearance).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 167).
-spec aspect_ratio(binary()) -> sketch@internals@style:style().
aspect_ratio(Aspect_ratio) ->
    property(<<"aspect-ratio"/utf8>>, Aspect_ratio).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 171).
-spec backdrop_filter(binary()) -> sketch@internals@style:style().
backdrop_filter(Value) ->
    property(<<"backdrop-filter"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 175).
-spec backface_visibility(binary()) -> sketch@internals@style:style().
backface_visibility(Value) ->
    property(<<"backface-visibility"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 179).
-spec background(binary()) -> sketch@internals@style:style().
background(Background) ->
    property(<<"background"/utf8>>, Background).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 183).
-spec background_attachment(binary()) -> sketch@internals@style:style().
background_attachment(Value) ->
    property(<<"background-attachment"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 187).
-spec background_blend_mode(binary()) -> sketch@internals@style:style().
background_blend_mode(Value) ->
    property(<<"background-blend-mode"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 191).
-spec background_clip(binary()) -> sketch@internals@style:style().
background_clip(Value) ->
    property(<<"background-clip"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 195).
-spec background_color(binary()) -> sketch@internals@style:style().
background_color(Value) ->
    property(<<"background-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 199).
-spec background_image(binary()) -> sketch@internals@style:style().
background_image(Value) ->
    property(<<"background-image"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 203).
-spec background_origin(binary()) -> sketch@internals@style:style().
background_origin(Value) ->
    property(<<"background-origin"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 207).
-spec background_position(binary()) -> sketch@internals@style:style().
background_position(Value) ->
    property(<<"background-position"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 211).
-spec background_position_x(binary()) -> sketch@internals@style:style().
background_position_x(Value) ->
    property(<<"background-position-x"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 215).
-spec background_position_y(binary()) -> sketch@internals@style:style().
background_position_y(Value) ->
    property(<<"background-position-y"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 219).
-spec background_repeat(binary()) -> sketch@internals@style:style().
background_repeat(Value) ->
    property(<<"background-repeat"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 223).
-spec background_size(binary()) -> sketch@internals@style:style().
background_size(Background) ->
    property(<<"background-size"/utf8>>, Background).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 227).
-spec block_size(sketch@size:size()) -> sketch@internals@style:style().
block_size(Value) ->
    property(<<"block-size"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 231).
-spec block_size_(binary()) -> sketch@internals@style:style().
block_size_(Value) ->
    property(<<"block-size"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 235).
-spec border(binary()) -> sketch@internals@style:style().
border(Border) ->
    property(<<"border"/utf8>>, Border).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 239).
-spec border_block(binary()) -> sketch@internals@style:style().
border_block(Value) ->
    property(<<"border-block"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 243).
-spec border_block_color(binary()) -> sketch@internals@style:style().
border_block_color(Value) ->
    property(<<"border-block-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 247).
-spec border_block_end(binary()) -> sketch@internals@style:style().
border_block_end(Value) ->
    property(<<"border-block-end"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 251).
-spec border_block_end_color(binary()) -> sketch@internals@style:style().
border_block_end_color(Value) ->
    property(<<"border-block-end-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 255).
-spec border_block_end_style(binary()) -> sketch@internals@style:style().
border_block_end_style(Value) ->
    property(<<"border-block-end-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 259).
-spec border_block_end_width(sketch@size:size()) -> sketch@internals@style:style().
border_block_end_width(Value) ->
    property(<<"border-block-end-width"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 263).
-spec border_block_end_width_(binary()) -> sketch@internals@style:style().
border_block_end_width_(Value) ->
    property(<<"border-block-end-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 267).
-spec border_block_start(binary()) -> sketch@internals@style:style().
border_block_start(Value) ->
    property(<<"border-block-start"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 271).
-spec border_block_start_color(binary()) -> sketch@internals@style:style().
border_block_start_color(Value) ->
    property(<<"border-block-start-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 275).
-spec border_block_start_style(binary()) -> sketch@internals@style:style().
border_block_start_style(Value) ->
    property(<<"border-block-start-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 279).
-spec border_block_start_width(sketch@size:size()) -> sketch@internals@style:style().
border_block_start_width(Value) ->
    property(<<"border-block-start-width"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 283).
-spec border_block_start_width_(binary()) -> sketch@internals@style:style().
border_block_start_width_(Value) ->
    property(<<"border-block-start-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 287).
-spec border_block_style(binary()) -> sketch@internals@style:style().
border_block_style(Value) ->
    property(<<"border-block-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 291).
-spec border_block_width(sketch@size:size()) -> sketch@internals@style:style().
border_block_width(Value) ->
    property(<<"border-block-width"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 295).
-spec border_block_width_(binary()) -> sketch@internals@style:style().
border_block_width_(Value) ->
    property(<<"border-block-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 299).
-spec border_bottom(binary()) -> sketch@internals@style:style().
border_bottom(Value) ->
    property(<<"border-bottom"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 303).
-spec border_bottom_color(binary()) -> sketch@internals@style:style().
border_bottom_color(Value) ->
    property(<<"border-bottom-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 307).
-spec border_bottom_left_radius(sketch@size:size()) -> sketch@internals@style:style().
border_bottom_left_radius(Border_bottom_left_radius) ->
    _pipe = sketch@size:to_string(Border_bottom_left_radius),
    property(<<"border-bottom-left-radius"/utf8>>, _pipe).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 312).
-spec border_bottom_left_radius_(binary()) -> sketch@internals@style:style().
border_bottom_left_radius_(Border_bottom_left_radius) ->
    property(<<"border-bottom-left-radius"/utf8>>, Border_bottom_left_radius).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 316).
-spec border_bottom_right_radius(sketch@size:size()) -> sketch@internals@style:style().
border_bottom_right_radius(Border_bottom_right_radius) ->
    _pipe = sketch@size:to_string(Border_bottom_right_radius),
    property(<<"border-bottom-right-radius"/utf8>>, _pipe).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 321).
-spec border_bottom_right_radius_(binary()) -> sketch@internals@style:style().
border_bottom_right_radius_(Border_bottom_right_radius) ->
    property(<<"border-bottom-right-radius"/utf8>>, Border_bottom_right_radius).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 325).
-spec border_bottom_style(binary()) -> sketch@internals@style:style().
border_bottom_style(Value) ->
    property(<<"border-bottom-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 329).
-spec border_bottom_width(sketch@size:size()) -> sketch@internals@style:style().
border_bottom_width(Value) ->
    property(<<"border-bottom-width"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 333).
-spec border_bottom_width_(binary()) -> sketch@internals@style:style().
border_bottom_width_(Value) ->
    property(<<"border-bottom-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 337).
-spec border_collapse(binary()) -> sketch@internals@style:style().
border_collapse(Value) ->
    property(<<"border-collapse"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 341).
-spec border_color(binary()) -> sketch@internals@style:style().
border_color(Value) ->
    property(<<"border-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 345).
-spec border_end_end_radius(binary()) -> sketch@internals@style:style().
border_end_end_radius(Value) ->
    property(<<"border-end-end-radius"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 349).
-spec border_end_start_radius(binary()) -> sketch@internals@style:style().
border_end_start_radius(Value) ->
    property(<<"border-end-start-radius"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 353).
-spec border_image(binary()) -> sketch@internals@style:style().
border_image(Value) ->
    property(<<"border-image"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 357).
-spec border_image_outset(sketch@size:size()) -> sketch@internals@style:style().
border_image_outset(Value) ->
    property(<<"border-image-outset"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 361).
-spec border_image_outset_(binary()) -> sketch@internals@style:style().
border_image_outset_(Value) ->
    property(<<"border-image-outset"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 365).
-spec border_image_repeat(binary()) -> sketch@internals@style:style().
border_image_repeat(Value) ->
    property(<<"border-image-repeat"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 369).
-spec border_image_slice(binary()) -> sketch@internals@style:style().
border_image_slice(Value) ->
    property(<<"border-image-slice"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 373).
-spec border_image_source(binary()) -> sketch@internals@style:style().
border_image_source(Value) ->
    property(<<"border-image-source"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 377).
-spec border_image_width(sketch@size:size()) -> sketch@internals@style:style().
border_image_width(Value) ->
    property(<<"border-image-width"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 381).
-spec border_image_width_(binary()) -> sketch@internals@style:style().
border_image_width_(Value) ->
    property(<<"border-image-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 385).
-spec border_inline(binary()) -> sketch@internals@style:style().
border_inline(Value) ->
    property(<<"border-inline"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 389).
-spec border_inline_color(binary()) -> sketch@internals@style:style().
border_inline_color(Value) ->
    property(<<"border-inline-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 393).
-spec border_inline_end(binary()) -> sketch@internals@style:style().
border_inline_end(Value) ->
    property(<<"border-inline-end"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 397).
-spec border_inline_end_color(binary()) -> sketch@internals@style:style().
border_inline_end_color(Value) ->
    property(<<"border-inline-end-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 401).
-spec border_inline_end_style(binary()) -> sketch@internals@style:style().
border_inline_end_style(Value) ->
    property(<<"border-inline-end-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 405).
-spec border_inline_end_width(sketch@size:size()) -> sketch@internals@style:style().
border_inline_end_width(Value) ->
    property(<<"border-inline-end-width"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 409).
-spec border_inline_end_width_(binary()) -> sketch@internals@style:style().
border_inline_end_width_(Value) ->
    property(<<"border-inline-end-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 413).
-spec border_inline_start(binary()) -> sketch@internals@style:style().
border_inline_start(Value) ->
    property(<<"border-inline-start"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 417).
-spec border_inline_start_color(binary()) -> sketch@internals@style:style().
border_inline_start_color(Value) ->
    property(<<"border-inline-start-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 421).
-spec border_inline_start_style(binary()) -> sketch@internals@style:style().
border_inline_start_style(Value) ->
    property(<<"border-inline-start-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 425).
-spec border_inline_start_width(sketch@size:size()) -> sketch@internals@style:style().
border_inline_start_width(Value) ->
    property(<<"border-inline-start-width"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 429).
-spec border_inline_start_width_(binary()) -> sketch@internals@style:style().
border_inline_start_width_(Value) ->
    property(<<"border-inline-start-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 433).
-spec border_inline_style(binary()) -> sketch@internals@style:style().
border_inline_style(Value) ->
    property(<<"border-inline-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 437).
-spec border_inline_width(sketch@size:size()) -> sketch@internals@style:style().
border_inline_width(Value) ->
    property(<<"border-inline-width"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 441).
-spec border_inline_width_(binary()) -> sketch@internals@style:style().
border_inline_width_(Value) ->
    property(<<"border-inline-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 445).
-spec border_left(binary()) -> sketch@internals@style:style().
border_left(Value) ->
    property(<<"border-left"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 449).
-spec border_left_color(binary()) -> sketch@internals@style:style().
border_left_color(Value) ->
    property(<<"border-left-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 453).
-spec border_left_style(binary()) -> sketch@internals@style:style().
border_left_style(Value) ->
    property(<<"border-left-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 457).
-spec border_left_width(sketch@size:size()) -> sketch@internals@style:style().
border_left_width(Value) ->
    property(<<"border-left-width"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 461).
-spec border_left_width_(binary()) -> sketch@internals@style:style().
border_left_width_(Value) ->
    property(<<"border-left-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 465).
-spec border_radius(sketch@size:size()) -> sketch@internals@style:style().
border_radius(Border_radius) ->
    property(<<"border-radius"/utf8>>, sketch@size:to_string(Border_radius)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 469).
-spec border_radius_(binary()) -> sketch@internals@style:style().
border_radius_(Border_radius) ->
    property(<<"border-radius"/utf8>>, Border_radius).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 473).
-spec border_right(binary()) -> sketch@internals@style:style().
border_right(Value) ->
    property(<<"border-right"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 477).
-spec border_right_color(binary()) -> sketch@internals@style:style().
border_right_color(Value) ->
    property(<<"border-right-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 481).
-spec border_right_style(binary()) -> sketch@internals@style:style().
border_right_style(Value) ->
    property(<<"border-right-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 485).
-spec border_right_width(sketch@size:size()) -> sketch@internals@style:style().
border_right_width(Value) ->
    property(<<"border-right-width"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 489).
-spec border_right_width_(binary()) -> sketch@internals@style:style().
border_right_width_(Value) ->
    property(<<"border-right-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 493).
-spec border_spacing(sketch@size:size()) -> sketch@internals@style:style().
border_spacing(Value) ->
    property(<<"border-spacing"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 497).
-spec border_spacing_(binary()) -> sketch@internals@style:style().
border_spacing_(Value) ->
    property(<<"border-spacing"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 501).
-spec border_start_end_radius(binary()) -> sketch@internals@style:style().
border_start_end_radius(Value) ->
    property(<<"border-start-end-radius"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 505).
-spec border_start_start_radius(binary()) -> sketch@internals@style:style().
border_start_start_radius(Value) ->
    property(<<"border-start-start-radius"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 509).
-spec border_style(binary()) -> sketch@internals@style:style().
border_style(Value) ->
    property(<<"border-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 513).
-spec border_top(binary()) -> sketch@internals@style:style().
border_top(Value) ->
    property(<<"border-top"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 517).
-spec border_top_color(binary()) -> sketch@internals@style:style().
border_top_color(Value) ->
    property(<<"border-top-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 521).
-spec border_top_left_radius(sketch@size:size()) -> sketch@internals@style:style().
border_top_left_radius(Border_top_left_radius) ->
    _pipe = sketch@size:to_string(Border_top_left_radius),
    property(<<"border-top-left-radius"/utf8>>, _pipe).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 526).
-spec border_top_left_radius_(binary()) -> sketch@internals@style:style().
border_top_left_radius_(Border_top_left_radius) ->
    property(<<"border-top-left-radius"/utf8>>, Border_top_left_radius).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 530).
-spec border_top_right_radius(sketch@size:size()) -> sketch@internals@style:style().
border_top_right_radius(Border_top_right_radius) ->
    _pipe = sketch@size:to_string(Border_top_right_radius),
    property(<<"border-top-right-radius"/utf8>>, _pipe).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 535).
-spec border_top_right_radius_(binary()) -> sketch@internals@style:style().
border_top_right_radius_(Border_top_right_radius) ->
    property(<<"border-top-right-radius"/utf8>>, Border_top_right_radius).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 539).
-spec border_top_style(binary()) -> sketch@internals@style:style().
border_top_style(Value) ->
    property(<<"border-top-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 543).
-spec border_top_width(sketch@size:size()) -> sketch@internals@style:style().
border_top_width(Value) ->
    property(<<"border-top-width"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 547).
-spec border_top_width_(binary()) -> sketch@internals@style:style().
border_top_width_(Value) ->
    property(<<"border-top-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 551).
-spec border_width(sketch@size:size()) -> sketch@internals@style:style().
border_width(Value) ->
    property(<<"border-width"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 555).
-spec border_width_(binary()) -> sketch@internals@style:style().
border_width_(Value) ->
    property(<<"border-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 559).
-spec bottom(sketch@size:size()) -> sketch@internals@style:style().
bottom(Size) ->
    property(<<"bottom"/utf8>>, sketch@size:to_string(Size)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 563).
-spec bottom_(binary()) -> sketch@internals@style:style().
bottom_(Size) ->
    property(<<"bottom"/utf8>>, Size).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 567).
-spec box_shadow(binary()) -> sketch@internals@style:style().
box_shadow(Box_shadow) ->
    property(<<"box-shadow"/utf8>>, Box_shadow).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 571).
-spec box_sizing(binary()) -> sketch@internals@style:style().
box_sizing(Box_sizing) ->
    property(<<"box-sizing"/utf8>>, Box_sizing).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 575).
-spec caption_side(binary()) -> sketch@internals@style:style().
caption_side(Value) ->
    property(<<"caption-side"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 579).
-spec caret_color(binary()) -> sketch@internals@style:style().
caret_color(Value) ->
    property(<<"caret-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 583).
-spec clear(binary()) -> sketch@internals@style:style().
clear(Value) ->
    property(<<"clear"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 587).
-spec clip_path(binary()) -> sketch@internals@style:style().
clip_path(Value) ->
    property(<<"clip-path"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 591).
-spec color(binary()) -> sketch@internals@style:style().
color(Color) ->
    property(<<"color"/utf8>>, Color).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 595).
-spec color_interpolation(binary()) -> sketch@internals@style:style().
color_interpolation(Value) ->
    property(<<"color-interpolation"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 599).
-spec color_scheme(binary()) -> sketch@internals@style:style().
color_scheme(Value) ->
    property(<<"color-scheme"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 603).
-spec column_count(binary()) -> sketch@internals@style:style().
column_count(Value) ->
    property(<<"column-count"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 607).
-spec column_fill(binary()) -> sketch@internals@style:style().
column_fill(Value) ->
    property(<<"column-fill"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 611).
-spec column_gap(sketch@size:size()) -> sketch@internals@style:style().
column_gap(Column_gap) ->
    property(<<"column-gap"/utf8>>, sketch@size:to_string(Column_gap)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 615).
-spec column_rule(binary()) -> sketch@internals@style:style().
column_rule(Value) ->
    property(<<"column-rule"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 619).
-spec column_rule_color(binary()) -> sketch@internals@style:style().
column_rule_color(Value) ->
    property(<<"column-rule-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 623).
-spec column_rule_style(binary()) -> sketch@internals@style:style().
column_rule_style(Value) ->
    property(<<"column-rule-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 627).
-spec column_rule_width(binary()) -> sketch@internals@style:style().
column_rule_width(Value) ->
    property(<<"column-rule-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 631).
-spec column_span(binary()) -> sketch@internals@style:style().
column_span(Value) ->
    property(<<"column-span"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 635).
-spec column_width(binary()) -> sketch@internals@style:style().
column_width(Value) ->
    property(<<"column-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 639).
-spec columns(binary()) -> sketch@internals@style:style().
columns(Value) ->
    property(<<"columns"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 643).
-spec contain(binary()) -> sketch@internals@style:style().
contain(Value) ->
    property(<<"contain"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 647).
-spec contain_intrinsic_block_size(sketch@size:size()) -> sketch@internals@style:style().
contain_intrinsic_block_size(Value) ->
    property(
        <<"contain-intrinsic-block-size"/utf8>>,
        sketch@size:to_string(Value)
    ).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 651).
-spec contain_intrinsic_block_size_(binary()) -> sketch@internals@style:style().
contain_intrinsic_block_size_(Value) ->
    property(<<"contain-intrinsic-block-size"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 655).
-spec contain_intrinsic_height(sketch@size:size()) -> sketch@internals@style:style().
contain_intrinsic_height(Value) ->
    property(<<"contain-intrinsic-height"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 659).
-spec contain_intrinsic_height_(binary()) -> sketch@internals@style:style().
contain_intrinsic_height_(Value) ->
    property(<<"contain-intrinsic-height"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 663).
-spec contain_intrinsic_inline_size(sketch@size:size()) -> sketch@internals@style:style().
contain_intrinsic_inline_size(Value) ->
    property(
        <<"contain-intrinsic-inline-size"/utf8>>,
        sketch@size:to_string(Value)
    ).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 667).
-spec contain_intrinsic_inline_size_(binary()) -> sketch@internals@style:style().
contain_intrinsic_inline_size_(Value) ->
    property(<<"contain-intrinsic-inline-size"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 671).
-spec contain_intrinsic_size(sketch@size:size()) -> sketch@internals@style:style().
contain_intrinsic_size(Value) ->
    property(<<"contain-intrinsic-size"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 675).
-spec contain_intrinsic_size_(binary()) -> sketch@internals@style:style().
contain_intrinsic_size_(Value) ->
    property(<<"contain-intrinsic-size"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 679).
-spec contain_intrinsic_width(sketch@size:size()) -> sketch@internals@style:style().
contain_intrinsic_width(Value) ->
    property(<<"contain-intrinsic-width"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 683).
-spec contain_intrinsic_width_(binary()) -> sketch@internals@style:style().
contain_intrinsic_width_(Value) ->
    property(<<"contain-intrinsic-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 687).
-spec container(binary()) -> sketch@internals@style:style().
container(Value) ->
    property(<<"container"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 691).
-spec container_name(binary()) -> sketch@internals@style:style().
container_name(Value) ->
    property(<<"container-name"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 695).
-spec container_type(binary()) -> sketch@internals@style:style().
container_type(Value) ->
    property(<<"container-type"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 699).
-spec content(binary()) -> sketch@internals@style:style().
content(Value) ->
    property(<<"content"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 703).
-spec counter_increment(binary()) -> sketch@internals@style:style().
counter_increment(Value) ->
    property(<<"counter-increment"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 707).
-spec counter_reset(binary()) -> sketch@internals@style:style().
counter_reset(Value) ->
    property(<<"counter-reset"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 711).
-spec counter_set(binary()) -> sketch@internals@style:style().
counter_set(Value) ->
    property(<<"counter-set"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 715).
-spec cursor(binary()) -> sketch@internals@style:style().
cursor(Cursor) ->
    property(<<"cursor"/utf8>>, Cursor).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 719).
-spec cx(sketch@size:size()) -> sketch@internals@style:style().
cx(Value) ->
    property(<<"cx"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 723).
-spec cx_(binary()) -> sketch@internals@style:style().
cx_(Value) ->
    property(<<"cx"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 727).
-spec cy(sketch@size:size()) -> sketch@internals@style:style().
cy(Value) ->
    property(<<"cy"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 731).
-spec cy_(binary()) -> sketch@internals@style:style().
cy_(Value) ->
    property(<<"cy"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 735).
-spec direction(binary()) -> sketch@internals@style:style().
direction(Direction) ->
    property(<<"direction"/utf8>>, Direction).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 739).
-spec display(binary()) -> sketch@internals@style:style().
display(Display) ->
    property(<<"display"/utf8>>, Display).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 743).
-spec empty_cells(binary()) -> sketch@internals@style:style().
empty_cells(Empty_cells) ->
    property(<<"empty-cells"/utf8>>, Empty_cells).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 747).
-spec field_sizing(binary()) -> sketch@internals@style:style().
field_sizing(Field_sizing) ->
    property(<<"field-sizing"/utf8>>, Field_sizing).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 751).
-spec filter(binary()) -> sketch@internals@style:style().
filter(Filter) ->
    property(<<"filter"/utf8>>, Filter).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 755).
-spec flex(binary()) -> sketch@internals@style:style().
flex(Flex) ->
    property(<<"flex"/utf8>>, Flex).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 759).
-spec flex_basis(binary()) -> sketch@internals@style:style().
flex_basis(Flex_basis) ->
    property(<<"flex-basis"/utf8>>, Flex_basis).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 763).
-spec flex_direction(binary()) -> sketch@internals@style:style().
flex_direction(Flex_direction) ->
    property(<<"flex-direction"/utf8>>, Flex_direction).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 767).
-spec flex_flow(binary()) -> sketch@internals@style:style().
flex_flow(Flex_flow) ->
    property(<<"flex-flow"/utf8>>, Flex_flow).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 771).
-spec flex_grow(integer()) -> sketch@internals@style:style().
flex_grow(Flex_grow) ->
    property(<<"flex-grow"/utf8>>, erlang:integer_to_binary(Flex_grow)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 775).
-spec flex_grow_(binary()) -> sketch@internals@style:style().
flex_grow_(Flex_grow) ->
    property(<<"flex-grow"/utf8>>, Flex_grow).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 783).
-spec flex_shrink_(binary()) -> sketch@internals@style:style().
flex_shrink_(Flex_shrink) ->
    property(<<"flex-shrink"/utf8>>, Flex_shrink).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 787).
-spec flex_wrap(binary()) -> sketch@internals@style:style().
flex_wrap(Flex_wrap) ->
    property(<<"flex-wrap"/utf8>>, Flex_wrap).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 791).
-spec float(binary()) -> sketch@internals@style:style().
float(Float) ->
    property(<<"float"/utf8>>, Float).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 779).
-spec flex_shrink(float()) -> sketch@internals@style:style().
flex_shrink(Flex_shrink) ->
    property(<<"flex-shrink"/utf8>>, gleam_stdlib:float_to_string(Flex_shrink)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 795).
-spec font(binary()) -> sketch@internals@style:style().
font(Value) ->
    property(<<"font"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 799).
-spec font_family(binary()) -> sketch@internals@style:style().
font_family(Font_family) ->
    property(<<"font-family"/utf8>>, Font_family).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 803).
-spec font_feature_settings(binary()) -> sketch@internals@style:style().
font_feature_settings(Value) ->
    property(<<"font-feature-settings"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 807).
-spec font_kerning(binary()) -> sketch@internals@style:style().
font_kerning(Value) ->
    property(<<"font-kerning"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 811).
-spec font_language_override(binary()) -> sketch@internals@style:style().
font_language_override(Value) ->
    property(<<"font-language-override"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 815).
-spec font_optical_sizing(binary()) -> sketch@internals@style:style().
font_optical_sizing(Value) ->
    property(<<"font-optical-sizing"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 819).
-spec font_palette(binary()) -> sketch@internals@style:style().
font_palette(Value) ->
    property(<<"font-palette"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 823).
-spec font_size(sketch@size:size()) -> sketch@internals@style:style().
font_size(Font_size) ->
    property(<<"font-size"/utf8>>, sketch@size:to_string(Font_size)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 827).
-spec font_size_(binary()) -> sketch@internals@style:style().
font_size_(Font_size) ->
    property(<<"font-size"/utf8>>, Font_size).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 831).
-spec font_size_adjust(binary()) -> sketch@internals@style:style().
font_size_adjust(Value) ->
    property(<<"font-size-adjust"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 835).
-spec font_stretch(binary()) -> sketch@internals@style:style().
font_stretch(Value) ->
    property(<<"font-stretch"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 839).
-spec font_style(binary()) -> sketch@internals@style:style().
font_style(Font_style) ->
    property(<<"font-style"/utf8>>, Font_style).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 843).
-spec font_synthesis(binary()) -> sketch@internals@style:style().
font_synthesis(Value) ->
    property(<<"font-synthesis"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 847).
-spec font_synthesis_position(binary()) -> sketch@internals@style:style().
font_synthesis_position(Value) ->
    property(<<"font-synthesis-position"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 851).
-spec font_synthesis_small_caps(binary()) -> sketch@internals@style:style().
font_synthesis_small_caps(Value) ->
    property(<<"font-synthesis-small-caps"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 855).
-spec font_synthesis_style(binary()) -> sketch@internals@style:style().
font_synthesis_style(Value) ->
    property(<<"font-synthesis-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 859).
-spec font_synthesis_weight(binary()) -> sketch@internals@style:style().
font_synthesis_weight(Value) ->
    property(<<"font-synthesis-weight"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 863).
-spec font_variant(binary()) -> sketch@internals@style:style().
font_variant(Value) ->
    property(<<"font-variant"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 867).
-spec font_variant_alternates(binary()) -> sketch@internals@style:style().
font_variant_alternates(Value) ->
    property(<<"font-variant-alternates"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 871).
-spec font_variant_caps(binary()) -> sketch@internals@style:style().
font_variant_caps(Value) ->
    property(<<"font-variant-caps"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 875).
-spec font_variant_east_asian(binary()) -> sketch@internals@style:style().
font_variant_east_asian(Value) ->
    property(<<"font-variant-east-asian"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 879).
-spec font_variant_emoji(binary()) -> sketch@internals@style:style().
font_variant_emoji(Value) ->
    property(<<"font-variant-emoji"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 883).
-spec font_variant_ligatures(binary()) -> sketch@internals@style:style().
font_variant_ligatures(Value) ->
    property(<<"font-variant-ligatures"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 887).
-spec font_variant_numeric(binary()) -> sketch@internals@style:style().
font_variant_numeric(Value) ->
    property(<<"font-variant-numeric"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 891).
-spec font_variant_position(binary()) -> sketch@internals@style:style().
font_variant_position(Value) ->
    property(<<"font-variant-position"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 895).
-spec font_variation_settings(binary()) -> sketch@internals@style:style().
font_variation_settings(Value) ->
    property(<<"font-variation-settings"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 899).
-spec font_weight(binary()) -> sketch@internals@style:style().
font_weight(Font_weight) ->
    property(<<"font-weight"/utf8>>, Font_weight).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 903).
-spec forced_color_adjust(binary()) -> sketch@internals@style:style().
forced_color_adjust(Value) ->
    property(<<"forced-color-adjust"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 907).
-spec gap(sketch@size:size()) -> sketch@internals@style:style().
gap(Gap) ->
    property(<<"gap"/utf8>>, sketch@size:to_string(Gap)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 911).
-spec gap_(binary()) -> sketch@internals@style:style().
gap_(Gap) ->
    property(<<"gap"/utf8>>, Gap).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 915).
-spec grid_area(binary()) -> sketch@internals@style:style().
grid_area(Grid_area) ->
    property(<<"grid-area"/utf8>>, Grid_area).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 919).
-spec grid_auto_columns(binary()) -> sketch@internals@style:style().
grid_auto_columns(Grid_auto_columns) ->
    property(<<"grid-auto-columns"/utf8>>, Grid_auto_columns).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 923).
-spec grid_auto_flow(binary()) -> sketch@internals@style:style().
grid_auto_flow(Grid_auto_flow) ->
    property(<<"grid-auto-flow"/utf8>>, Grid_auto_flow).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 927).
-spec grid_auto_rows(binary()) -> sketch@internals@style:style().
grid_auto_rows(Grid_auto_rows) ->
    property(<<"grid-auto-rows"/utf8>>, Grid_auto_rows).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 931).
-spec grid_column(binary()) -> sketch@internals@style:style().
grid_column(Grid_column) ->
    property(<<"grid-column"/utf8>>, Grid_column).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 935).
-spec grid_column_end(binary()) -> sketch@internals@style:style().
grid_column_end(Grid_column) ->
    property(<<"grid-column-end"/utf8>>, Grid_column).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 939).
-spec grid_column_start(binary()) -> sketch@internals@style:style().
grid_column_start(Grid_column) ->
    property(<<"grid-column-start"/utf8>>, Grid_column).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 943).
-spec grid_row(binary()) -> sketch@internals@style:style().
grid_row(Grid_row) ->
    property(<<"grid-row"/utf8>>, Grid_row).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 947).
-spec grid_row_end(binary()) -> sketch@internals@style:style().
grid_row_end(Grid_row) ->
    property(<<"grid-row-end"/utf8>>, Grid_row).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 951).
-spec grid_row_start(binary()) -> sketch@internals@style:style().
grid_row_start(Grid_row) ->
    property(<<"grid-row-start"/utf8>>, Grid_row).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 955).
-spec grid_template(binary()) -> sketch@internals@style:style().
grid_template(Grid_template) ->
    property(<<"grid-template"/utf8>>, Grid_template).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 959).
-spec grid_template_areas(list(binary())) -> sketch@internals@style:style().
grid_template_areas(Grid_template_areas) ->
    property(
        <<"grid-template-areas"/utf8>>,
        begin
            _pipe = Grid_template_areas,
            _pipe@1 = gleam@list:map(
                _pipe,
                fun(Content) ->
                    <<<<"\""/utf8, Content/binary>>/binary, "\""/utf8>>
                end
            ),
            gleam@string:join(_pipe@1, <<"\n"/utf8>>)
        end
    ).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 968).
-spec grid_template_columns(binary()) -> sketch@internals@style:style().
grid_template_columns(Grid_template_columns) ->
    property(<<"grid-template-columns"/utf8>>, Grid_template_columns).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 972).
-spec grid_template_rows(binary()) -> sketch@internals@style:style().
grid_template_rows(Grid_template_rows) ->
    property(<<"grid-template-rows"/utf8>>, Grid_template_rows).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 976).
-spec hanging_punctuation(binary()) -> sketch@internals@style:style().
hanging_punctuation(Value) ->
    property(<<"hanging-punctuation"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 980).
-spec height(sketch@size:size()) -> sketch@internals@style:style().
height(Height) ->
    property(<<"height"/utf8>>, sketch@size:to_string(Height)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 984).
-spec height_(binary()) -> sketch@internals@style:style().
height_(Height) ->
    property(<<"height"/utf8>>, Height).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 988).
-spec hyphenate_character(binary()) -> sketch@internals@style:style().
hyphenate_character(Value) ->
    property(<<"hyphenate-character"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 992).
-spec hyphenate_limit_chars(binary()) -> sketch@internals@style:style().
hyphenate_limit_chars(Value) ->
    property(<<"hyphenate-limit-chars"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 996).
-spec hyphens(binary()) -> sketch@internals@style:style().
hyphens(Value) ->
    property(<<"hyphens"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1000).
-spec image_orientation(binary()) -> sketch@internals@style:style().
image_orientation(Value) ->
    property(<<"image-orientation"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1004).
-spec image_rendering(binary()) -> sketch@internals@style:style().
image_rendering(Value) ->
    property(<<"image-rendering"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1008).
-spec inline_size(binary()) -> sketch@internals@style:style().
inline_size(Value) ->
    property(<<"inline-size"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1012).
-spec inset(binary()) -> sketch@internals@style:style().
inset(Value) ->
    property(<<"inset"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1016).
-spec inset_area(binary()) -> sketch@internals@style:style().
inset_area(Value) ->
    property(<<"inset-area"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1020).
-spec inset_block(binary()) -> sketch@internals@style:style().
inset_block(Value) ->
    property(<<"inset-block"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1024).
-spec inset_block_end(binary()) -> sketch@internals@style:style().
inset_block_end(Value) ->
    property(<<"inset-block-end"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1028).
-spec inset_block_start(binary()) -> sketch@internals@style:style().
inset_block_start(Value) ->
    property(<<"inset-block-start"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1032).
-spec inset_inline(binary()) -> sketch@internals@style:style().
inset_inline(Value) ->
    property(<<"inset-inline"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1036).
-spec inset_inline_end(binary()) -> sketch@internals@style:style().
inset_inline_end(Value) ->
    property(<<"inset-inline-end"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1040).
-spec inset_inline_start(binary()) -> sketch@internals@style:style().
inset_inline_start(Value) ->
    property(<<"inset-inline-start"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1044).
-spec isolation(binary()) -> sketch@internals@style:style().
isolation(Value) ->
    property(<<"isolation"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1048).
-spec justify_content(binary()) -> sketch@internals@style:style().
justify_content(Justify) ->
    property(<<"justify-content"/utf8>>, Justify).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1052).
-spec justify_items(binary()) -> sketch@internals@style:style().
justify_items(Justify) ->
    property(<<"justify-items"/utf8>>, Justify).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1056).
-spec justify_self(binary()) -> sketch@internals@style:style().
justify_self(Justify) ->
    property(<<"justify-self"/utf8>>, Justify).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1060).
-spec justify_tracks(binary()) -> sketch@internals@style:style().
justify_tracks(Justify) ->
    property(<<"justify-tracks"/utf8>>, Justify).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1064).
-spec left(sketch@size:size()) -> sketch@internals@style:style().
left(Size) ->
    property(<<"left"/utf8>>, sketch@size:to_string(Size)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1068).
-spec left_(binary()) -> sketch@internals@style:style().
left_(Size) ->
    property(<<"left"/utf8>>, Size).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1072).
-spec letter_spacing(binary()) -> sketch@internals@style:style().
letter_spacing(Letter_spacing) ->
    property(<<"letter-spacing"/utf8>>, Letter_spacing).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1076).
-spec line_break(binary()) -> sketch@internals@style:style().
line_break(Line_break) ->
    property(<<"line-break"/utf8>>, Line_break).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1080).
-spec line_height(binary()) -> sketch@internals@style:style().
line_height(Line_height) ->
    property(<<"line-height"/utf8>>, Line_height).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1084).
-spec list_style(binary()) -> sketch@internals@style:style().
list_style(List_style) ->
    property(<<"list-style"/utf8>>, List_style).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1088).
-spec list_style_image(binary()) -> sketch@internals@style:style().
list_style_image(List_style_image) ->
    property(<<"list-style-image"/utf8>>, List_style_image).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1092).
-spec list_style_position(binary()) -> sketch@internals@style:style().
list_style_position(List_style_position) ->
    property(<<"list-style-position"/utf8>>, List_style_position).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1096).
-spec list_style_type(binary()) -> sketch@internals@style:style().
list_style_type(List_style_type) ->
    property(<<"list-style-type"/utf8>>, List_style_type).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1100).
-spec margin(sketch@size:size()) -> sketch@internals@style:style().
margin(Margin) ->
    property(<<"margin"/utf8>>, sketch@size:to_string(Margin)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1104).
-spec margin_(binary()) -> sketch@internals@style:style().
margin_(Margin) ->
    property(<<"margin"/utf8>>, Margin).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1108).
-spec margin_block(sketch@size:size()) -> sketch@internals@style:style().
margin_block(Margin) ->
    property(<<"margin-block"/utf8>>, sketch@size:to_string(Margin)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1112).
-spec margin_block_(binary()) -> sketch@internals@style:style().
margin_block_(Margin) ->
    property(<<"margin-block"/utf8>>, Margin).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1116).
-spec margin_block_end(sketch@size:size()) -> sketch@internals@style:style().
margin_block_end(Margin) ->
    property(<<"margin-block-end"/utf8>>, sketch@size:to_string(Margin)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1120).
-spec margin_block_end_(binary()) -> sketch@internals@style:style().
margin_block_end_(Margin) ->
    property(<<"margin-block-end"/utf8>>, Margin).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1124).
-spec margin_block_start(sketch@size:size()) -> sketch@internals@style:style().
margin_block_start(Margin) ->
    property(<<"margin-block-start"/utf8>>, sketch@size:to_string(Margin)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1128).
-spec margin_block_start_(binary()) -> sketch@internals@style:style().
margin_block_start_(Margin) ->
    property(<<"margin-block-start"/utf8>>, Margin).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1132).
-spec margin_bottom(sketch@size:size()) -> sketch@internals@style:style().
margin_bottom(Margin) ->
    property(<<"margin-bottom"/utf8>>, sketch@size:to_string(Margin)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1136).
-spec margin_bottom_(binary()) -> sketch@internals@style:style().
margin_bottom_(Margin) ->
    property(<<"margin-bottom"/utf8>>, Margin).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1140).
-spec margin_inline(sketch@size:size()) -> sketch@internals@style:style().
margin_inline(Margin) ->
    property(<<"margin-inline"/utf8>>, sketch@size:to_string(Margin)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1144).
-spec margin_inline_(binary()) -> sketch@internals@style:style().
margin_inline_(Margin) ->
    property(<<"margin-inline"/utf8>>, Margin).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1148).
-spec margin_inline_end(sketch@size:size()) -> sketch@internals@style:style().
margin_inline_end(Margin) ->
    property(<<"margin-inline-end"/utf8>>, sketch@size:to_string(Margin)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1152).
-spec margin_inline_end_(binary()) -> sketch@internals@style:style().
margin_inline_end_(Margin) ->
    property(<<"margin-inline-end"/utf8>>, Margin).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1156).
-spec margin_inline_start(sketch@size:size()) -> sketch@internals@style:style().
margin_inline_start(Margin) ->
    property(<<"margin-inline-start"/utf8>>, sketch@size:to_string(Margin)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1160).
-spec margin_inline_start_(binary()) -> sketch@internals@style:style().
margin_inline_start_(Margin) ->
    property(<<"margin-inline-start"/utf8>>, Margin).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1164).
-spec margin_left(sketch@size:size()) -> sketch@internals@style:style().
margin_left(Margin) ->
    property(<<"margin-left"/utf8>>, sketch@size:to_string(Margin)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1168).
-spec margin_left_(binary()) -> sketch@internals@style:style().
margin_left_(Margin) ->
    property(<<"margin-left"/utf8>>, Margin).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1172).
-spec margin_right(sketch@size:size()) -> sketch@internals@style:style().
margin_right(Margin) ->
    property(<<"margin-right"/utf8>>, sketch@size:to_string(Margin)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1176).
-spec margin_right_(binary()) -> sketch@internals@style:style().
margin_right_(Margin) ->
    property(<<"margin-right"/utf8>>, Margin).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1180).
-spec margin_top(sketch@size:size()) -> sketch@internals@style:style().
margin_top(Margin) ->
    property(<<"margin-top"/utf8>>, sketch@size:to_string(Margin)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1184).
-spec margin_top_(binary()) -> sketch@internals@style:style().
margin_top_(Margin) ->
    property(<<"margin-top"/utf8>>, Margin).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1188).
-spec mask(binary()) -> sketch@internals@style:style().
mask(Value) ->
    property(<<"mask"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1192).
-spec mask_border(binary()) -> sketch@internals@style:style().
mask_border(Value) ->
    property(<<"mask-border"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1196).
-spec mask_border_mode(binary()) -> sketch@internals@style:style().
mask_border_mode(Value) ->
    property(<<"mask-border-mode"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1200).
-spec mask_border_outset(binary()) -> sketch@internals@style:style().
mask_border_outset(Value) ->
    property(<<"mask-border-outset"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1204).
-spec mask_border_repeat(binary()) -> sketch@internals@style:style().
mask_border_repeat(Value) ->
    property(<<"mask-border-repeat"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1208).
-spec mask_border_slice(binary()) -> sketch@internals@style:style().
mask_border_slice(Value) ->
    property(<<"mask-border-slice"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1212).
-spec mask_border_source(binary()) -> sketch@internals@style:style().
mask_border_source(Value) ->
    property(<<"mask-border-source"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1216).
-spec mask_border_width(binary()) -> sketch@internals@style:style().
mask_border_width(Value) ->
    property(<<"mask-border-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1220).
-spec mask_clip(binary()) -> sketch@internals@style:style().
mask_clip(Value) ->
    property(<<"mask-clip"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1224).
-spec mask_composite(binary()) -> sketch@internals@style:style().
mask_composite(Value) ->
    property(<<"mask-composite"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1228).
-spec mask_image(binary()) -> sketch@internals@style:style().
mask_image(Value) ->
    property(<<"mask-image"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1232).
-spec mask_mode(binary()) -> sketch@internals@style:style().
mask_mode(Value) ->
    property(<<"mask-mode"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1236).
-spec mask_origin(binary()) -> sketch@internals@style:style().
mask_origin(Value) ->
    property(<<"mask-origin"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1240).
-spec mask_position(binary()) -> sketch@internals@style:style().
mask_position(Value) ->
    property(<<"mask-position"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1244).
-spec mask_repeat(binary()) -> sketch@internals@style:style().
mask_repeat(Value) ->
    property(<<"mask-repeat"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1248).
-spec mask_size(binary()) -> sketch@internals@style:style().
mask_size(Value) ->
    property(<<"mask-size"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1252).
-spec mask_type(binary()) -> sketch@internals@style:style().
mask_type(Value) ->
    property(<<"mask-type"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1256).
-spec math_depth(binary()) -> sketch@internals@style:style().
math_depth(Value) ->
    property(<<"math-depth"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1260).
-spec math_style(binary()) -> sketch@internals@style:style().
math_style(Value) ->
    property(<<"math-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1264).
-spec max_block_size(sketch@size:size()) -> sketch@internals@style:style().
max_block_size(Value) ->
    property(<<"max-block-size"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1268).
-spec max_block_size_(binary()) -> sketch@internals@style:style().
max_block_size_(Value) ->
    property(<<"max-block-size"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1272).
-spec max_height(sketch@size:size()) -> sketch@internals@style:style().
max_height(Height) ->
    property(<<"max-height"/utf8>>, sketch@size:to_string(Height)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1276).
-spec max_height_(binary()) -> sketch@internals@style:style().
max_height_(Height) ->
    property(<<"max-height"/utf8>>, Height).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1280).
-spec max_inline_size(sketch@size:size()) -> sketch@internals@style:style().
max_inline_size(Value) ->
    property(<<"max-inline-size"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1284).
-spec max_inline_size_(binary()) -> sketch@internals@style:style().
max_inline_size_(Value) ->
    property(<<"max-inline-size"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1288).
-spec max_width(sketch@size:size()) -> sketch@internals@style:style().
max_width(Width) ->
    property(<<"max-width"/utf8>>, sketch@size:to_string(Width)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1292).
-spec max_width_(binary()) -> sketch@internals@style:style().
max_width_(Width) ->
    property(<<"max-width"/utf8>>, Width).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1296).
-spec min_block_size(sketch@size:size()) -> sketch@internals@style:style().
min_block_size(Value) ->
    property(<<"min-block-size"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1300).
-spec min_block_size_(binary()) -> sketch@internals@style:style().
min_block_size_(Value) ->
    property(<<"min-block-size"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1304).
-spec min_height(sketch@size:size()) -> sketch@internals@style:style().
min_height(Height) ->
    property(<<"min-height"/utf8>>, sketch@size:to_string(Height)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1308).
-spec min_height_(binary()) -> sketch@internals@style:style().
min_height_(Height) ->
    property(<<"min-height"/utf8>>, Height).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1312).
-spec min_inline_size(sketch@size:size()) -> sketch@internals@style:style().
min_inline_size(Value) ->
    property(<<"min-inline-size"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1316).
-spec min_inline_size_(binary()) -> sketch@internals@style:style().
min_inline_size_(Value) ->
    property(<<"min-inline-size"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1320).
-spec min_width(sketch@size:size()) -> sketch@internals@style:style().
min_width(Width) ->
    property(<<"min-width"/utf8>>, sketch@size:to_string(Width)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1324).
-spec min_width_(binary()) -> sketch@internals@style:style().
min_width_(Width) ->
    property(<<"min-width"/utf8>>, Width).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1328).
-spec mix_blend_mode(binary()) -> sketch@internals@style:style().
mix_blend_mode(Value) ->
    property(<<"mix-blend-mode"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1332).
-spec object_fit(binary()) -> sketch@internals@style:style().
object_fit(Object_fit) ->
    property(<<"object-fit"/utf8>>, Object_fit).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1336).
-spec object_position(binary()) -> sketch@internals@style:style().
object_position(Object_position) ->
    property(<<"object-position"/utf8>>, Object_position).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1340).
-spec offset(binary()) -> sketch@internals@style:style().
offset(Offset) ->
    property(<<"offset"/utf8>>, Offset).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1344).
-spec offset_anchor(binary()) -> sketch@internals@style:style().
offset_anchor(Offset_anchor) ->
    property(<<"offset-anchor"/utf8>>, Offset_anchor).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1348).
-spec offset_distance(binary()) -> sketch@internals@style:style().
offset_distance(Offset_distance) ->
    property(<<"offset-distance"/utf8>>, Offset_distance).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1352).
-spec offset_path(binary()) -> sketch@internals@style:style().
offset_path(Offset_path) ->
    property(<<"offset-path"/utf8>>, Offset_path).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1356).
-spec offset_position(binary()) -> sketch@internals@style:style().
offset_position(Offset_position) ->
    property(<<"offset-position"/utf8>>, Offset_position).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1360).
-spec offset_rotate(binary()) -> sketch@internals@style:style().
offset_rotate(Offset_rotate) ->
    property(<<"offset-rotate"/utf8>>, Offset_rotate).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1364).
-spec opacity(float()) -> sketch@internals@style:style().
opacity(Opacity) ->
    property(<<"opacity"/utf8>>, gleam_stdlib:float_to_string(Opacity)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1368).
-spec order(integer()) -> sketch@internals@style:style().
order(Value) ->
    property(<<"order"/utf8>>, erlang:integer_to_binary(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1372).
-spec order_(binary()) -> sketch@internals@style:style().
order_(Value) ->
    property(<<"order"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1376).
-spec orphans(integer()) -> sketch@internals@style:style().
orphans(Value) ->
    property(<<"orphans"/utf8>>, erlang:integer_to_binary(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1380).
-spec orphans_(binary()) -> sketch@internals@style:style().
orphans_(Value) ->
    property(<<"orphans"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1384).
-spec outline(binary()) -> sketch@internals@style:style().
outline(Outline) ->
    property(<<"outline"/utf8>>, Outline).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1388).
-spec outline_color(binary()) -> sketch@internals@style:style().
outline_color(Outline_color) ->
    property(<<"outline-color"/utf8>>, Outline_color).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1392).
-spec outline_offset(binary()) -> sketch@internals@style:style().
outline_offset(Outline_offset) ->
    property(<<"outline-offset"/utf8>>, Outline_offset).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1396).
-spec outline_style(binary()) -> sketch@internals@style:style().
outline_style(Outline_style) ->
    property(<<"outline-style"/utf8>>, Outline_style).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1400).
-spec outline_width(binary()) -> sketch@internals@style:style().
outline_width(Outline_width) ->
    property(<<"outline-width"/utf8>>, Outline_width).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1404).
-spec overflow(binary()) -> sketch@internals@style:style().
overflow(Overflow) ->
    property(<<"overflow"/utf8>>, Overflow).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1408).
-spec overflow_anchor(binary()) -> sketch@internals@style:style().
overflow_anchor(Overflow_anchor) ->
    property(<<"overflow-anchor"/utf8>>, Overflow_anchor).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1412).
-spec overflow_block(binary()) -> sketch@internals@style:style().
overflow_block(Overflow_block) ->
    property(<<"overflow-block"/utf8>>, Overflow_block).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1416).
-spec overflow_clip_margin(binary()) -> sketch@internals@style:style().
overflow_clip_margin(Overflow_clip_margin) ->
    property(<<"overflow-clip-margin"/utf8>>, Overflow_clip_margin).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1420).
-spec overflow_inline(binary()) -> sketch@internals@style:style().
overflow_inline(Overflow_inline) ->
    property(<<"overflow-inline"/utf8>>, Overflow_inline).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1424).
-spec overflow_wrap(binary()) -> sketch@internals@style:style().
overflow_wrap(Overflow_wrap) ->
    property(<<"overflow-wrap"/utf8>>, Overflow_wrap).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1428).
-spec overflow_x(binary()) -> sketch@internals@style:style().
overflow_x(Overflow_x) ->
    property(<<"overflow-x"/utf8>>, Overflow_x).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1432).
-spec overflow_y(binary()) -> sketch@internals@style:style().
overflow_y(Overflow_y) ->
    property(<<"overflow-y"/utf8>>, Overflow_y).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1436).
-spec overscroll_behavior(binary()) -> sketch@internals@style:style().
overscroll_behavior(Value) ->
    property(<<"overscroll-behavior"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1440).
-spec overscroll_behavior_block(binary()) -> sketch@internals@style:style().
overscroll_behavior_block(Value) ->
    property(<<"overscroll-behavior-block"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1444).
-spec overscroll_behavior_inline(binary()) -> sketch@internals@style:style().
overscroll_behavior_inline(Value) ->
    property(<<"overscroll-behavior-inline"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1448).
-spec overscroll_behavior_x(binary()) -> sketch@internals@style:style().
overscroll_behavior_x(Value) ->
    property(<<"overscroll-behavior-x"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1452).
-spec overscroll_behavior_y(binary()) -> sketch@internals@style:style().
overscroll_behavior_y(Value) ->
    property(<<"overscroll-behavior-y"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1456).
-spec padding(sketch@size:size()) -> sketch@internals@style:style().
padding(Padding) ->
    property(<<"padding"/utf8>>, sketch@size:to_string(Padding)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1460).
-spec padding_(binary()) -> sketch@internals@style:style().
padding_(Padding) ->
    property(<<"padding"/utf8>>, Padding).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1464).
-spec padding_block(sketch@size:size()) -> sketch@internals@style:style().
padding_block(Padding) ->
    property(<<"padding-block"/utf8>>, sketch@size:to_string(Padding)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1468).
-spec padding_block_(binary()) -> sketch@internals@style:style().
padding_block_(Padding) ->
    property(<<"padding-block"/utf8>>, Padding).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1472).
-spec padding_block_end(sketch@size:size()) -> sketch@internals@style:style().
padding_block_end(Padding) ->
    property(<<"padding-block-end"/utf8>>, sketch@size:to_string(Padding)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1476).
-spec padding_block_end_(binary()) -> sketch@internals@style:style().
padding_block_end_(Padding) ->
    property(<<"padding-block-end"/utf8>>, Padding).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1480).
-spec padding_block_start(sketch@size:size()) -> sketch@internals@style:style().
padding_block_start(Padding) ->
    property(<<"padding-block-start"/utf8>>, sketch@size:to_string(Padding)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1484).
-spec padding_block_start_(binary()) -> sketch@internals@style:style().
padding_block_start_(Padding) ->
    property(<<"padding-block-start"/utf8>>, Padding).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1488).
-spec padding_bottom(sketch@size:size()) -> sketch@internals@style:style().
padding_bottom(Padding) ->
    property(<<"padding-bottom"/utf8>>, sketch@size:to_string(Padding)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1492).
-spec padding_inline(sketch@size:size()) -> sketch@internals@style:style().
padding_inline(Padding) ->
    property(<<"padding-inline"/utf8>>, sketch@size:to_string(Padding)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1496).
-spec padding_inline_(binary()) -> sketch@internals@style:style().
padding_inline_(Padding) ->
    property(<<"padding-inline"/utf8>>, Padding).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1500).
-spec padding_inline_end(sketch@size:size()) -> sketch@internals@style:style().
padding_inline_end(Padding) ->
    property(<<"padding-inline-end"/utf8>>, sketch@size:to_string(Padding)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1504).
-spec padding_inline_end_(binary()) -> sketch@internals@style:style().
padding_inline_end_(Padding) ->
    property(<<"padding-inline-end"/utf8>>, Padding).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1508).
-spec padding_inline_start(sketch@size:size()) -> sketch@internals@style:style().
padding_inline_start(Padding) ->
    property(<<"padding-inline-start"/utf8>>, sketch@size:to_string(Padding)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1512).
-spec padding_inline_start_(binary()) -> sketch@internals@style:style().
padding_inline_start_(Padding) ->
    property(<<"padding-inline-start"/utf8>>, Padding).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1516).
-spec padding_left(sketch@size:size()) -> sketch@internals@style:style().
padding_left(Padding) ->
    property(<<"padding-left"/utf8>>, sketch@size:to_string(Padding)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1520).
-spec padding_right(sketch@size:size()) -> sketch@internals@style:style().
padding_right(Padding) ->
    property(<<"padding-right"/utf8>>, sketch@size:to_string(Padding)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1524).
-spec padding_top(sketch@size:size()) -> sketch@internals@style:style().
padding_top(Padding) ->
    property(<<"padding-top"/utf8>>, sketch@size:to_string(Padding)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1528).
-spec page(binary()) -> sketch@internals@style:style().
page(Value) ->
    property(<<"page"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1532).
-spec page_break_after(binary()) -> sketch@internals@style:style().
page_break_after(Value) ->
    property(<<"page-break-after"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1536).
-spec page_break_before(binary()) -> sketch@internals@style:style().
page_break_before(Value) ->
    property(<<"page-break-before"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1540).
-spec page_break_inside(binary()) -> sketch@internals@style:style().
page_break_inside(Value) ->
    property(<<"page-break-inside"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1544).
-spec paint_order(binary()) -> sketch@internals@style:style().
paint_order(Value) ->
    property(<<"paint-order"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1548).
-spec perspective(binary()) -> sketch@internals@style:style().
perspective(Value) ->
    property(<<"perspective"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1552).
-spec perspective_origin(binary()) -> sketch@internals@style:style().
perspective_origin(Value) ->
    property(<<"perspective-origin"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1556).
-spec place_content(binary()) -> sketch@internals@style:style().
place_content(Place) ->
    property(<<"place-content"/utf8>>, Place).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1560).
-spec place_items(binary()) -> sketch@internals@style:style().
place_items(Place) ->
    property(<<"place-items"/utf8>>, Place).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1564).
-spec place_self(binary()) -> sketch@internals@style:style().
place_self(Place) ->
    property(<<"place-self"/utf8>>, Place).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1568).
-spec pointer_events(binary()) -> sketch@internals@style:style().
pointer_events(Pointer_events) ->
    property(<<"pointer-events"/utf8>>, Pointer_events).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1572).
-spec position(binary()) -> sketch@internals@style:style().
position(Position) ->
    property(<<"position"/utf8>>, Position).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1576).
-spec print_color_adjust(binary()) -> sketch@internals@style:style().
print_color_adjust(Print) ->
    property(<<"print-color-adjust"/utf8>>, Print).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1580).
-spec quotes(binary()) -> sketch@internals@style:style().
quotes(Quotes) ->
    property(<<"quotes"/utf8>>, Quotes).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1584).
-spec r(binary()) -> sketch@internals@style:style().
r(R) ->
    property(<<"r"/utf8>>, R).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1588).
-spec resize(binary()) -> sketch@internals@style:style().
resize(Value) ->
    property(<<"resize"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1592).
-spec right(sketch@size:size()) -> sketch@internals@style:style().
right(Size) ->
    property(<<"right"/utf8>>, sketch@size:to_string(Size)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1596).
-spec right_(binary()) -> sketch@internals@style:style().
right_(Size) ->
    property(<<"right"/utf8>>, Size).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1600).
-spec rotate(binary()) -> sketch@internals@style:style().
rotate(Value) ->
    property(<<"rotate"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1604).
-spec row_gap(sketch@size:size()) -> sketch@internals@style:style().
row_gap(Row_gap) ->
    property(<<"row-gap"/utf8>>, sketch@size:to_string(Row_gap)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1608).
-spec ruby_position(binary()) -> sketch@internals@style:style().
ruby_position(Value) ->
    property(<<"ruby-position"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1612).
-spec rx(sketch@size:size()) -> sketch@internals@style:style().
rx(Value) ->
    property(<<"rx"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1616).
-spec rx_(binary()) -> sketch@internals@style:style().
rx_(Value) ->
    property(<<"rx"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1620).
-spec ry(sketch@size:size()) -> sketch@internals@style:style().
ry(Value) ->
    property(<<"ry"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1624).
-spec ry_(binary()) -> sketch@internals@style:style().
ry_(Value) ->
    property(<<"ry"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1628).
-spec scale(binary()) -> sketch@internals@style:style().
scale(Value) ->
    property(<<"scale"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1632).
-spec scroll_behavior(binary()) -> sketch@internals@style:style().
scroll_behavior(Value) ->
    property(<<"scroll-behavior"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1636).
-spec scroll_margin(sketch@size:size()) -> sketch@internals@style:style().
scroll_margin(Value) ->
    property(<<"scroll-margin"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1640).
-spec scroll_margin_(binary()) -> sketch@internals@style:style().
scroll_margin_(Value) ->
    property(<<"scroll-margin"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1644).
-spec scroll_margin_block(sketch@size:size()) -> sketch@internals@style:style().
scroll_margin_block(Value) ->
    property(<<"scroll-margin-block"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1648).
-spec scroll_margin_block_(binary()) -> sketch@internals@style:style().
scroll_margin_block_(Value) ->
    property(<<"scroll-margin-block"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1652).
-spec scroll_margin_block_end(sketch@size:size()) -> sketch@internals@style:style().
scroll_margin_block_end(Value) ->
    property(<<"scroll-margin-block-end"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1656).
-spec scroll_margin_block_end_(binary()) -> sketch@internals@style:style().
scroll_margin_block_end_(Value) ->
    property(<<"scroll-margin-block-end"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1660).
-spec scroll_margin_block_start(sketch@size:size()) -> sketch@internals@style:style().
scroll_margin_block_start(Value) ->
    property(<<"scroll-margin-block-start"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1664).
-spec scroll_margin_block_start_(binary()) -> sketch@internals@style:style().
scroll_margin_block_start_(Value) ->
    property(<<"scroll-margin-block-start"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1668).
-spec scroll_margin_bottom(sketch@size:size()) -> sketch@internals@style:style().
scroll_margin_bottom(Value) ->
    property(<<"scroll-margin-bottom"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1672).
-spec scroll_margin_bottom_(binary()) -> sketch@internals@style:style().
scroll_margin_bottom_(Value) ->
    property(<<"scroll-margin-bottom"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1676).
-spec scroll_margin_inline(sketch@size:size()) -> sketch@internals@style:style().
scroll_margin_inline(Value) ->
    property(<<"scroll-margin-inline"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1680).
-spec scroll_margin_inline_(binary()) -> sketch@internals@style:style().
scroll_margin_inline_(Value) ->
    property(<<"scroll-margin-inline"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1684).
-spec scroll_margin_inline_end(sketch@size:size()) -> sketch@internals@style:style().
scroll_margin_inline_end(Value) ->
    property(<<"scroll-margin-inline-end"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1688).
-spec scroll_margin_inline_end_(binary()) -> sketch@internals@style:style().
scroll_margin_inline_end_(Value) ->
    property(<<"scroll-margin-inline-end"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1692).
-spec scroll_margin_inline_start(sketch@size:size()) -> sketch@internals@style:style().
scroll_margin_inline_start(Value) ->
    property(
        <<"scroll-margin-inline-start"/utf8>>,
        sketch@size:to_string(Value)
    ).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1696).
-spec scroll_margin_inline_start_(binary()) -> sketch@internals@style:style().
scroll_margin_inline_start_(Value) ->
    property(<<"scroll-margin-inline-start"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1700).
-spec scroll_margin_left(sketch@size:size()) -> sketch@internals@style:style().
scroll_margin_left(Value) ->
    property(<<"scroll-margin-left"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1704).
-spec scroll_margin_left_(binary()) -> sketch@internals@style:style().
scroll_margin_left_(Value) ->
    property(<<"scroll-margin-left"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1708).
-spec scroll_margin_right(sketch@size:size()) -> sketch@internals@style:style().
scroll_margin_right(Value) ->
    property(<<"scroll-margin-right"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1712).
-spec scroll_margin_right_(binary()) -> sketch@internals@style:style().
scroll_margin_right_(Value) ->
    property(<<"scroll-margin-right"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1716).
-spec scroll_margin_top(sketch@size:size()) -> sketch@internals@style:style().
scroll_margin_top(Value) ->
    property(<<"scroll-margin-top"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1720).
-spec scroll_margin_top_(binary()) -> sketch@internals@style:style().
scroll_margin_top_(Value) ->
    property(<<"scroll-margin-top"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1724).
-spec scroll_padding(sketch@size:size()) -> sketch@internals@style:style().
scroll_padding(Value) ->
    property(<<"scroll-padding"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1728).
-spec scroll_padding_(binary()) -> sketch@internals@style:style().
scroll_padding_(Value) ->
    property(<<"scroll-padding"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1732).
-spec scroll_padding_block(sketch@size:size()) -> sketch@internals@style:style().
scroll_padding_block(Value) ->
    property(<<"scroll-padding-block"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1736).
-spec scroll_padding_block_(binary()) -> sketch@internals@style:style().
scroll_padding_block_(Value) ->
    property(<<"scroll-padding-block"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1740).
-spec scroll_padding_block_end(sketch@size:size()) -> sketch@internals@style:style().
scroll_padding_block_end(Value) ->
    property(<<"scroll-padding-block-end"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1744).
-spec scroll_padding_block_end_(binary()) -> sketch@internals@style:style().
scroll_padding_block_end_(Value) ->
    property(<<"scroll-padding-block-end"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1748).
-spec scroll_padding_block_start(sketch@size:size()) -> sketch@internals@style:style().
scroll_padding_block_start(Value) ->
    property(
        <<"scroll-padding-block-start"/utf8>>,
        sketch@size:to_string(Value)
    ).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1752).
-spec scroll_padding_block_start_(binary()) -> sketch@internals@style:style().
scroll_padding_block_start_(Value) ->
    property(<<"scroll-padding-block-start"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1756).
-spec scroll_padding_bottom(sketch@size:size()) -> sketch@internals@style:style().
scroll_padding_bottom(Value) ->
    property(<<"scroll-padding-bottom"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1760).
-spec scroll_padding_bottom_(binary()) -> sketch@internals@style:style().
scroll_padding_bottom_(Value) ->
    property(<<"scroll-padding-bottom"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1764).
-spec scroll_padding_inline(sketch@size:size()) -> sketch@internals@style:style().
scroll_padding_inline(Value) ->
    property(<<"scroll-padding-inline"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1768).
-spec scroll_padding_inline_(binary()) -> sketch@internals@style:style().
scroll_padding_inline_(Value) ->
    property(<<"scroll-padding-inline"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1772).
-spec scroll_padding_inline_end(sketch@size:size()) -> sketch@internals@style:style().
scroll_padding_inline_end(Value) ->
    property(<<"scroll-padding-inline-end"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1776).
-spec scroll_padding_inline_end_(binary()) -> sketch@internals@style:style().
scroll_padding_inline_end_(Value) ->
    property(<<"scroll-padding-inline-end"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1780).
-spec scroll_padding_inline_start(sketch@size:size()) -> sketch@internals@style:style().
scroll_padding_inline_start(Value) ->
    property(
        <<"scroll-padding-inline-start"/utf8>>,
        sketch@size:to_string(Value)
    ).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1784).
-spec scroll_padding_inline_start_(binary()) -> sketch@internals@style:style().
scroll_padding_inline_start_(Value) ->
    property(<<"scroll-padding-inline-start"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1788).
-spec scroll_padding_left(sketch@size:size()) -> sketch@internals@style:style().
scroll_padding_left(Value) ->
    property(<<"scroll-padding-left"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1792).
-spec scroll_padding_left_(binary()) -> sketch@internals@style:style().
scroll_padding_left_(Value) ->
    property(<<"scroll-padding-left"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1796).
-spec scroll_padding_right(sketch@size:size()) -> sketch@internals@style:style().
scroll_padding_right(Value) ->
    property(<<"scroll-padding-right"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1800).
-spec scroll_padding_right_(binary()) -> sketch@internals@style:style().
scroll_padding_right_(Value) ->
    property(<<"scroll-padding-right"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1804).
-spec scroll_padding_top(sketch@size:size()) -> sketch@internals@style:style().
scroll_padding_top(Value) ->
    property(<<"scroll-padding-top"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1808).
-spec scroll_padding_top_(binary()) -> sketch@internals@style:style().
scroll_padding_top_(Value) ->
    property(<<"scroll-padding-top"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1812).
-spec scroll_snap_align(binary()) -> sketch@internals@style:style().
scroll_snap_align(Value) ->
    property(<<"scroll-snap-align"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1816).
-spec scroll_snap_stop(binary()) -> sketch@internals@style:style().
scroll_snap_stop(Value) ->
    property(<<"scroll-snap-stop"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1820).
-spec scroll_snap_type(binary()) -> sketch@internals@style:style().
scroll_snap_type(Value) ->
    property(<<"scroll-snap-type"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1824).
-spec scrollbar_color(binary()) -> sketch@internals@style:style().
scrollbar_color(Value) ->
    property(<<"scrollbar-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1828).
-spec scrollbar_gutter(binary()) -> sketch@internals@style:style().
scrollbar_gutter(Value) ->
    property(<<"scrollbar-gutter"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1832).
-spec scrollbar_width(binary()) -> sketch@internals@style:style().
scrollbar_width(Value) ->
    property(<<"scrollbar-width"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1836).
-spec shape_image_threshold(float()) -> sketch@internals@style:style().
shape_image_threshold(Value) ->
    property(
        <<"shape-image-threshold"/utf8>>,
        gleam_stdlib:float_to_string(Value)
    ).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1840).
-spec shape_image_threshold_(binary()) -> sketch@internals@style:style().
shape_image_threshold_(Value) ->
    property(<<"shape-image-threshold"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1844).
-spec shape_margin(sketch@size:size()) -> sketch@internals@style:style().
shape_margin(Value) ->
    property(<<"shape-margin"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1848).
-spec shape_margin_(binary()) -> sketch@internals@style:style().
shape_margin_(Value) ->
    property(<<"shape-margin"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1852).
-spec shape_outside(binary()) -> sketch@internals@style:style().
shape_outside(Value) ->
    property(<<"shape-outside"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1856).
-spec tab_size(sketch@size:size()) -> sketch@internals@style:style().
tab_size(Size) ->
    property(<<"tab-size"/utf8>>, sketch@size:to_string(Size)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1860).
-spec tab_size_(binary()) -> sketch@internals@style:style().
tab_size_(Size) ->
    property(<<"tab-size"/utf8>>, Size).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1864).
-spec table_layout(binary()) -> sketch@internals@style:style().
table_layout(Layout) ->
    property(<<"table-layout"/utf8>>, Layout).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1868).
-spec text_align(binary()) -> sketch@internals@style:style().
text_align(Text_align) ->
    property(<<"text-align"/utf8>>, Text_align).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1872).
-spec text_align_last(binary()) -> sketch@internals@style:style().
text_align_last(Value) ->
    property(<<"text-align-last"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1876).
-spec text_combine_upright(binary()) -> sketch@internals@style:style().
text_combine_upright(Value) ->
    property(<<"text-combine-upright"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1880).
-spec text_decoration(binary()) -> sketch@internals@style:style().
text_decoration(Text_decoration) ->
    property(<<"text-decoration"/utf8>>, Text_decoration).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1884).
-spec text_decoration_color(binary()) -> sketch@internals@style:style().
text_decoration_color(Value) ->
    property(<<"text-decoration-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1888).
-spec text_decoration_line(binary()) -> sketch@internals@style:style().
text_decoration_line(Value) ->
    property(<<"text-decoration-line"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1892).
-spec text_decoration_skip_ink(binary()) -> sketch@internals@style:style().
text_decoration_skip_ink(Value) ->
    property(<<"text-decoration-skip-ink"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1896).
-spec text_decoration_style(binary()) -> sketch@internals@style:style().
text_decoration_style(Value) ->
    property(<<"text-decoration-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1900).
-spec text_decoration_thickness(binary()) -> sketch@internals@style:style().
text_decoration_thickness(Value) ->
    property(<<"text-decoration-thickness"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1904).
-spec text_emphasis(binary()) -> sketch@internals@style:style().
text_emphasis(Value) ->
    property(<<"text-emphasis"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1908).
-spec text_emphasis_color(binary()) -> sketch@internals@style:style().
text_emphasis_color(Value) ->
    property(<<"text-emphasis-color"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1912).
-spec text_emphasis_position(binary()) -> sketch@internals@style:style().
text_emphasis_position(Value) ->
    property(<<"text-emphasis-position"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1916).
-spec text_emphasis_style(binary()) -> sketch@internals@style:style().
text_emphasis_style(Value) ->
    property(<<"text-emphasis-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1920).
-spec text_indent(binary()) -> sketch@internals@style:style().
text_indent(Value) ->
    property(<<"text-indent"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1924).
-spec text_justify(binary()) -> sketch@internals@style:style().
text_justify(Text_justify) ->
    property(<<"text-justify"/utf8>>, Text_justify).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1928).
-spec text_orientation(binary()) -> sketch@internals@style:style().
text_orientation(Value) ->
    property(<<"text-orientation"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1932).
-spec text_overflow(binary()) -> sketch@internals@style:style().
text_overflow(Text_overflow) ->
    property(<<"text-overflow"/utf8>>, Text_overflow).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1936).
-spec text_rendering(binary()) -> sketch@internals@style:style().
text_rendering(Value) ->
    property(<<"text-rendering"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1940).
-spec text_shadow(binary()) -> sketch@internals@style:style().
text_shadow(Value) ->
    property(<<"text-shadow"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1944).
-spec text_transform(binary()) -> sketch@internals@style:style().
text_transform(Text_transform) ->
    property(<<"text-transform"/utf8>>, Text_transform).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1948).
-spec text_underline_offset(sketch@size:size()) -> sketch@internals@style:style().
text_underline_offset(Value) ->
    property(<<"text-underline-offset"/utf8>>, sketch@size:to_string(Value)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1952).
-spec text_underline_offset_(binary()) -> sketch@internals@style:style().
text_underline_offset_(Value) ->
    property(<<"text-underline-offset"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1956).
-spec text_underline_position(binary()) -> sketch@internals@style:style().
text_underline_position(Value) ->
    property(<<"text-underline-position"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1960).
-spec text_wrap(binary()) -> sketch@internals@style:style().
text_wrap(Value) ->
    property(<<"text-wrap"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1964).
-spec text_wrap_mode(binary()) -> sketch@internals@style:style().
text_wrap_mode(Value) ->
    property(<<"text-wrap-mode"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1968).
-spec text_wrap_style(binary()) -> sketch@internals@style:style().
text_wrap_style(Value) ->
    property(<<"text-wrap-style"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1972).
-spec top(sketch@size:size()) -> sketch@internals@style:style().
top(Size) ->
    property(<<"top"/utf8>>, sketch@size:to_string(Size)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1976).
-spec top_(binary()) -> sketch@internals@style:style().
top_(Size) ->
    property(<<"top"/utf8>>, Size).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1980).
-spec touch_action(binary()) -> sketch@internals@style:style().
touch_action(Value) ->
    property(<<"touch-action"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1985).
-spec transform(binary()) -> sketch@internals@style:style().
transform(Transform) ->
    property(<<"transform"/utf8>>, Transform).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1990).
-spec transform_(list(sketch@transform:transform())) -> sketch@internals@style:style().
transform_(Transform_args) ->
    Transform_string = sketch@transform:to_string(Transform_args),
    property(<<"transform"/utf8>>, Transform_string).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1995).
-spec transform_box(binary()) -> sketch@internals@style:style().
transform_box(Transform_box) ->
    property(<<"transform-box"/utf8>>, Transform_box).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 1999).
-spec transform_origin(binary()) -> sketch@internals@style:style().
transform_origin(Transform_origin) ->
    property(<<"transform-origin"/utf8>>, Transform_origin).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2003).
-spec transform_style(binary()) -> sketch@internals@style:style().
transform_style(Transform_style) ->
    property(<<"transform-style"/utf8>>, Transform_style).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2007).
-spec transition(binary()) -> sketch@internals@style:style().
transition(Transition) ->
    property(<<"transition"/utf8>>, Transition).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2011).
-spec transition_behavior(binary()) -> sketch@internals@style:style().
transition_behavior(Value) ->
    property(<<"transition-behavior"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2015).
-spec transition_delay(binary()) -> sketch@internals@style:style().
transition_delay(Value) ->
    property(<<"transition-delay"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2019).
-spec transition_duration(binary()) -> sketch@internals@style:style().
transition_duration(Value) ->
    property(<<"transition-duration"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2023).
-spec transition_property(binary()) -> sketch@internals@style:style().
transition_property(Value) ->
    property(<<"transition-property"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2027).
-spec transition_timing_function(binary()) -> sketch@internals@style:style().
transition_timing_function(Value) ->
    property(<<"transition-timing-function"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2031).
-spec translate(binary()) -> sketch@internals@style:style().
translate(Translate) ->
    property(<<"translate"/utf8>>, Translate).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2035).
-spec unicode_bidi(binary()) -> sketch@internals@style:style().
unicode_bidi(Value) ->
    property(<<"unicode-bidi"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2039).
-spec user_select(binary()) -> sketch@internals@style:style().
user_select(User_select) ->
    property(<<"user-select"/utf8>>, User_select).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2043).
-spec vertical_align(binary()) -> sketch@internals@style:style().
vertical_align(Value) ->
    property(<<"vertical-align"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2047).
-spec visibility(binary()) -> sketch@internals@style:style().
visibility(Visibility) ->
    property(<<"visibility"/utf8>>, Visibility).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2051).
-spec white_space(binary()) -> sketch@internals@style:style().
white_space(White_space) ->
    property(<<"white-space"/utf8>>, White_space).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2055).
-spec white_space_collapse(binary()) -> sketch@internals@style:style().
white_space_collapse(White_space_collapse) ->
    property(<<"white-space-collapse"/utf8>>, White_space_collapse).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2059).
-spec widows(binary()) -> sketch@internals@style:style().
widows(Value) ->
    property(<<"widows"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2063).
-spec width(sketch@size:size()) -> sketch@internals@style:style().
width(Width) ->
    property(<<"width"/utf8>>, sketch@size:to_string(Width)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2067).
-spec width_(binary()) -> sketch@internals@style:style().
width_(Width) ->
    property(<<"width"/utf8>>, Width).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2071).
-spec will_change(binary()) -> sketch@internals@style:style().
will_change(Value) ->
    property(<<"will-change"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2075).
-spec word_break(binary()) -> sketch@internals@style:style().
word_break(Word_break) ->
    property(<<"word-break"/utf8>>, Word_break).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2079).
-spec word_spacing(binary()) -> sketch@internals@style:style().
word_spacing(Word_spacing) ->
    property(<<"word-spacing"/utf8>>, Word_spacing).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2083).
-spec word_wrap(binary()) -> sketch@internals@style:style().
word_wrap(Word_wrap) ->
    property(<<"word-wrap"/utf8>>, Word_wrap).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2087).
-spec writing_mode(binary()) -> sketch@internals@style:style().
writing_mode(Value) ->
    property(<<"writing-mode"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2091).
-spec z_index(integer()) -> sketch@internals@style:style().
z_index(Z_index) ->
    property(<<"z-index"/utf8>>, erlang:integer_to_binary(Z_index)).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2095).
-spec zoom(binary()) -> sketch@internals@style:style().
zoom(Value) ->
    property(<<"zoom"/utf8>>, Value).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2110).
-spec media(sketch@media:'query'(), list(sketch@internals@style:style())) -> sketch@internals@style:style().
media(Query, Styles) ->
    Media_selector = sketch@media:to_string(Query),
    {media, Media_selector, Styles}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2233).
-spec pseudo_selector(binary(), list(sketch@internals@style:style())) -> sketch@internals@style:style().
pseudo_selector(Value, Styles) ->
    {pseudo_selector, Value, Styles}.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2117).
-spec placeholder(list(sketch@internals@style:style())) -> sketch@internals@style:style().
placeholder(Styles) ->
    pseudo_selector(<<"::placeholder"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2121).
-spec hover(list(sketch@internals@style:style())) -> sketch@internals@style:style().
hover(Styles) ->
    pseudo_selector(<<":hover"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2125).
-spec active(list(sketch@internals@style:style())) -> sketch@internals@style:style().
active(Styles) ->
    pseudo_selector(<<":active"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2129).
-spec focus(list(sketch@internals@style:style())) -> sketch@internals@style:style().
focus(Styles) ->
    pseudo_selector(<<":focus"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2133).
-spec focus_visible(list(sketch@internals@style:style())) -> sketch@internals@style:style().
focus_visible(Styles) ->
    pseudo_selector(<<":focus-visible"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2137).
-spec focus_within(list(sketch@internals@style:style())) -> sketch@internals@style:style().
focus_within(Styles) ->
    pseudo_selector(<<":focus-within"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2141).
-spec enabled(list(sketch@internals@style:style())) -> sketch@internals@style:style().
enabled(Styles) ->
    pseudo_selector(<<":enabled"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2145).
-spec disabled(list(sketch@internals@style:style())) -> sketch@internals@style:style().
disabled(Styles) ->
    pseudo_selector(<<":disabled"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2149).
-spec read_only(list(sketch@internals@style:style())) -> sketch@internals@style:style().
read_only(Styles) ->
    pseudo_selector(<<":read-only"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2153).
-spec read_write(list(sketch@internals@style:style())) -> sketch@internals@style:style().
read_write(Styles) ->
    pseudo_selector(<<":read-write"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2157).
-spec checked(list(sketch@internals@style:style())) -> sketch@internals@style:style().
checked(Styles) ->
    pseudo_selector(<<":checked"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2161).
-spec blank(list(sketch@internals@style:style())) -> sketch@internals@style:style().
blank(Styles) ->
    pseudo_selector(<<":blank"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2165).
-spec valid(list(sketch@internals@style:style())) -> sketch@internals@style:style().
valid(Styles) ->
    pseudo_selector(<<":valid"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2169).
-spec invalid(list(sketch@internals@style:style())) -> sketch@internals@style:style().
invalid(Styles) ->
    pseudo_selector(<<":invalid"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2173).
-spec required(list(sketch@internals@style:style())) -> sketch@internals@style:style().
required(Styles) ->
    pseudo_selector(<<":required"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2177).
-spec optional(list(sketch@internals@style:style())) -> sketch@internals@style:style().
optional(Styles) ->
    pseudo_selector(<<":optional"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2181).
-spec link(list(sketch@internals@style:style())) -> sketch@internals@style:style().
link(Styles) ->
    pseudo_selector(<<":link"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2185).
-spec visited(list(sketch@internals@style:style())) -> sketch@internals@style:style().
visited(Styles) ->
    pseudo_selector(<<":visited"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2189).
-spec target(list(sketch@internals@style:style())) -> sketch@internals@style:style().
target(Styles) ->
    pseudo_selector(<<":target"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2193).
-spec nth_child(binary(), list(sketch@internals@style:style())) -> sketch@internals@style:style().
nth_child(Selector, Styles) ->
    pseudo_selector(
        gleam@string:append(<<":nth-child"/utf8>>, Selector),
        Styles
    ).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2197).
-spec nth_last_child(binary(), list(sketch@internals@style:style())) -> sketch@internals@style:style().
nth_last_child(Selector, Styles) ->
    pseudo_selector(
        gleam@string:append(<<":nth-last-child"/utf8>>, Selector),
        Styles
    ).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2201).
-spec nth_of_type(binary(), list(sketch@internals@style:style())) -> sketch@internals@style:style().
nth_of_type(Selector, Styles) ->
    pseudo_selector(
        gleam@string:append(<<":nth-of-type"/utf8>>, Selector),
        Styles
    ).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2205).
-spec nth_last_of_type(binary(), list(sketch@internals@style:style())) -> sketch@internals@style:style().
nth_last_of_type(Selector, Styles) ->
    pseudo_selector(
        gleam@string:append(<<":nth-last-of-type"/utf8>>, Selector),
        Styles
    ).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2209).
-spec first_child(list(sketch@internals@style:style())) -> sketch@internals@style:style().
first_child(Styles) ->
    pseudo_selector(<<":first-child"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2213).
-spec last_child(list(sketch@internals@style:style())) -> sketch@internals@style:style().
last_child(Styles) ->
    pseudo_selector(<<":last-child"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2217).
-spec only_child(list(sketch@internals@style:style())) -> sketch@internals@style:style().
only_child(Styles) ->
    pseudo_selector(<<":only-child"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2221).
-spec first_of_type(list(sketch@internals@style:style())) -> sketch@internals@style:style().
first_of_type(Styles) ->
    pseudo_selector(<<":first-of-type"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2225).
-spec last_of_type(list(sketch@internals@style:style())) -> sketch@internals@style:style().
last_of_type(Styles) ->
    pseudo_selector(<<":last-of-type"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2229).
-spec only_of_type(list(sketch@internals@style:style())) -> sketch@internals@style:style().
only_of_type(Styles) ->
    pseudo_selector(<<":only-of-type"/utf8>>, Styles).

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2240).
-spec important(sketch@internals@style:style()) -> sketch@internals@style:style().
important(Style) ->
    case Style of
        {property, Key, Value, _} ->
            {property, Key, Value, true};

        Any ->
            Any
    end.

-file("/Users/doctor/Workspace/sketch/sketch/src/sketch.gleam", 2249).
-spec compose(sketch@internals@style:class()) -> sketch@internals@style:style().
compose(Class) ->
    {class_name, Class}.
