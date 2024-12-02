import * as $float from "../gleam_stdlib/gleam/float.mjs";
import * as $int from "../gleam_stdlib/gleam/int.mjs";
import * as $list from "../gleam_stdlib/gleam/list.mjs";
import * as $pair from "../gleam_stdlib/gleam/pair.mjs";
import * as $result from "../gleam_stdlib/gleam/result.mjs";
import * as $string from "../gleam_stdlib/gleam/string.mjs";
import { Ok, CustomType as $CustomType, makeError } from "./gleam.mjs";
import * as $cache from "./sketch/internals/cache/setup.mjs";
import * as $style from "./sketch/internals/style.mjs";
import * as $media from "./sketch/media.mjs";
import * as $size from "./sketch/size.mjs";
import * as $transform from "./sketch/transform.mjs";

class JsCache extends $CustomType {
  constructor(cache) {
    super();
    this.cache = cache;
  }
}

class BeamCache extends $CustomType {
  constructor(cache) {
    super();
    this.cache = cache;
  }
}

export class Ephemeral extends $CustomType {}

export class Persistent extends $CustomType {}

export function class$(styles) {
  return $style.class$(styles);
}

export function render(cache) {
  if (!(cache instanceof JsCache)) {
    throw makeError(
      "let_assert",
      "sketch",
      38,
      "render",
      "Pattern match failed, no pattern matched the value.",
      { value: cache }
    )
  }
  let cache$1 = cache.cache;
  return $style.render(cache$1);
}

export function class_name(class$, cache) {
  if (!(cache instanceof JsCache)) {
    throw makeError(
      "let_assert",
      "sketch",
      53,
      "class_name",
      "Pattern match failed, no pattern matched the value.",
      { value: cache }
    )
  }
  let c = cache.cache;
  let _pipe = $style.class_name(class$, c);
  return $pair.map_first(_pipe, (var0) => { return new JsCache(var0); });
}

export function cache(strategy) {
  return new Ok(
    (() => {
      if (strategy instanceof Ephemeral) {
        return new JsCache($style.ephemeral());
      } else {
        return new JsCache($style.persistent());
      }
    })(),
  );
}

export function none() {
  return new $style.NoStyle();
}

export function property(field, content) {
  return new $style.Property(field, content, false);
}

export function accent_color(value) {
  return property("accent-color", value);
}

export function align_content(align) {
  return property("align-content", align);
}

export function align_items(align) {
  return property("align-items", align);
}

export function align_self(align) {
  return property("align-self", align);
}

export function align_tracks(align) {
  return property("align-tracks", align);
}

export function all(value) {
  return property("all", value);
}

export function animation(animation) {
  return property("animation", animation);
}

export function animation_composition(animation) {
  return property("animation-composition", animation);
}

export function animation_delay(animation) {
  return property("animation-delay", animation);
}

export function animation_direction(animation) {
  return property("animation-direction", animation);
}

export function animation_duration(animation) {
  return property("animation-duration", animation);
}

export function animation_fill_mode(animation) {
  return property("animation-fill-mode", animation);
}

export function animation_iteration_count(animation) {
  return property("animation-iteration-count", animation);
}

export function animation_name(animation) {
  return property("animation-name", animation);
}

export function animation_play_state(animation) {
  return property("animation-play-state", animation);
}

export function animation_timing_function(animation) {
  return property("animation-timing-function", animation);
}

export function appearance(appearance) {
  return property("appearance", appearance);
}

export function aspect_ratio(aspect_ratio) {
  return property("aspect-ratio", aspect_ratio);
}

export function backdrop_filter(value) {
  return property("backdrop-filter", value);
}

export function backface_visibility(value) {
  return property("backface-visibility", value);
}

export function background(background) {
  return property("background", background);
}

export function background_attachment(value) {
  return property("background-attachment", value);
}

export function background_blend_mode(value) {
  return property("background-blend-mode", value);
}

export function background_clip(value) {
  return property("background-clip", value);
}

export function background_color(value) {
  return property("background-color", value);
}

export function background_image(value) {
  return property("background-image", value);
}

export function background_origin(value) {
  return property("background-origin", value);
}

export function background_position(value) {
  return property("background-position", value);
}

export function background_position_x(value) {
  return property("background-position-x", value);
}

export function background_position_y(value) {
  return property("background-position-y", value);
}

export function background_repeat(value) {
  return property("background-repeat", value);
}

export function background_size(background) {
  return property("background-size", background);
}

export function block_size(value) {
  return property("block-size", $size.to_string(value));
}

export function block_size_(value) {
  return property("block-size", value);
}

export function border(border) {
  return property("border", border);
}

export function border_block(value) {
  return property("border-block", value);
}

export function border_block_color(value) {
  return property("border-block-color", value);
}

export function border_block_end(value) {
  return property("border-block-end", value);
}

export function border_block_end_color(value) {
  return property("border-block-end-color", value);
}

export function border_block_end_style(value) {
  return property("border-block-end-style", value);
}

export function border_block_end_width(value) {
  return property("border-block-end-width", $size.to_string(value));
}

export function border_block_end_width_(value) {
  return property("border-block-end-width", value);
}

export function border_block_start(value) {
  return property("border-block-start", value);
}

export function border_block_start_color(value) {
  return property("border-block-start-color", value);
}

export function border_block_start_style(value) {
  return property("border-block-start-style", value);
}

export function border_block_start_width(value) {
  return property("border-block-start-width", $size.to_string(value));
}

export function border_block_start_width_(value) {
  return property("border-block-start-width", value);
}

export function border_block_style(value) {
  return property("border-block-style", value);
}

