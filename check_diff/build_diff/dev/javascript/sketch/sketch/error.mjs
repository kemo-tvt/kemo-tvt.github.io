import * as $actor from "../../gleam_otp/gleam/otp/actor.mjs";
import { CustomType as $CustomType } from "../gleam.mjs";

export class NotABrowser extends $CustomType {}

export class OtpError extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}
