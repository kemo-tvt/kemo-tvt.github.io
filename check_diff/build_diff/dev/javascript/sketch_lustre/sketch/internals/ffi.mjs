import * as $dynamic from "../../../gleam_stdlib/gleam/dynamic.mjs";
import * as $shadow from "../../../plinth/plinth/browser/shadow.mjs";
import { CustomType as $CustomType } from "../../gleam.mjs";
import {
  wrap,
  set,
  get,
  createCssStyleSheet as create_document_stylesheet,
  createCssStyleSheet as create_shadow_root_stylesheet,
  setStylesheet as set_stylesheet,
} from "../../sketch_lustre.ffi.mjs";

export {
  create_document_stylesheet,
  create_shadow_root_stylesheet,
  get,
  set,
  set_stylesheet,
  wrap,
};

class Mutable extends $CustomType {
  constructor(value) {
    super();
    this.value = value;
  }
}