export function border_block_width(value) {
  return property("border-block-width", $size.to_string(value));
}

export function border_block_width_(value) {
  return property("border-block-width", value);
}

export function border_bottom(value) {
  return property("border-bottom", value);
}

export function border_bottom_color(value) {
  return property("border-bottom-color", value);
}

export function border_bottom_left_radius(border_bottom_left_radius) {
  let _pipe = $size.to_string(border_bottom_left_radius);
  return ((_capture) => {
    return property("border-bottom-left-radius", _capture);
  })(_pipe);
}

export function border_bottom_left_radius_(border_bottom_left_radius) {
  return property("border-bottom-left-radius", border_bottom_left_radius);
}

export function border_bottom_right_radius(border_bottom_right_radius) {
  let _pipe = $size.to_string(border_bottom_right_radius);
  return ((_capture) => {
    return property("border-bottom-right-radius", _capture);
  })(_pipe);
}

export function border_bottom_right_radius_(border_bottom_right_radius) {
  return property("border-bottom-right-radius", border_bottom_right_radius);
}

export function border_bottom_style(value) {
  return property("border-bottom-style", value);
}

export function border_bottom_width(value) {
  return property("border-bottom-width", $size.to_string(value));
}

export function border_bottom_width_(value) {
  return property("border-bottom-width", value);
}

export function border_collapse(value) {
  return property("border-collapse", value);
}

export function border_color(value) {
  return property("border-color", value);
}

export function border_end_end_radius(value) {
  return property("border-end-end-radius", value);
}

export function border_end_start_radius(value) {
  return property("border-end-start-radius", value);
}

export function border_image(value) {
  return property("border-image", value);
}

export function border_image_outset(value) {
  return property("border-image-outset", $size.to_string(value));
}

export function border_image_outset_(value) {
  return property("border-image-outset", value);
}

export function border_image_repeat(value) {
  return property("border-image-repeat", value);
}

export function border_image_slice(value) {
  return property("border-image-slice", value);
}

export function border_image_source(value) {
  return property("border-image-source", value);
}

export function border_image_width(value) {
  return property("border-image-width", $size.to_string(value));
}

export function border_image_width_(value) {
  return property("border-image-width", value);
}

export function border_inline(value) {
  return property("border-inline", value);
}

export function border_inline_color(value) {
  return property("border-inline-color", value);
}

export function border_inline_end(value) {
  return property("border-inline-end", value);
}

export function border_inline_end_color(value) {
  return property("border-inline-end-color", value);
}

export function border_inline_end_style(value) {
  return property("border-inline-end-style", value);
}

export function border_inline_end_width(value) {
  return property("border-inline-end-width", $size.to_string(value));
}

export function border_inline_end_width_(value) {
  return property("border-inline-end-width", value);
}

export function border_inline_start(value) {
  return property("border-inline-start", value);
}

export function border_inline_start_color(value) {
  return property("border-inline-start-color", value);
}

export function border_inline_start_style(value) {
  return property("border-inline-start-style", value);
}

export function border_inline_start_width(value) {
  return property("border-inline-start-width", $size.to_string(value));
}

export function border_inline_start_width_(value) {
  return property("border-inline-start-width", value);
}

export function border_inline_style(value) {
  return property("border-inline-style", value);
}

export function border_inline_width(value) {
  return property("border-inline-width", $size.to_string(value));
}

export function border_inline_width_(value) {
  return property("border-inline-width", value);
}

export function border_left(value) {
  return property("border-left", value);
}

export function border_left_color(value) {
  return property("border-left-color", value);
}

export function border_left_style(value) {
  return property("border-left-style", value);
}

export function border_left_width(value) {
  return property("border-left-width", $size.to_string(value));
}

export function border_left_width_(value) {
  return property("border-left-width", value);
}

export function border_radius(border_radius) {
  return property("border-radius", $size.to_string(border_radius));
}

export function border_radius_(border_radius) {
  return property("border-radius", border_radius);
}

export function border_right(value) {
  return property("border-right", value);
}

export function border_right_color(value) {
  return property("border-right-color", value);
}

export function border_right_style(value) {
  return property("border-right-style", value);
}

export function border_right_width(value) {
  return property("border-right-width", $size.to_string(value));
}

export function border_right_width_(value) {
  return property("border-right-width", value);
}

export function border_spacing(value) {
  return property("border-spacing", $size.to_string(value));
}

export function border_spacing_(value) {
  return property("border-spacing", value);
}

export function border_start_end_radius(value) {
  return property("border-start-end-radius", value);
}

export function border_start_start_radius(value) {
  return property("border-start-start-radius", value);
}

export function border_style(value) {
  return property("border-style", value);
}

export function border_top(value) {
  return property("border-top", value);
}

export function border_top_color(value) {
  return property("border-top-color", value);
}

export function border_top_left_radius(border_top_left_radius) {
  let _pipe = $size.to_string(border_top_left_radius);
  return ((_capture) => { return property("border-top-left-radius", _capture); })(
    _pipe,
  );
}

export function border_top_left_radius_(border_top_left_radius) {
  return property("border-top-left-radius", border_top_left_radius);
}

export function border_top_right_radius(border_top_right_radius) {
  let _pipe = $size.to_string(border_top_right_radius);
  return ((_capture) => { return property("border-top-right-radius", _capture); })(
    _pipe,
  );
}

export function border_top_right_radius_(border_top_right_radius) {
  return property("border-top-right-radius", border_top_right_radius);
}

export function border_top_style(value) {
  return property("border-top-style", value);
}

