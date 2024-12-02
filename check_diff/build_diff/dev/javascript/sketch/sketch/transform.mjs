import * as $float from "../../gleam_stdlib/gleam/float.mjs";
import * as $list from "../../gleam_stdlib/gleam/list.mjs";
import * as $string from "../../gleam_stdlib/gleam/string.mjs";
import { toList, CustomType as $CustomType } from "../gleam.mjs";
import * as $angle from "../sketch/angle.mjs";
import * as $size from "../sketch/size.mjs";

class Translate extends $CustomType {
  constructor(x0, x1) {
    super();
    this[0] = x0;
    this[1] = x1;
  }
}

class TranslateX extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class TranslateY extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Scale extends $CustomType {
  constructor(x0, x1) {
    super();
    this[0] = x0;
    this[1] = x1;
  }
}

class ScaleX extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class ScaleY extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Rotate extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class SkewX extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class SkewY extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

function transform_to_string(value) {
  if (value instanceof Translate) {
    let x = value[0];
    let y = value[1];
    return ("translate(" + $string.join(
      toList([$size.to_string(x), $size.to_string(y)]),
      ",",
    )) + ")";
  } else if (value instanceof TranslateX) {
    let x = value[0];
    return ("translateX(" + $size.to_string(x)) + ")";
  } else if (value instanceof TranslateY) {
    let y = value[0];
    return ("translateY(" + $size.to_string(y)) + ")";
  } else if (value instanceof Scale) {
    let x = value[0];
    let y = value[1];
    return ("scale(" + $string.join(
      toList([$float.to_string(x), $float.to_string(y)]),
      ",",
    )) + ")";
  } else if (value instanceof ScaleX) {
    let x = value[0];
    return ("scaleX(" + $float.to_string(x)) + ")";
  } else if (value instanceof ScaleY) {
    let y = value[0];
    return ("scaleY(" + $float.to_string(y)) + ")";
  } else if (value instanceof Rotate) {
    let ang = value[0];
    return ("rotate(" + $angle.to_string(ang)) + ")";
  } else if (value instanceof SkewX) {
    let x = value[0];
    return ("skewX(" + $angle.to_string(x)) + ")";
  } else {
    let y = value[0];
    return ("skewY(" + $angle.to_string(y)) + ")";
  }
}

export function translate2(x, y) {
  return new Translate(x, y);
}

export function translate(x) {
  return translate2(x, $size.percent(0));
}

export function translate_x(x) {
  return new TranslateX(x);
}

export function translate_y(y) {
  return new TranslateY(y);
}

export function scale2(x, y) {
  return new Scale(x, y);
}

export function scale(x) {
  return scale2(x, x);
}

export function scale_x(x) {
  return new ScaleX(x);
}

export function scale_y(y) {
  return new ScaleY(y);
}

export function rotate(value) {
  return new Rotate(value);
}

export function skew_x(x) {
  return new SkewX(x);
}

export function skew_y(x) {
  return new SkewY(x);
}

export function to_string(value) {
  if (value.hasLength(0)) {
    return "none";
  } else {
    let transform_list = value;
    let _pipe = $list.map(transform_list, transform_to_string);
    return $string.join(_pipe, " ");
  }
}
