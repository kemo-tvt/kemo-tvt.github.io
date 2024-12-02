import * as $process from "../../../../gleam_erlang/gleam/erlang/process.mjs";
import * as $actor from "../../../../gleam_otp/gleam/otp/actor.mjs";
import * as $bool from "../../../../gleam_stdlib/gleam/bool.mjs";
import * as $list from "../../../../gleam_stdlib/gleam/list.mjs";
import * as $pair from "../../../../gleam_stdlib/gleam/pair.mjs";
import * as $result from "../../../../gleam_stdlib/gleam/result.mjs";
import { CustomType as $CustomType } from "../../../gleam.mjs";
import * as $error from "../../../sketch/error.mjs";
import * as $state from "../../../sketch/internals/cache/state.mjs";
import * as $style from "../../../sketch/internals/style.mjs";

class PersistentCache extends $CustomType {
  constructor(subject) {
    super();
    this.subject = subject;
  }
}

class EphemeralCache extends $CustomType {
  constructor(cache) {
    super();
    this.cache = cache;
  }
}