export function border_top_width(value) {
  return property("border-top-width", $size.to_string(value));
}

export function border_top_width_(value) {
  return property("border-top-width", value);
}

export function border_width(value) {
  return property("border-width", $size.to_string(value));
}

export function border_width_(value) {
  return property("border-width", value);
}

export function bottom(size) {
  return property("bottom", $size.to_string(size));
}

export function bottom_(size) {
  return property("bottom", size);
}

export function box_shadow(box_shadow) {
  return property("box-shadow", box_shadow);
}

export function box_sizing(box_sizing) {
  return property("box-sizing", box_sizing);
}

export function caption_side(value) {
  return property("caption-side", value);
}

export function caret_color(value) {
  return property("caret-color", value);
}

export function clear(value) {
  return property("clear", value);
}

export function clip_path(value) {
  return property("clip-path", value);
}

export function color(color) {
  return property("color", color);
}

export function color_interpolation(value) {
  return property("color-interpolation", value);
}

export function color_scheme(value) {
  return property("color-scheme", value);
}

export function column_count(value) {
  return property("column-count", value);
}

export function column_fill(value) {
  return property("column-fill", value);
}

export function column_gap(column_gap) {
  return property("column-gap", $size.to_string(column_gap));
}

export function column_rule(value) {
  return property("column-rule", value);
}

export function column_rule_color(value) {
  return property("column-rule-color", value);
}

export function column_rule_style(value) {
  return property("column-rule-style", value);
}

export function column_rule_width(value) {
  return property("column-rule-width", value);
}

export function column_span(value) {
  return property("column-span", value);
}

export function column_width(value) {
  return property("column-width", value);
}

export function columns(value) {
  return property("columns", value);
}

export function contain(value) {
  return property("contain", value);
}

export function contain_intrinsic_block_size(value) {
  return property("contain-intrinsic-block-size", $size.to_string(value));
}

export function contain_intrinsic_block_size_(value) {
  return property("contain-intrinsic-block-size", value);
}

export function contain_intrinsic_height(value) {
  return property("contain-intrinsic-height", $size.to_string(value));
}

export function contain_intrinsic_height_(value) {
  return property("contain-intrinsic-height", value);
}

export function contain_intrinsic_inline_size(value) {
  return property("contain-intrinsic-inline-size", $size.to_string(value));
}

export function contain_intrinsic_inline_size_(value) {
  return property("contain-intrinsic-inline-size", value);
}

export function contain_intrinsic_size(value) {
  return property("contain-intrinsic-size", $size.to_string(value));
}

export function contain_intrinsic_size_(value) {
  return property("contain-intrinsic-size", value);
}

export function contain_intrinsic_width(value) {
  return property("contain-intrinsic-width", $size.to_string(value));
}

export function contain_intrinsic_width_(value) {
  return property("contain-intrinsic-width", value);
}

export function container(value) {
  return property("container", value);
}

export function container_name(value) {
  return property("container-name", value);
}

export function container_type(value) {
  return property("container-type", value);
}

export function content(value) {
  return property("content", value);
}

export function counter_increment(value) {
  return property("counter-increment", value);
}

export function counter_reset(value) {
  return property("counter-reset", value);
}

export function counter_set(value) {
  return property("counter-set", value);
}

export function cursor(cursor) {
  return property("cursor", cursor);
}

export function cx(value) {
  return property("cx", $size.to_string(value));
}

export function cx_(value) {
  return property("cx", value);
}

export function cy(value) {
  return property("cy", $size.to_string(value));
}

export function cy_(value) {
  return property("cy", value);
}

export function direction(direction) {
  return property("direction", direction);
}

export function display(display) {
  return property("display", display);
}

export function empty_cells(empty_cells) {
  return property("empty-cells", empty_cells);
}

export function field_sizing(field_sizing) {
  return property("field-sizing", field_sizing);
}

export function filter(filter) {
  return property("filter", filter);
}

export function flex(flex) {
  return property("flex", flex);
}

export function flex_basis(flex_basis) {
  return property("flex-basis", flex_basis);
}

export function flex_direction(flex_direction) {
  return property("flex-direction", flex_direction);
}

export function flex_flow(flex_flow) {
  return property("flex-flow", flex_flow);
}

export function flex_grow(flex_grow) {
  return property("flex-grow", $int.to_string(flex_grow));
}

export function flex_grow_(flex_grow) {
  return property("flex-grow", flex_grow);
}

export function flex_shrink_(flex_shrink) {
  return property("flex-shrink", flex_shrink);
}

export function flex_wrap(flex_wrap) {
  return property("flex-wrap", flex_wrap);
}

export function float(float) {
  return property("float", float);
}

export function flex_shrink(flex_shrink) {
  return property("flex-shrink", $float.to_string(flex_shrink));
}

export function font(value) {
  return property("font", value);
}

export function font_family(font_family) {
  return property("font-family", font_family);
}

export function font_feature_settings(value) {
  return property("font-feature-settings", value);
}

export function font_kerning(value) {
  return property("font-kerning", value);
}

export function font_language_override(value) {
  return property("font-language-override", value);
}

export function font_optical_sizing(value) {
  return property("font-optical-sizing", value);
}

export function font_palette(value) {
  return property("font-palette", value);
}

export function font_size(font_size) {
  return property("font-size", $size.to_string(font_size));
}

export function font_size_(font_size) {
  return property("font-size", font_size);
}

export function font_size_adjust(value) {
  return property("font-size-adjust", value);
}

export function font_stretch(value) {
  return property("font-stretch", value);
}

export function font_style(font_style) {
  return property("font-style", font_style);
}

