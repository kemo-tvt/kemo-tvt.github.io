import * as $bool from "../../../gleam_stdlib/gleam/bool.mjs";
import * as $dict from "../../../gleam_stdlib/gleam/dict.mjs";
import * as $int from "../../../gleam_stdlib/gleam/int.mjs";
import * as $list from "../../../gleam_stdlib/gleam/list.mjs";
import * as $option from "../../../gleam_stdlib/gleam/option.mjs";
import { None, Some } from "../../../gleam_stdlib/gleam/option.mjs";
import * as $pair from "../../../gleam_stdlib/gleam/pair.mjs";
import * as $string from "../../../gleam_stdlib/gleam/string.mjs";
import { toList, prepend as listPrepend, CustomType as $CustomType, makeError } from "../../gleam.mjs";
import * as $class from "../../sketch/internals/class.mjs";
import * as $sketch_string from "../../sketch/internals/string.mjs";
import { xxHash32 as xx_hash32 } from "../../xxhash.ffi.mjs";

export class Class extends $CustomType {
  constructor(string_representation, content) {
    super();
    this.string_representation = string_representation;
    this.content = content;
  }
}

export class EphemeralCache extends $CustomType {
  constructor(cache) {
    super();
    this.cache = cache;
  }
}

export class PersistentCache extends $CustomType {
  constructor(cache, current_id) {
    super();
    this.cache = cache;
    this.current_id = current_id;
  }
}

export class ClassName extends $CustomType {
  constructor(class_name) {
    super();
    this.class_name = class_name;
  }
}

export class Media extends $CustomType {
  constructor(query, styles) {
    super();
    this.query = query;
    this.styles = styles;
  }
}

export class PseudoSelector extends $CustomType {
  constructor(pseudo_selector, styles) {
    super();
    this.pseudo_selector = pseudo_selector;
    this.styles = styles;
  }
}

export class Property extends $CustomType {
  constructor(key, value, important) {
    super();
    this.key = key;
    this.value = value;
    this.important = important;
  }
}

export class NoStyle extends $CustomType {}

export class ComputedProperties extends $CustomType {
  constructor(properties, medias, pseudo_selectors, indent) {
    super();
    this.properties = properties;
    this.medias = medias;
    this.pseudo_selectors = pseudo_selectors;
    this.indent = indent;
  }
}

export class MediaProperty extends $CustomType {
  constructor(query, properties, pseudo_selectors) {
    super();
    this.query = query;
    this.properties = properties;
    this.pseudo_selectors = pseudo_selectors;
  }
}

export class PseudoProperty extends $CustomType {
  constructor(pseudo_selector, properties) {
    super();
    this.pseudo_selector = pseudo_selector;
    this.properties = properties;
  }
}

export class ComputedClass extends $CustomType {
  constructor(class_def, medias_def, selectors_def, name) {
    super();
    this.class_def = class_def;
    this.medias_def = medias_def;
    this.selectors_def = selectors_def;
    this.name = name;
  }
}

export function persistent() {
  return new PersistentCache($dict.new$(), 0);
}

export function ephemeral() {
  return new EphemeralCache($dict.new$());
}

function compute_property(indent, key, value, important) {
  let base_indent = $sketch_string.indent(indent);
  let important_ = (() => {
    if (important) {
      return " !important";
    } else {
      return "";
    }
  })();
  return ((((base_indent + key) + ": ") + value) + important_) + ";";
}

function init_computed_properties(indent) {
  return new ComputedProperties(toList([]), toList([]), toList([]), indent);
}

function merge_computed_properties(target, argument) {
  return new ComputedProperties(
    $list.append(argument.properties, target.properties),
    $list.append(argument.medias, target.medias),
    $list.append(argument.pseudo_selectors, target.pseudo_selectors),
    target.indent,
  );
}

function handle_property(props, style) {
  if (!(style instanceof Property)) {
    throw makeError(
      "let_assert",
      "sketch/internals/style",
      133,
      "handle_property",
      "Pattern match failed, no pattern matched the value.",
      { value: style }
    )
  }
  let key = style.key;
  let value = style.value;
  let important = style.important;
  let css_property = compute_property(props.indent, key, value, important);
  let properties = listPrepend(css_property, props.properties);
  return props.withFields({ properties: properties });
}

function wrap_pseudo_selectors(id, indent, pseudo_selectors) {
  return $list.map(
    pseudo_selectors,
    (p) => {
      return $sketch_string.wrap_class(
        id,
        p.properties,
        indent,
        new Some(p.pseudo_selector),
      );
    },
  );
}

export function compute_classes(class_name, computed_properties) {
  let properties = computed_properties.properties;
  let medias = computed_properties.medias;
  let pseudo_selectors = computed_properties.pseudo_selectors;
  let class_def = $sketch_string.wrap_class(
    class_name,
    properties,
    0,
    new None(),
  );
  let medias_def = $list.map(
    medias,
    (_use0) => {
      let query = _use0.query;
      let properties$1 = _use0.properties;
      let pseudo_selectors$1 = _use0.pseudo_selectors;
      let selectors_def = wrap_pseudo_selectors(
        class_name,
        2,
        pseudo_selectors$1,
      );
      let _pipe = toList([
        query + " {",
        $sketch_string.wrap_class(class_name, properties$1, 2, new None()),
      ]);
      let _pipe$1 = ((_capture) => {
        return $list.prepend(toList([selectors_def, toList(["}"])]), _capture);
      })(_pipe);
      let _pipe$2 = $list.flatten(_pipe$1);
      return $string.join(_pipe$2, "\n");
    },
  );
  let selectors_def = wrap_pseudo_selectors(class_name, 0, pseudo_selectors);
  let name = class_name;
  return new ComputedClass(class_def, medias_def, selectors_def, name);
}

