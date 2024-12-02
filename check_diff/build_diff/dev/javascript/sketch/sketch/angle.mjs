import * as $float from "../../gleam_stdlib/gleam/float.mjs";
import { CustomType as $CustomType } from "../gleam.mjs";

class Deg extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Rad extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Grad extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class Turn extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

export function deg(value) {
  return new Deg(value);
}

export function rad(value) {
  return new Rad(value);
}

export function grad(value) {
  return new Grad(value);
}

export function turn(value) {
  return new Turn(value);
}

export function to_string(angle) {
  if (angle instanceof Deg) {
    let value = angle[0];
    return $float.to_string(value) + "deg";
  } else if (angle instanceof Rad) {
    let value = angle[0];
    return $float.to_string(value) + "rad";
  } else if (angle instanceof Grad) {
    let value = angle[0];
    return $float.to_string(value) + "grad";
  } else {
    let value = angle[0];
    return $float.to_string(value) + "turn";
  }
}