export function font_synthesis(value) {
  return property("font-synthesis", value);
}

export function font_synthesis_position(value) {
  return property("font-synthesis-position", value);
}

export function font_synthesis_small_caps(value) {
  return property("font-synthesis-small-caps", value);
}

export function font_synthesis_style(value) {
  return property("font-synthesis-style", value);
}

export function font_synthesis_weight(value) {
  return property("font-synthesis-weight", value);
}

export function font_variant(value) {
  return property("font-variant", value);
}

export function font_variant_alternates(value) {
  return property("font-variant-alternates", value);
}

export function font_variant_caps(value) {
  return property("font-variant-caps", value);
}

export function font_variant_east_asian(value) {
  return property("font-variant-east-asian", value);
}

export function font_variant_emoji(value) {
  return property("font-variant-emoji", value);
}

export function font_variant_ligatures(value) {
  return property("font-variant-ligatures", value);
}

export function font_variant_numeric(value) {
  return property("font-variant-numeric", value);
}

export function font_variant_position(value) {
  return property("font-variant-position", value);
}

export function font_variation_settings(value) {
  return property("font-variation-settings", value);
}

export function font_weight(font_weight) {
  return property("font-weight", font_weight);
}

export function forced_color_adjust(value) {
  return property("forced-color-adjust", value);
}

export function gap(gap) {
  return property("gap", $size.to_string(gap));
}

export function gap_(gap) {
  return property("gap", gap);
}

export function grid_area(grid_area) {
  return property("grid-area", grid_area);
}

export function grid_auto_columns(grid_auto_columns) {
  return property("grid-auto-columns", grid_auto_columns);
}

export function grid_auto_flow(grid_auto_flow) {
  return property("grid-auto-flow", grid_auto_flow);
}

export function grid_auto_rows(grid_auto_rows) {
  return property("grid-auto-rows", grid_auto_rows);
}

export function grid_column(grid_column) {
  return property("grid-column", grid_column);
}

export function grid_column_end(grid_column) {
  return property("grid-column-end", grid_column);
}

export function grid_column_start(grid_column) {
  return property("grid-column-start", grid_column);
}

export function grid_row(grid_row) {
  return property("grid-row", grid_row);
}

export function grid_row_end(grid_row) {
  return property("grid-row-end", grid_row);
}

export function grid_row_start(grid_row) {
  return property("grid-row-start", grid_row);
}

export function grid_template(grid_template) {
  return property("grid-template", grid_template);
}

export function grid_template_areas(grid_template_areas) {
  return property(
    "grid-template-areas",
    (() => {
      let _pipe = grid_template_areas;
      let _pipe$1 = $list.map(
        _pipe,
        (content) => { return ("\"" + content) + "\""; },
      );
      return $string.join(_pipe$1, "\n");
    })(),
  );
}

export function grid_template_columns(grid_template_columns) {
  return property("grid-template-columns", grid_template_columns);
}

export function grid_template_rows(grid_template_rows) {
  return property("grid-template-rows", grid_template_rows);
}

export function hanging_punctuation(value) {
  return property("hanging-punctuation", value);
}

export function height(height) {
  return property("height", $size.to_string(height));
}

export function height_(height) {
  return property("height", height);
}

export function hyphenate_character(value) {
  return property("hyphenate-character", value);
}

export function hyphenate_limit_chars(value) {
  return property("hyphenate-limit-chars", value);
}

export function hyphens(value) {
  return property("hyphens", value);
}

export function image_orientation(value) {
  return property("image-orientation", value);
}

export function image_rendering(value) {
  return property("image-rendering", value);
}

export function inline_size(value) {
  return property("inline-size", value);
}

export function inset(value) {
  return property("inset", value);
}

export function inset_area(value) {
  return property("inset-area", value);
}

export function inset_block(value) {
  return property("inset-block", value);
}

export function inset_block_end(value) {
  return property("inset-block-end", value);
}

export function inset_block_start(value) {
  return property("inset-block-start", value);
}

export function inset_inline(value) {
  return property("inset-inline", value);
}

export function inset_inline_end(value) {
  return property("inset-inline-end", value);
}

export function inset_inline_start(value) {
  return property("inset-inline-start", value);
}

export function isolation(value) {
  return property("isolation", value);
}

export function justify_content(justify) {
  return property("justify-content", justify);
}

export function justify_items(justify) {
  return property("justify-items", justify);
}

export function justify_self(justify) {
  return property("justify-self", justify);
}

export function justify_tracks(justify) {
  return property("justify-tracks", justify);
}

export function left(size) {
  return property("left", $size.to_string(size));
}

export function left_(size) {
  return property("left", size);
}

export function letter_spacing(letter_spacing) {
  return property("letter-spacing", letter_spacing);
}

export function line_break(line_break) {
  return property("line-break", line_break);
}

export function line_height(line_height) {
  return property("line-height", line_height);
}

export function list_style(list_style) {
  return property("list-style", list_style);
}

export function list_style_image(list_style_image) {
  return property("list-style-image", list_style_image);
}

export function list_style_position(list_style_position) {
  return property("list-style-position", list_style_position);
}

export function list_style_type(list_style_type) {
  return property("list-style-type", list_style_type);
}

export function margin(margin) {
  return property("margin", $size.to_string(margin));
}

export function margin_(margin) {
  return property("margin", margin);
}

export function margin_block(margin) {
  return property("margin-block", $size.to_string(margin));
}

export function margin_block_(margin) {
  return property("margin-block", margin);
}

export function margin_block_end(margin) {
  return property("margin-block-end", $size.to_string(margin));
}

