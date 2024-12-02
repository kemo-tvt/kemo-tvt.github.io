import * as $list from "../../../gleam_stdlib/gleam/list.mjs";
import * as $option from "../../../gleam_stdlib/gleam/option.mjs";
import { None, Some } from "../../../gleam_stdlib/gleam/option.mjs";
import { toList, CustomType as $CustomType } from "../../gleam.mjs";

export class Definitions extends $CustomType {
  constructor(medias_def, selectors_def, class_def) {
    super();
    this.medias_def = medias_def;
    this.selectors_def = selectors_def;
    this.class_def = class_def;
  }
}

class Content extends $CustomType {
  constructor(class_name, class_id, definitions, rules) {
    super();
    this.class_name = class_name;
    this.class_id = class_id;
    this.definitions = definitions;
    this.rules = rules;
  }
}

export function no_class() {
  let defs = new Definitions(toList([]), toList([]), "");
  return new Content("", -1, defs, new None());
}

export function class_id(class$) {
  return class$.class_id;
}

export function class_name(class$) {
  return class$.class_name;
}

export function rules(class$) {
  return class$.rules;
}

export function definitions(class$) {
  let $ = class$.definitions;
  let medias = $.medias_def;
  let selectors = $.selectors_def;
  let class$1 = $.class_def;
  let _pipe = toList([toList([class$1]), selectors, medias]);
  return $list.flatten(_pipe);
}

export function set_rules(class$, rules) {
  return class$.withFields({ rules: new Some(rules) });
}

export function create(class_name, class_id, rules, definitions) {
  return new Content(class_name, class_id, definitions, rules);
}
