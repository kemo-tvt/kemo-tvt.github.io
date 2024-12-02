import * as $process from "../../../../gleam_erlang/gleam/erlang/process.mjs";
import * as $actor from "../../../../gleam_otp/gleam/otp/actor.mjs";
import { CustomType as $CustomType } from "../../../gleam.mjs";
import * as $style from "../../../sketch/internals/style.mjs";

export class Render extends $CustomType {
  constructor(stylesheet) {
    super();
    this.stylesheet = stylesheet;
  }
}

export class Fetch extends $CustomType {
  constructor(styles, subject) {
    super();
    this.styles = styles;
    this.subject = subject;
  }
}