export function margin_block_end_(margin) {
  return property("margin-block-end", margin);
}

export function margin_block_start(margin) {
  return property("margin-block-start", $size.to_string(margin));
}

export function margin_block_start_(margin) {
  return property("margin-block-start", margin);
}

export function margin_bottom(margin) {
  return property("margin-bottom", $size.to_string(margin));
}

export function margin_bottom_(margin) {
  return property("margin-bottom", margin);
}

export function margin_inline(margin) {
  return property("margin-inline", $size.to_string(margin));
}

export function margin_inline_(margin) {
  return property("margin-inline", margin);
}

export function margin_inline_end(margin) {
  return property("margin-inline-end", $size.to_string(margin));
}

export function margin_inline_end_(margin) {
  return property("margin-inline-end", margin);
}

export function margin_inline_start(margin) {
  return property("margin-inline-start", $size.to_string(margin));
}

export function margin_inline_start_(margin) {
  return property("margin-inline-start", margin);
}

export function margin_left(margin) {
  return property("margin-left", $size.to_string(margin));
}

export function margin_left_(margin) {
  return property("margin-left", margin);
}

export function margin_right(margin) {
  return property("margin-right", $size.to_string(margin));
}

export function margin_right_(margin) {
  return property("margin-right", margin);
}

export function margin_top(margin) {
  return property("margin-top", $size.to_string(margin));
}

export function margin_top_(margin) {
  return property("margin-top", margin);
}

export function mask(value) {
  return property("mask", value);
}

export function mask_border(value) {
  return property("mask-border", value);
}

export function mask_border_mode(value) {
  return property("mask-border-mode", value);
}

export function mask_border_outset(value) {
  return property("mask-border-outset", value);
}

export function mask_border_repeat(value) {
  return property("mask-border-repeat", value);
}

export function mask_border_slice(value) {
  return property("mask-border-slice", value);
}

export function mask_border_source(value) {
  return property("mask-border-source", value);
}

export function mask_border_width(value) {
  return property("mask-border-width", value);
}

export function mask_clip(value) {
  return property("mask-clip", value);
}

export function mask_composite(value) {
  return property("mask-composite", value);
}

export function mask_image(value) {
  return property("mask-image", value);
}

export function mask_mode(value) {
  return property("mask-mode", value);
}

export function mask_origin(value) {
  return property("mask-origin", value);
}

export function mask_position(value) {
  return property("mask-position", value);
}

export function mask_repeat(value) {
  return property("mask-repeat", value);
}

export function mask_size(value) {
  return property("mask-size", value);
}

export function mask_type(value) {
  return property("mask-type", value);
}

export function math_depth(value) {
  return property("math-depth", value);
}

export function math_style(value) {
  return property("math-style", value);
}

export function max_block_size(value) {
  return property("max-block-size", $size.to_string(value));
}

export function max_block_size_(value) {
  return property("max-block-size", value);
}

export function max_height(height) {
  return property("max-height", $size.to_string(height));
}

export function max_height_(height) {
  return property("max-height", height);
}

export function max_inline_size(value) {
  return property("max-inline-size", $size.to_string(value));
}

export function max_inline_size_(value) {
  return property("max-inline-size", value);
}

export function max_width(width) {
  return property("max-width", $size.to_string(width));
}

export function max_width_(width) {
  return property("max-width", width);
}

export function min_block_size(value) {
  return property("min-block-size", $size.to_string(value));
}

export function min_block_size_(value) {
  return property("min-block-size", value);
}

export function min_height(height) {
  return property("min-height", $size.to_string(height));
}

export function min_height_(height) {
  return property("min-height", height);
}

export function min_inline_size(value) {
  return property("min-inline-size", $size.to_string(value));
}

export function min_inline_size_(value) {
  return property("min-inline-size", value);
}

export function min_width(width) {
  return property("min-width", $size.to_string(width));
}

export function min_width_(width) {
  return property("min-width", width);
}

export function mix_blend_mode(value) {
  return property("mix-blend-mode", value);
}

export function object_fit(object_fit) {
  return property("object-fit", object_fit);
}

export function object_position(object_position) {
  return property("object-position", object_position);
}

export function offset(offset) {
  return property("offset", offset);
}

export function offset_anchor(offset_anchor) {
  return property("offset-anchor", offset_anchor);
}

export function offset_distance(offset_distance) {
  return property("offset-distance", offset_distance);
}

export function offset_path(offset_path) {
  return property("offset-path", offset_path);
}

export function offset_position(offset_position) {
  return property("offset-position", offset_position);
}

export function offset_rotate(offset_rotate) {
  return property("offset-rotate", offset_rotate);
}

export function opacity(opacity) {
  return property("opacity", $float.to_string(opacity));
}

export function order(value) {
  return property("order", $int.to_string(value));
}

export function order_(value) {
  return property("order", value);
}

export function orphans(value) {
  return property("orphans", $int.to_string(value));
}

export function orphans_(value) {
  return property("orphans", value);
}

export function outline(outline) {
  return property("outline", outline);
}

export function outline_color(outline_color) {
  return property("outline-color", outline_color);
}

export function outline_offset(outline_offset) {
  return property("outline-offset", outline_offset);
}

export function outline_style(outline_style) {
  return property("outline-style", outline_style);
}

export function outline_width(outline_width) {
  return property("outline-width", outline_width);
}

export function overflow(overflow) {
  return property("overflow", overflow);
}

export function overflow_anchor(overflow_anchor) {
  return property("overflow-anchor", overflow_anchor);
}

export function overflow_block(overflow_block) {
  return property("overflow-block", overflow_block);
}

