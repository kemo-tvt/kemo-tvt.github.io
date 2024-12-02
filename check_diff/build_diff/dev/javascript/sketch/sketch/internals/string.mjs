import * as $option from "../../../gleam_stdlib/gleam/option.mjs";
import * as $string from "../../../gleam_stdlib/gleam/string.mjs";
import { prepend as listPrepend } from "../../gleam.mjs";

export function indent(indent) {
  return $string.repeat(" ", indent);
}

export function wrap_class(id, properties, idt, pseudo) {
  let base_indent = indent(idt);
  let pseudo_ = $option.unwrap(pseudo, "");
  let _pipe = listPrepend(
    (((base_indent + ".") + id) + pseudo_) + " {",
    properties,
  );
  let _pipe$1 = $string.join(_pipe, "\n");
  return $string.append(_pipe$1, ("\n" + base_indent) + "}");
}
