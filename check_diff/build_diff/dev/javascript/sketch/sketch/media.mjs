import * as $string from "../../gleam_stdlib/gleam/string.mjs";
import { toList, CustomType as $CustomType } from "../gleam.mjs";
import * as $size from "../sketch/size.mjs";
import { to_string as to_str } from "../sketch/size.mjs";

class Dark extends $CustomType {}

class Light extends $CustomType {}

class MaxWidth extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class MinWidth extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class MaxHeight extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class MinHeight extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class ColorScheme extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class And extends $CustomType {
  constructor(x0, x1) {
    super();
    this[0] = x0;
    this[1] = x1;
  }
}

class Or extends $CustomType {
  constructor(x0, x1) {
    super();
    this[0] = x0;
    this[1] = x1;
  }
}

class Not extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Orientation extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

export function dark_theme() {
  return new ColorScheme(new Dark());
}

export function light_theme() {
  return new ColorScheme(new Light());
}

export function max_width(size) {
  return new MaxWidth(size);
}

export function min_width(size) {
  return new MinWidth(size);
}

export function max_height(size) {
  return new MaxHeight(size);
}

export function min_height(size) {
  return new MinHeight(size);
}

export function and(first, second) {
  return new And(first, second);
}

export function or(first, second) {
  return new Or(first, second);
}

export function not(query) {
  return new Not(query);
}

export function landscape() {
  return new Orientation("landscape");
}

export function portrait() {
  return new Orientation("portrait");
}

function q_to_str(query) {
  if (query instanceof ColorScheme && query[0] instanceof Dark) {
    return "(prefers-color-scheme: dark)";
  } else if (query instanceof ColorScheme && query[0] instanceof Light) {
    return "(prefers-color-scheme: light)";
  } else if (query instanceof MaxWidth) {
    let s = query[0];
    return $string.join(toList(["(max-width: ", to_str(s), ")"]), "");
  } else if (query instanceof MinWidth) {
    let s = query[0];
    return $string.join(toList(["(min-width: ", to_str(s), ")"]), "");
  } else if (query instanceof MaxHeight) {
    let s = query[0];
    return $string.join(toList(["(max-height: ", to_str(s), ")"]), "");
  } else if (query instanceof MinHeight) {
    let s = query[0];
    return $string.join(toList(["(min-height: ", to_str(s), ")"]), "");
  } else if (query instanceof Orientation) {
    let o = query[0];
    return $string.join(toList(["(orientation: ", o, ")"]), "");
  } else if (query instanceof Not) {
    let q = query[0];
    return $string.append("not ", q_to_str(q));
  } else if (query instanceof And) {
    let fst = query[0];
    let snd = query[1];
    return $string.join(toList([q_to_str(fst), "and", q_to_str(snd)]), " ");
  } else {
    let fst = query[0];
    let snd = query[1];
    return $string.join(toList([q_to_str(fst), "or", q_to_str(snd)]), " ");
  }
}

export function to_string(query) {
  let content = q_to_str(query);
  return $string.append("@media ", content);
}