export function overflow_clip_margin(overflow_clip_margin) {
  return property("overflow-clip-margin", overflow_clip_margin);
}

export function overflow_inline(overflow_inline) {
  return property("overflow-inline", overflow_inline);
}

export function overflow_wrap(overflow_wrap) {
  return property("overflow-wrap", overflow_wrap);
}

export function overflow_x(overflow_x) {
  return property("overflow-x", overflow_x);
}

export function overflow_y(overflow_y) {
  return property("overflow-y", overflow_y);
}

export function overscroll_behavior(value) {
  return property("overscroll-behavior", value);
}

export function overscroll_behavior_block(value) {
  return property("overscroll-behavior-block", value);
}

export function overscroll_behavior_inline(value) {
  return property("overscroll-behavior-inline", value);
}

export function overscroll_behavior_x(value) {
  return property("overscroll-behavior-x", value);
}

export function overscroll_behavior_y(value) {
  return property("overscroll-behavior-y", value);
}

export function padding(padding) {
  return property("padding", $size.to_string(padding));
}

export function padding_(padding) {
  return property("padding", padding);
}

export function padding_block(padding) {
  return property("padding-block", $size.to_string(padding));
}

export function padding_block_(padding) {
  return property("padding-block", padding);
}

export function padding_block_end(padding) {
  return property("padding-block-end", $size.to_string(padding));
}

export function padding_block_end_(padding) {
  return property("padding-block-end", padding);
}

export function padding_block_start(padding) {
  return property("padding-block-start", $size.to_string(padding));
}

export function padding_block_start_(padding) {
  return property("padding-block-start", padding);
}

export function padding_bottom(padding) {
  return property("padding-bottom", $size.to_string(padding));
}

export function padding_inline(padding) {
  return property("padding-inline", $size.to_string(padding));
}

export function padding_inline_(padding) {
  return property("padding-inline", padding);
}

export function padding_inline_end(padding) {
  return property("padding-inline-end", $size.to_string(padding));
}

export function padding_inline_end_(padding) {
  return property("padding-inline-end", padding);
}

export function padding_inline_start(padding) {
  return property("padding-inline-start", $size.to_string(padding));
}

export function padding_inline_start_(padding) {
  return property("padding-inline-start", padding);
}

export function padding_left(padding) {
  return property("padding-left", $size.to_string(padding));
}

export function padding_right(padding) {
  return property("padding-right", $size.to_string(padding));
}

export function padding_top(padding) {
  return property("padding-top", $size.to_string(padding));
}

export function page(value) {
  return property("page", value);
}

export function page_break_after(value) {
  return property("page-break-after", value);
}

export function page_break_before(value) {
  return property("page-break-before", value);
}

export function page_break_inside(value) {
  return property("page-break-inside", value);
}

export function paint_order(value) {
  return property("paint-order", value);
}

export function perspective(value) {
  return property("perspective", value);
}

export function perspective_origin(value) {
  return property("perspective-origin", value);
}

export function place_content(place) {
  return property("place-content", place);
}

export function place_items(place) {
  return property("place-items", place);
}

export function place_self(place) {
  return property("place-self", place);
}

export function pointer_events(pointer_events) {
  return property("pointer-events", pointer_events);
}

export function position(position) {
  return property("position", position);
}

export function print_color_adjust(print) {
  return property("print-color-adjust", print);
}

export function quotes(quotes) {
  return property("quotes", quotes);
}

export function r(r) {
  return property("r", r);
}

export function resize(value) {
  return property("resize", value);
}

export function right(size) {
  return property("right", $size.to_string(size));
}

export function right_(size) {
  return property("right", size);
}

export function rotate(value) {
  return property("rotate", value);
}

export function row_gap(row_gap) {
  return property("row-gap", $size.to_string(row_gap));
}

export function ruby_position(value) {
  return property("ruby-position", value);
}

export function rx(value) {
  return property("rx", $size.to_string(value));
}

export function rx_(value) {
  return property("rx", value);
}

export function ry(value) {
  return property("ry", $size.to_string(value));
}

export function ry_(value) {
  return property("ry", value);
}

export function scale(value) {
  return property("scale", value);
}

export function scroll_behavior(value) {
  return property("scroll-behavior", value);
}

export function scroll_margin(value) {
  return property("scroll-margin", $size.to_string(value));
}

export function scroll_margin_(value) {
  return property("scroll-margin", value);
}

export function scroll_margin_block(value) {
  return property("scroll-margin-block", $size.to_string(value));
}

export function scroll_margin_block_(value) {
  return property("scroll-margin-block", value);
}

export function scroll_margin_block_end(value) {
  return property("scroll-margin-block-end", $size.to_string(value));
}

export function scroll_margin_block_end_(value) {
  return property("scroll-margin-block-end", value);
}

export function scroll_margin_block_start(value) {
  return property("scroll-margin-block-start", $size.to_string(value));
}

export function scroll_margin_block_start_(value) {
  return property("scroll-margin-block-start", value);
}

export function scroll_margin_bottom(value) {
  return property("scroll-margin-bottom", $size.to_string(value));
}

export function scroll_margin_bottom_(value) {
  return property("scroll-margin-bottom", value);
}

export function scroll_margin_inline(value) {
  return property("scroll-margin-inline", $size.to_string(value));
}

export function scroll_margin_inline_(value) {
  return property("scroll-margin-inline", value);
}

export function scroll_margin_inline_end(value) {
  return property("scroll-margin-inline-end", $size.to_string(value));
}

export function scroll_margin_inline_end_(value) {
  return property("scroll-margin-inline-end", value);
}