export function class$(styles) {
  let string_representation = $string.inspect(styles);
  return new Class(string_representation, styles);
}

function render_cache_dict(cache) {
  let _pipe = $dict.values(cache);
  let _pipe$1 = $list.flat_map(
    _pipe,
    (c) => { return $class.definitions(c[0]); },
  );
  return $string.join(_pipe$1, "\n\n");
}

export function render(cache) {
  if (cache instanceof EphemeralCache) {
    let cache$1 = cache.cache;
    return render_cache_dict(cache$1);
  } else {
    let cache$1 = cache.cache;
    return render_cache_dict(cache$1);
  }
}

function handle_media(cache, props, style) {
  if (!(style instanceof Media)) {
    throw makeError(
      "let_assert",
      "sketch/internals/style",
      140,
      "handle_media",
      "Pattern match failed, no pattern matched the value.",
      { value: style }
    )
  }
  let query = style.query;
  let styles = style.styles;
  let $ = compute_properties(cache, styles, props.indent + 2);
  let cache$1 = $[0];
  let computed_props = $[1];
  let _pipe = new MediaProperty(
    query,
    computed_props.properties,
    computed_props.pseudo_selectors,
  );
  let _pipe$1 = ((_capture) => { return $list.prepend(props.medias, _capture); })(
    _pipe,
  );
  let _pipe$2 = ((m) => { return props.withFields({ medias: m }); })(_pipe$1);
  return ((_capture) => { return $pair.new$(cache$1, _capture); })(_pipe$2);
}

export function compute_properties(cache, properties, indent) {
  let init = init_computed_properties(indent);
  return $list.fold(
    $list.reverse(properties),
    [cache, init],
    (_use0, prop) => {
      let cache$1 = _use0[0];
      let acc = _use0[1];
      if (prop instanceof NoStyle) {
        return [cache$1, acc];
      } else if (prop instanceof Property) {
        return [cache$1, handle_property(acc, prop)];
      } else if (prop instanceof Media) {
        return handle_media(cache$1, acc, prop);
      } else if (prop instanceof PseudoSelector) {
        return handle_pseudo_selector(cache$1, acc, prop);
      } else {
        let class$1 = prop.class_name;
        let $ = $dict.get(cache$1.cache, class$1.string_representation);
        if ($.isOk()) {
          let props = $[0][1];
          return [cache$1, merge_computed_properties(acc, props)];
        } else {
          let _pipe = compute_properties(cache$1, class$1.content, indent);
          return $pair.map_second(
            _pipe,
            (_capture) => { return merge_computed_properties(acc, _capture); },
          );
        }
      }
    },
  );
}

function handle_pseudo_selector(cache, props, style) {
  if (!(style instanceof PseudoSelector)) {
    throw makeError(
      "let_assert",
      "sketch/internals/style",
      154,
      "handle_pseudo_selector",
      "Pattern match failed, no pattern matched the value.",
      { value: style }
    )
  }
  let pseudo_selector = style.pseudo_selector;
  let styles = style.styles;
  let $ = compute_properties(cache, styles, props.indent + 2);
  let cache$1 = $[0];
  let computed_props = $[1];
  let _pipe = new PseudoProperty(pseudo_selector, computed_props.properties);
  let _pipe$1 = ((_capture) => {
    return $list.prepend(computed_props.pseudo_selectors, _capture);
  })(_pipe);
  let _pipe$2 = $list.append(_pipe$1, props.pseudo_selectors);
  let _pipe$3 = ((p) => { return props.withFields({ pseudo_selectors: p }); })(
    _pipe$2,
  );
  return ((_capture) => { return $pair.new$(cache$1, _capture); })(_pipe$3);
}

export function compute_class(cache, class$) {
  let string_representation = class$.string_representation;
  let content = class$.content;
  let $ = compute_properties(cache, content, 2);
  let cache$1 = $[0];
  let properties = $[1];
  let class_id = (() => {
    if (cache$1 instanceof EphemeralCache) {
      return xx_hash32(string_representation);
    } else {
      let cid = cache$1.current_id;
      return cid;
    }
  })();
  let class_name$1 = "css-" + $int.to_string(class_id);
  let _pipe = compute_classes(class_name$1, properties);
  let _pipe$1 = ((c) => {
    return $class.create(
      c.name,
      class_id,
      new None(),
      new $class.Definitions(c.medias_def, c.selectors_def, c.class_def),
    );
  })(_pipe);
  return ((class$) => {
    let c = $dict.insert(
      cache$1.cache,
      string_representation,
      [class$, properties],
    );
    let _pipe$2 = (() => {
      if (cache$1 instanceof EphemeralCache) {
        return new EphemeralCache(c);
      } else {
        return new PersistentCache(c, class_id + 1);
      }
    })();
    return $pair.new$(_pipe$2, class$);
  })(_pipe$1);
}

export function class_name(class$, cache) {
  let s = class$.string_representation;
  let c = class$.content;
  return $bool.guard(
    $list.is_empty(c),
    [cache, ""],
    () => {
      let $ = $dict.get(cache.cache, s);
      if ($.isOk()) {
        let content = $[0][0];
        return [cache, $class.class_name(content)];
      } else {
        let _pipe = compute_class(cache, class$);
        return $pair.map_second(_pipe, $class.class_name);
      }
    },
  );
}
