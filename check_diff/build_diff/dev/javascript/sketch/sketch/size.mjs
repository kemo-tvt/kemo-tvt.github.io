import * as $float from "../../gleam_stdlib/gleam/float.mjs";
import * as $int from "../../gleam_stdlib/gleam/int.mjs";
import * as $string from "../../gleam_stdlib/gleam/string.mjs";
import { CustomType as $CustomType } from "../gleam.mjs";

class Px extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Pt extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Vh extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Vw extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Em extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Rem extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Lh extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Rlh extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Ch extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Pct extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

export function px(value) {
  return new Px($int.to_float(value));
}

export function px_(value) {
  return new Px(value);
}

export function pt(value) {
  return new Pt($int.to_float(value));
}

export function pt_(value) {
  return new Pt(value);
}

export function percent(value) {
  return new Pct($int.to_float(value));
}

export function percent_(value) {
  return new Pct(value);
}

export function vh(value) {
  return new Vh($int.to_float(value));
}

export function vh_(value) {
  return new Vh(value);
}

export function vw(value) {
  return new Vw($int.to_float(value));
}

export function vw_(value) {
  return new Vw(value);
}

export function em(value) {
  return new Em(value);
}

export function rem(value) {
  return new Rem(value);
}

export function lh(value) {
  return new Lh(value);
}

export function rlh(value) {
  return new Rlh(value);
}

export function ch(value) {
  return new Ch($int.to_float(value));
}

export function ch_(value) {
  return new Ch(value);
}

export function to_string(size) {
  if (size instanceof Px) {
    let value = size[0];
    return $string.append($float.to_string(value), "px");
  } else if (size instanceof Pt) {
    let value = size[0];
    return $string.append($float.to_string(value), "pt");
  } else if (size instanceof Pct) {
    let value = size[0];
    return $string.append($float.to_string(value), "%");
  } else if (size instanceof Vh) {
    let value = size[0];
    return $string.append($float.to_string(value), "vh");
  } else if (size instanceof Vw) {
    let value = size[0];
    return $string.append($float.to_string(value), "vw");
  } else if (size instanceof Em) {
    let value = size[0];
    return $string.append($float.to_string(value), "em");
  } else if (size instanceof Rem) {
    let value = size[0];
    return $string.append($float.to_string(value), "rem");
  } else if (size instanceof Lh) {
    let value = size[0];
    return $string.append($float.to_string(value), "lh");
  } else if (size instanceof Rlh) {
    let value = size[0];
    return $string.append($float.to_string(value), "rlh");
  } else {
    let value = size[0];
    return $string.append($float.to_string(value), "ch");
  }
}