export function scroll_margin_inline_start(value) {
  return property("scroll-margin-inline-start", $size.to_string(value));
}

export function scroll_margin_inline_start_(value) {
  return property("scroll-margin-inline-start", value);
}

export function scroll_margin_left(value) {
  return property("scroll-margin-left", $size.to_string(value));
}

export function scroll_margin_left_(value) {
  return property("scroll-margin-left", value);
}

export function scroll_margin_right(value) {
  return property("scroll-margin-right", $size.to_string(value));
}

export function scroll_margin_right_(value) {
  return property("scroll-margin-right", value);
}

export function scroll_margin_top(value) {
  return property("scroll-margin-top", $size.to_string(value));
}

export function scroll_margin_top_(value) {
  return property("scroll-margin-top", value);
}

export function scroll_padding(value) {
  return property("scroll-padding", $size.to_string(value));
}

export function scroll_padding_(value) {
  return property("scroll-padding", value);
}

export function scroll_padding_block(value) {
  return property("scroll-padding-block", $size.to_string(value));
}

export function scroll_padding_block_(value) {
  return property("scroll-padding-block", value);
}

export function scroll_padding_block_end(value) {
  return property("scroll-padding-block-end", $size.to_string(value));
}

export function scroll_padding_block_end_(value) {
  return property("scroll-padding-block-end", value);
}

export function scroll_padding_block_start(value) {
  return property("scroll-padding-block-start", $size.to_string(value));
}

export function scroll_padding_block_start_(value) {
  return property("scroll-padding-block-start", value);
}

export function scroll_padding_bottom(value) {
  return property("scroll-padding-bottom", $size.to_string(value));
}

export function scroll_padding_bottom_(value) {
  return property("scroll-padding-bottom", value);
}

export function scroll_padding_inline(value) {
  return property("scroll-padding-inline", $size.to_string(value));
}

export function scroll_padding_inline_(value) {
  return property("scroll-padding-inline", value);
}

export function scroll_padding_inline_end(value) {
  return property("scroll-padding-inline-end", $size.to_string(value));
}

export function scroll_padding_inline_end_(value) {
  return property("scroll-padding-inline-end", value);
}

export function scroll_padding_inline_start(value) {
  return property("scroll-padding-inline-start", $size.to_string(value));
}

export function scroll_padding_inline_start_(value) {
  return property("scroll-padding-inline-start", value);
}

export function scroll_padding_left(value) {
  return property("scroll-padding-left", $size.to_string(value));
}

export function scroll_padding_left_(value) {
  return property("scroll-padding-left", value);
}

export function scroll_padding_right(value) {
  return property("scroll-padding-right", $size.to_string(value));
}

export function scroll_padding_right_(value) {
  return property("scroll-padding-right", value);
}

export function scroll_padding_top(value) {
  return property("scroll-padding-top", $size.to_string(value));
}

export function scroll_padding_top_(value) {
  return property("scroll-padding-top", value);
}

export function scroll_snap_align(value) {
  return property("scroll-snap-align", value);
}

export function scroll_snap_stop(value) {
  return property("scroll-snap-stop", value);
}

export function scroll_snap_type(value) {
  return property("scroll-snap-type", value);
}

export function scrollbar_color(value) {
  return property("scrollbar-color", value);
}

export function scrollbar_gutter(value) {
  return property("scrollbar-gutter", value);
}

export function scrollbar_width(value) {
  return property("scrollbar-width", value);
}

export function shape_image_threshold(value) {
  return property("shape-image-threshold", $float.to_string(value));
}

export function shape_image_threshold_(value) {
  return property("shape-image-threshold", value);
}

export function shape_margin(value) {
  return property("shape-margin", $size.to_string(value));
}

export function shape_margin_(value) {
  return property("shape-margin", value);
}

export function shape_outside(value) {
  return property("shape-outside", value);
}

export function tab_size(size) {
  return property("tab-size", $size.to_string(size));
}

export function tab_size_(size) {
  return property("tab-size", size);
}

export function table_layout(layout) {
  return property("table-layout", layout);
}

export function text_align(text_align) {
  return property("text-align", text_align);
}

export function text_align_last(value) {
  return property("text-align-last", value);
}

export function text_combine_upright(value) {
  return property("text-combine-upright", value);
}

export function text_decoration(text_decoration) {
  return property("text-decoration", text_decoration);
}

export function text_decoration_color(value) {
  return property("text-decoration-color", value);
}

export function text_decoration_line(value) {
  return property("text-decoration-line", value);
}

export function text_decoration_skip_ink(value) {
  return property("text-decoration-skip-ink", value);
}

export function text_decoration_style(value) {
  return property("text-decoration-style", value);
}

export function text_decoration_thickness(value) {
  return property("text-decoration-thickness", value);
}

export function text_emphasis(value) {
  return property("text-emphasis", value);
}

export function text_emphasis_color(value) {
  return property("text-emphasis-color", value);
}

export function text_emphasis_position(value) {
  return property("text-emphasis-position", value);
}

export function text_emphasis_style(value) {
  return property("text-emphasis-style", value);
}

export function text_indent(value) {
  return property("text-indent", value);
}

export function text_justify(text_justify) {
  return property("text-justify", text_justify);
}

export function text_orientation(value) {
  return property("text-orientation", value);
}

export function text_overflow(text_overflow) {
  return property("text-overflow", text_overflow);
}

export function text_rendering(value) {
  return property("text-rendering", value);
}

export function text_shadow(value) {
  return property("text-shadow", value);
}

export function text_transform(text_transform) {
  return property("text-transform", text_transform);
}

