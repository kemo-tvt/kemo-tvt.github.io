import * as $dynamic from "../../gleam_stdlib/gleam/dynamic.mjs";
import * as $list from "../../gleam_stdlib/gleam/list.mjs";
import * as $el from "../../lustre/lustre/element.mjs";
import * as $html from "../../lustre/lustre/element/html.mjs";
import * as $vdom from "../../lustre/lustre/internals/vdom.mjs";
import * as $shadow from "../../plinth/plinth/browser/shadow.mjs";
import * as $sketch from "../../sketch/sketch.mjs";
import { toList, prepend as listPrepend, CustomType as $CustomType } from "../gleam.mjs";
import * as $ffi from "../sketch/internals/ffi.mjs";
import * as $element from "../sketch/lustre/element.mjs";

class Node extends $CustomType {}

class Document extends $CustomType {}

class Shadow extends $CustomType {
  constructor(root) {
    super();
    this.root = root;
  }
}

class Options extends $CustomType {
  constructor(stylesheet) {
    super();
    this.stylesheet = stylesheet;
  }
}

class CssStyleSheet extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class NodeStyleSheet extends $CustomType {}

function to_stylesheet(options) {
  if (options instanceof Options && options.stylesheet instanceof Node) {
    return new NodeStyleSheet();
  } else if (options instanceof Options &&
  options.stylesheet instanceof Document) {
    return new CssStyleSheet($ffi.create_document_stylesheet());
  } else {
    let root = options.stylesheet.root;
    return new CssStyleSheet($ffi.create_shadow_root_stylesheet(root));
  }
}

function render_stylesheet(content, node, stylesheet) {
  if (stylesheet instanceof NodeStyleSheet) {
    if (node instanceof $vdom.Element && node.tag === "lustre-fragment") {
      let children = node.children;
      return $el.fragment(
        listPrepend(
          $el.element("style", toList([]), toList([$el.text(content)])),
          children,
        ),
      );
    } else {
      return $el.fragment(
        toList([
          $el.element("style", toList([]), toList([$el.text(content)])),
          node,
        ]),
      );
    }
  } else {
    let stylesheet$1 = stylesheet[0];
    $ffi.set_stylesheet(content, stylesheet$1);
    return node;
  }
}

export function compose(options, view, cache) {
  let cache$1 = $ffi.wrap(cache);
  let stylesheet = to_stylesheet(options);
  return (model) => {
    let node$1 = view(model);
    let $ = $element.unstyled($ffi.get(cache$1), node$1);
    let result = $[0];
    let node$2 = $[1];
    let content = $sketch.render(result);
    $ffi.set(cache$1, result);
    return render_stylesheet(content, node$2, stylesheet);
  };
}

function contains_head(el) {
  if (el instanceof $vdom.Element && el.tag === "head") {
    return true;
  } else if (el instanceof $vdom.Element) {
    let children = el.children;
    return $list.fold(
      children,
      false,
      (acc, val) => { return acc || contains_head(val); },
    );
  } else {
    return false;
  }
}

function put_in_head(el, content) {
  if (el instanceof $vdom.Element && el.tag === "head") {
    let k = el.key;
    let n = el.namespace;
    let a = el.attrs;
    let children = el.children;
    let s = el.self_closing;
    let v = el.void;
    let _pipe = children;
    let _pipe$1 = $list.append(
      _pipe,
      toList([$html.style(toList([]), content)]),
    );
    return ((_capture) => {
      return new $vdom.Element(k, n, "head", a, _capture, s, v);
    })(_pipe$1);
  } else if (el instanceof $vdom.Element && el.tag === "html") {
    let k = el.key;
    let n = el.namespace;
    let a = el.attrs;
    let children = el.children;
    let s = el.self_closing;
    let v = el.void;
    let _pipe = children;
    let _pipe$1 = $list.map(
      _pipe,
      (child) => { return put_in_head(child, content); },
    );
    return ((_capture) => {
      return new $vdom.Element(k, n, "html", a, _capture, s, v);
    })(_pipe$1);
  } else {
    let node$1 = el;
    return node$1;
  }
}

export function node() {
  return new Options(new Node());
}

export function document() {
  return new Options(new Document());
}

export function shadow(root) {
  return new Options(new Shadow(root));
}
