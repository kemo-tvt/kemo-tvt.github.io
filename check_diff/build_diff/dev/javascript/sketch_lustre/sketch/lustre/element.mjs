import * as $list from "../../../gleam_stdlib/gleam/list.mjs";
import * as $option from "../../../gleam_stdlib/gleam/option.mjs";
import * as $pair from "../../../gleam_stdlib/gleam/pair.mjs";
import * as $attribute from "../../../lustre/lustre/attribute.mjs";
import * as $el from "../../../lustre/lustre/element.mjs";
import * as $vdom from "../../../lustre/lustre/internals/vdom.mjs";
import * as $sketch from "../../../sketch/sketch.mjs";
import { toList, prepend as listPrepend, CustomType as $CustomType } from "../../gleam.mjs";

class Nothing extends $CustomType {}

class Text extends $CustomType {
  constructor(content) {
    super();
    this.content = content;
  }
}

class Map extends $CustomType {
  constructor(subtree) {
    super();
    this.subtree = subtree;
  }
}

class Element extends $CustomType {
  constructor(key, namespace, tag, class$, attributes, children) {
    super();
    this.key = key;
    this.namespace = namespace;
    this.tag = tag;
    this.class = class$;
    this.attributes = attributes;
    this.children = children;
  }
}

export function none() {
  return new Nothing();
}

export function text(content) {
  return new Text(content);
}

export function element(tag, class$, attributes, children) {
  let class$1 = new $option.Some(class$);
  return new Element("", "", tag, class$1, attributes, children);
}

export function element_(tag, attributes, children) {
  return new Element("", "", tag, new $option.None(), attributes, children);
}

export function namespaced(namespace, tag, class$, attributes, children) {
  let class$1 = new $option.Some(class$);
  return new Element("", namespace, tag, class$1, attributes, children);
}

export function namespaced_(namespace, tag, attributes, children) {
  return new Element(
    "",
    namespace,
    tag,
    new $option.None(),
    attributes,
    children,
  );
}

export function fragment(children) {
  let attrs = toList([$attribute.style(toList([["display", "contents"]]))]);
  return new Element(
    "",
    "",
    "lustre-fragment",
    new $option.None(),
    attrs,
    children,
  );
}

function do_keyed(element, key) {
  if (element instanceof Nothing) {
    return new Nothing();
  } else if (element instanceof Text) {
    let content = element.content;
    return new Text(content);
  } else if (element instanceof Map) {
    let subtree = element.subtree;
    return new Map(() => { return do_keyed(subtree(), key); });
  } else {
    let namespace = element.namespace;
    let tag = element.tag;
    let attributes = element.class;
    let children = element.attributes;
    let styles = element.children;
    return new Element(key, namespace, tag, attributes, children, styles);
  }
}

export function keyed(element, children) {
  return element(
    $list.map(
      children,
      (_use0) => {
        let key = _use0[0];
        let child = _use0[1];
        return do_keyed(child, key);
      },
    ),
  );
}

export function map(element, mapper) {
  if (element instanceof Nothing) {
    return new Nothing();
  } else if (element instanceof Text) {
    let content = element.content;
    return new Text(content);
  } else if (element instanceof Map) {
    let subtree = element.subtree;
    return new Map(() => { return map(subtree(), mapper); });
  } else {
    let key = element.key;
    let namespace = element.namespace;
    let tag = element.tag;
    let class$ = element.class;
    let attributes = element.attributes;
    let children = element.children;
    let attributes$1 = $list.map(
      attributes,
      (_capture) => { return $attribute.map(_capture, mapper); },
    );
    let children$1 = $list.map(
      children,
      (_capture) => { return map(_capture, mapper); },
    );
    return new Element(key, namespace, tag, class$, attributes$1, children$1);
  }
}

export function styled(element) {
  if (element instanceof $vdom.Map) {
    let subtree = element.subtree;
    return new Map(() => { return styled(subtree()); });
  } else if (element instanceof $vdom.Text) {
    let content = element.content;
    return new Text(content);
  } else {
    let key = element.key;
    let namespace = element.namespace;
    let tag = element.tag;
    let attrs = element.attrs;
    let children = element.children;
    let class$ = new $option.None();
    return new Element(
      key,
      namespace,
      tag,
      class$,
      attrs,
      $list.map(children, styled),
    );
  }
}

function unstyled_children(cache, children) {
  return $list.fold(
    $list.reverse(children),
    [cache, toList([])],
    (acc, child) => {
      let cache$1 = acc[0];
      let children$1 = acc[1];
      let $ = unstyled(cache$1, child);
      let cache$2 = $[0];
      let child$1 = $[1];
      return [cache$2, listPrepend(child$1, children$1)];
    },
  );
}

export function unstyled(loop$cache, loop$element) {
  while (true) {
    let cache = loop$cache;
    let element = loop$element;
    if (element instanceof Nothing) {
      return [cache, $el.none()];
    } else if (element instanceof Text) {
      let content = element.content;
      return [cache, $el.text(content)];
    } else if (element instanceof Map) {
      let subtree = element.subtree;
      loop$cache = cache;
      loop$element = subtree();
    } else {
      let key = element.key;
      let namespace = element.namespace;
      let tag = element.tag;
      let class$ = element.class;
      let attributes = element.attributes;
      let children = element.children;
      let class$1 = $option.map(
        class$,
        (_capture) => { return $sketch.class_name(_capture, cache); },
      );
      let class_name = $option.map(class$1, $pair.second);
      let cache$1 = (() => {
        let _pipe = $option.map(class$1, $pair.first);
        return $option.unwrap(_pipe, cache);
      })();
      let $ = unstyled_children(cache$1, children);
      let cache$2 = $[0];
      let children$1 = $[1];
      let attributes$1 = (() => {
        if (class_name instanceof $option.None) {
          return attributes;
        } else {
          let class_name$1 = class_name[0];
          let class_name$2 = $attribute.class$(class_name$1);
          return listPrepend(class_name$2, attributes);
        }
      })();
      return [
        cache$2,
        (() => {
          let $1 = $el.element(tag, attributes$1, children$1);
          if ($1 instanceof $vdom.Element) {
            let t = $1.tag;
            let a = $1.attrs;
            let c = $1.children;
            let s = $1.self_closing;
            let v = $1.void;
            return new $vdom.Element(key, namespace, t, a, c, s, v);
          } else {
            let e = $1;
            return e;
          }
        })(),
      ];
    }
  }
}