export function text_underline_offset(value) {
  return property("text-underline-offset", $size.to_string(value));
}

export function text_underline_offset_(value) {
  return property("text-underline-offset", value);
}

export function text_underline_position(value) {
  return property("text-underline-position", value);
}

export function text_wrap(value) {
  return property("text-wrap", value);
}

export function text_wrap_mode(value) {
  return property("text-wrap-mode", value);
}

export function text_wrap_style(value) {
  return property("text-wrap-style", value);
}

export function top(size) {
  return property("top", $size.to_string(size));
}

export function top_(size) {
  return property("top", size);
}

export function touch_action(value) {
  return property("touch-action", value);
}

export function transform(transform) {
  return property("transform", transform);
}

export function transform_(transform_args) {
  let transform_string = $transform.to_string(transform_args);
  return property("transform", transform_string);
}

export function transform_box(transform_box) {
  return property("transform-box", transform_box);
}

export function transform_origin(transform_origin) {
  return property("transform-origin", transform_origin);
}

export function transform_style(transform_style) {
  return property("transform-style", transform_style);
}

export function transition(transition) {
  return property("transition", transition);
}

export function transition_behavior(value) {
  return property("transition-behavior", value);
}

export function transition_delay(value) {
  return property("transition-delay", value);
}

export function transition_duration(value) {
  return property("transition-duration", value);
}

export function transition_property(value) {
  return property("transition-property", value);
}

export function transition_timing_function(value) {
  return property("transition-timing-function", value);
}

export function translate(translate) {
  return property("translate", translate);
}

export function unicode_bidi(value) {
  return property("unicode-bidi", value);
}

export function user_select(user_select) {
  return property("user-select", user_select);
}

export function vertical_align(value) {
  return property("vertical-align", value);
}

export function visibility(visibility) {
  return property("visibility", visibility);
}

export function white_space(white_space) {
  return property("white-space", white_space);
}

export function white_space_collapse(white_space_collapse) {
  return property("white-space-collapse", white_space_collapse);
}

export function widows(value) {
  return property("widows", value);
}

export function width(width) {
  return property("width", $size.to_string(width));
}

export function width_(width) {
  return property("width", width);
}

export function will_change(value) {
  return property("will-change", value);
}

export function word_break(word_break) {
  return property("word-break", word_break);
}

export function word_spacing(word_spacing) {
  return property("word-spacing", word_spacing);
}

export function word_wrap(word_wrap) {
  return property("word-wrap", word_wrap);
}

export function writing_mode(value) {
  return property("writing-mode", value);
}

export function z_index(z_index) {
  return property("z-index", $int.to_string(z_index));
}

export function zoom(value) {
  return property("zoom", value);
}

export function media(query, styles) {
  let media_selector = $media.to_string(query);
  return new $style.Media(media_selector, styles);
}

export function pseudo_selector(value, styles) {
  return new $style.PseudoSelector(value, styles);
}

export function placeholder(styles) {
  return pseudo_selector("::placeholder", styles);
}

export function hover(styles) {
  return pseudo_selector(":hover", styles);
}

export function active(styles) {
  return pseudo_selector(":active", styles);
}

export function focus(styles) {
  return pseudo_selector(":focus", styles);
}

export function focus_visible(styles) {
  return pseudo_selector(":focus-visible", styles);
}

export function focus_within(styles) {
  return pseudo_selector(":focus-within", styles);
}

export function enabled(styles) {
  return pseudo_selector(":enabled", styles);
}

export function disabled(styles) {
  return pseudo_selector(":disabled", styles);
}

export function read_only(styles) {
  return pseudo_selector(":read-only", styles);
}

export function read_write(styles) {
  return pseudo_selector(":read-write", styles);
}

export function checked(styles) {
  return pseudo_selector(":checked", styles);
}

export function blank(styles) {
  return pseudo_selector(":blank", styles);
}

export function valid(styles) {
  return pseudo_selector(":valid", styles);
}

export function invalid(styles) {
  return pseudo_selector(":invalid", styles);
}

export function required(styles) {
  return pseudo_selector(":required", styles);
}

export function optional(styles) {
  return pseudo_selector(":optional", styles);
}

export function link(styles) {
  return pseudo_selector(":link", styles);
}

export function visited(styles) {
  return pseudo_selector(":visited", styles);
}

export function target(styles) {
  return pseudo_selector(":target", styles);
}

export function nth_child(selector, styles) {
  return pseudo_selector($string.append(":nth-child", selector), styles);
}

export function nth_last_child(selector, styles) {
  return pseudo_selector($string.append(":nth-last-child", selector), styles);
}

export function nth_of_type(selector, styles) {
  return pseudo_selector($string.append(":nth-of-type", selector), styles);
}

export function nth_last_of_type(selector, styles) {
  return pseudo_selector($string.append(":nth-last-of-type", selector), styles);
}

export function first_child(styles) {
  return pseudo_selector(":first-child", styles);
}

export function last_child(styles) {
  return pseudo_selector(":last-child", styles);
}

export function only_child(styles) {
  return pseudo_selector(":only-child", styles);
}

export function first_of_type(styles) {
  return pseudo_selector(":first-of-type", styles);
}

export function last_of_type(styles) {
  return pseudo_selector(":last-of-type", styles);
}

export function only_of_type(styles) {
  return pseudo_selector(":only-of-type", styles);
}

export function important(style) {
  if (style instanceof $style.Property) {
    let key = style.key;
    let value = style.value;
    return new $style.Property(key, value, true);
  } else {
    let any = style;
    return any;
  }
}

export function compose(class$) {
  return new $style.ClassName(class$);
}
