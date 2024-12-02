import * as $array from "../gleam_javascript/gleam/javascript/array.mjs";
import * as $dynamic from "../gleam_stdlib/gleam/dynamic.mjs";
import * as $list from "../gleam_stdlib/gleam/list.mjs";
import * as $option from "../gleam_stdlib/gleam/option.mjs";
import { None, Some } from "../gleam_stdlib/gleam/option.mjs";
import * as $result from "../gleam_stdlib/gleam/result.mjs";
import * as $lustre from "../lustre/lustre.mjs";
import * as $attribute from "../lustre/lustre/attribute.mjs";
import * as $effect from "../lustre/lustre/effect.mjs";
import * as $event from "../lustre/lustre/event.mjs";
import * as $sketch from "../sketch/sketch.mjs";
import * as $size from "../sketch/sketch/size.mjs";
import * as $sketch_lustre from "../sketch_lustre/sketch/lustre.mjs";
import * as $element from "../sketch_lustre/sketch/lustre/element.mjs";
import * as $html from "../sketch_lustre/sketch/lustre/element/html.mjs";
import { toList, prepend as listPrepend, CustomType as $CustomType, makeError } from "./gleam.mjs";
import {
  read_local_storage as do_read_localstorage,
  write_local_storage as do_write_localstorage,
} from "./storage.ffi.ts";

class Model extends $CustomType {
  constructor(to_do, in_progress, done, new_task_input) {
    super();
    this.to_do = to_do;
    this.in_progress = in_progress;
    this.done = done;
    this.new_task_input = new_task_input;
  }
}

class UpdateNewTask extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class AddTask extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

class DeleteTask extends $CustomType {
  constructor(x0, x1) {
    super();
    this[0] = x0;
    this[1] = x1;
  }
}

class CacheUpdatedMessage extends $CustomType {
  constructor(x0) {
    super();
    this[0] = x0;
  }
}

function read_localstorage(key) {
  return $effect.from(
    (dispatch) => {
      let _pipe = do_read_localstorage(key);
      let _pipe$1 = new CacheUpdatedMessage(_pipe);
      return dispatch(_pipe$1);
    },
  );
}

function write_localstorage(key, value) {
  return $effect.from((_) => { return do_write_localstorage(key, value); });
}

function init(_) {
  return [
    new Model(
      new Some(toList([])),
      new Some(toList([])),
      new Some(toList([])),
      "",
    ),
    read_localstorage("kanban"),
  ];
}

function update(model, msg) {
  if (msg instanceof CacheUpdatedMessage && msg[0].isOk()) {
    let kanban = msg[0][0];
    return [
      model.withFields({
        to_do: new Some(
          (() => {
            let _pipe = kanban;
            let _pipe$1 = $array.get(_pipe, 0);
            let _pipe$2 = $result.lazy_unwrap(
              _pipe$1,
              () => { return $array.from_list(toList([])); },
            );
            return $array.to_list(_pipe$2);
          })(),
        ),
        in_progress: new Some(
          (() => {
            let _pipe = kanban;
            let _pipe$1 = $array.get(_pipe, 1);
            let _pipe$2 = $result.lazy_unwrap(
              _pipe$1,
              () => { return $array.from_list(toList([])); },
            );
            return $array.to_list(_pipe$2);
          })(),
        ),
        done: new Some(
          (() => {
            let _pipe = kanban;
            let _pipe$1 = $array.get(_pipe, 2);
            let _pipe$2 = $result.lazy_unwrap(
              _pipe$1,
              () => { return $array.from_list(toList([])); },
            );
            return $array.to_list(_pipe$2);
          })(),
        )
      }),
      $effect.none(),
    ];
  } else if (msg instanceof CacheUpdatedMessage && !msg[0].isOk()) {
    return [model, $effect.none()];
  } else if (msg instanceof UpdateNewTask) {
    let value = msg[0];
    return [model.withFields({ new_task_input: value }), $effect.none()];
  } else if (msg instanceof DeleteTask) {
    let kanban_block$1 = msg[0];
    let task$1 = msg[1];
    if (kanban_block$1 === "todo") {
      let tasks = (() => {
        let _pipe = model.to_do;
        let _pipe$1 = $option.lazy_unwrap(_pipe, () => { return toList([]); });
        return $list.filter(_pipe$1, (t) => { return t !== task$1; });
      })();
      let added_tasks = (() => {
        let _pipe = toList([new Some(tasks), model.in_progress, model.done]);
        let _pipe$1 = $list.map(
          _pipe,
          (x) => {
            let _pipe$1 = $option.lazy_unwrap(x, () => { return toList([""]); });
            return $array.from_list(_pipe$1);
          },
        );
        return $array.from_list(_pipe$1);
      })();
      return [
        model.withFields({ to_do: new Some(tasks) }),
        write_localstorage("kanban", added_tasks),
      ];
    } else if (kanban_block$1 === "in_progress") {
      let tasks = (() => {
        let _pipe = model.in_progress;
        let _pipe$1 = $option.lazy_unwrap(_pipe, () => { return toList([]); });
        return $list.filter(_pipe$1, (t) => { return t !== task$1; });
      })();
      let added_tasks = (() => {
        let _pipe = toList([model.to_do, new Some(tasks), model.done]);
        let _pipe$1 = $list.map(
          _pipe,
          (x) => {
            let _pipe$1 = $option.lazy_unwrap(x, () => { return toList([""]); });
            return $array.from_list(_pipe$1);
          },
        );
        return $array.from_list(_pipe$1);
      })();
      return [
        model.withFields({ in_progress: new Some(tasks) }),
        write_localstorage("in_progress", added_tasks),
      ];
    } else if (kanban_block$1 === "done") {
      let tasks = (() => {
        let _pipe = model.done;
        let _pipe$1 = $option.lazy_unwrap(_pipe, () => { return toList([]); });
        return $list.filter(_pipe$1, (t) => { return t !== task$1; });
      })();
      let added_tasks = (() => {
        let _pipe = toList([model.to_do, model.in_progress, new Some(tasks)]);
        let _pipe$1 = $list.map(
          _pipe,
          (x) => {
            let _pipe$1 = $option.lazy_unwrap(x, () => { return toList([""]); });
            return $array.from_list(_pipe$1);
          },
        );
        return $array.from_list(_pipe$1);
      })();
      return [
        model.withFields({ done: new Some(tasks) }),
        write_localstorage("done", added_tasks),
      ];
    } else {
      return [model, $effect.none()];
    }
  } else {
    let kanban_block$1 = msg[0];
    if (kanban_block$1 === "todo") {
      let $ = model.new_task_input;
      if ($ === "") {
        return [model, $effect.none()];
      } else {
        let t = $;
        return [
          model.withFields({
            to_do: new Some(
              listPrepend(
                t,
                (() => {
                  let _pipe = model.to_do;
                  return $option.lazy_unwrap(
                    _pipe,
                    () => { return toList([]); },
                  );
                })(),
              ),
            ),
            new_task_input: ""
          }),
          write_localstorage(
            "kanban",
            (() => {
              let _pipe = toList([
                new Some(
                  listPrepend(
                    t,
                    (() => {
                      let _pipe = model.to_do;
                      return $option.lazy_unwrap(
                        _pipe,
                        () => { return toList([]); },
                      );
                    })(),
                  ),
                ),
                model.in_progress,
                model.done,
              ]);
              let _pipe$1 = $list.map(
                _pipe,
                (x) => {
                  let _pipe$1 = $option.lazy_unwrap(
                    x,
                    () => { return toList([""]); },
                  );
                  return $array.from_list(_pipe$1);
                },
              );
              return $array.from_list(_pipe$1);
            })(),
          ),
        ];
      }
    } else if (kanban_block$1 === "in_progress") {
      let $ = model.new_task_input;
      if ($ === "") {
        return [model, $effect.none()];
      } else {
        let t = $;
        return [
          model.withFields({
            in_progress: new Some(
              listPrepend(
                t,
                (() => {
                  let _pipe = model.in_progress;
                  return $option.lazy_unwrap(
                    _pipe,
                    () => { return toList([]); },
                  );
                })(),
              ),
            ),
            new_task_input: ""
          }),
          write_localstorage(
            "kanban",
            (() => {
              let _pipe = toList([
                model.to_do,
                new Some(
                  listPrepend(
                    t,
                    (() => {
                      let _pipe = model.in_progress;
                      return $option.lazy_unwrap(
                        _pipe,
                        () => { return toList([]); },
                      );
                    })(),
                  ),
                ),
                model.done,
              ]);
              let _pipe$1 = $list.map(
                _pipe,
                (x) => {
                  let _pipe$1 = $option.lazy_unwrap(
                    x,
                    () => { return toList([""]); },
                  );
                  return $array.from_list(_pipe$1);
                },
              );
              return $array.from_list(_pipe$1);
            })(),
          ),
        ];
      }
    } else if (kanban_block$1 === "done") {
      let $ = model.new_task_input;
      if ($ === "") {
        return [model, $effect.none()];
      } else {
        let t = $;
        return [
          model.withFields({
            done: new Some(
              listPrepend(
                t,
                (() => {
                  let _pipe = model.done;
                  return $option.lazy_unwrap(
                    _pipe,
                    () => { return toList([]); },
                  );
                })(),
              ),
            ),
            new_task_input: ""
          }),
          write_localstorage(
            "kanban",
            (() => {
              let _pipe = toList([
                model.to_do,
                model.in_progress,
                new Some(
                  listPrepend(
                    t,
                    (() => {
                      let _pipe = model.done;
                      return $option.lazy_unwrap(
                        _pipe,
                        () => { return toList([]); },
                      );
                    })(),
                  ),
                ),
              ]);
              let _pipe$1 = $list.map(
                _pipe,
                (x) => {
                  let _pipe$1 = $option.lazy_unwrap(
                    x,
                    () => { return toList([""]); },
                  );
                  return $array.from_list(_pipe$1);
                },
              );
              return $array.from_list(_pipe$1);
            })(),
          ),
        ];
      }
    } else {
      return [model, $effect.none()];
    }
  }
}

function block_title() {
  return $sketch.class$(
    toList([
      $sketch.font_size($size.rem(2.0)),
      $sketch.font_weight("bold"),
      $sketch.margin_("0 0 1.5rem 0"),
      $sketch.color("#F7F7F7"),
      $sketch.text_align("center"),
      $sketch.text_transform("uppercase"),
      $sketch.letter_spacing("0.1rem"),
    ]),
  );
}

function container() {
  return $sketch.class$(
    toList([
      $sketch.display("flex"),
      $sketch.flex_direction("column"),
      $sketch.align_items("center"),
      $sketch.margin_("auto"),
      $sketch.padding($size.rem(2.0)),
      $sketch.width($size.percent(90)),
      $sketch.max_width($size.rem(80.0)),
      $sketch.background_color("#001524"),
      $sketch.border_radius($size.rem(1.0)),
      $sketch.box_shadow("0 8px 16px rgba(0, 0, 0, 0.1)"),
    ]),
  );
}

function kanban_board_container() {
  return $sketch.class$(
    toList([
      $sketch.overflow_x("auto"),
      $sketch.white_space("nowrap"),
      $sketch.padding($size.rem(1.5)),
      $sketch.width($size.percent(100)),
    ]),
  );
}

function kanban_board() {
  return $sketch.class$(
    toList([
      $sketch.display("flex"),
      $sketch.flex_direction("row"),
      $sketch.gap($size.rem(2.5)),
    ]),
  );
}

function kanban_block() {
  return $sketch.class$(
    toList([
      $sketch.background_color("#2A3D45"),
      $sketch.padding($size.rem(2.0)),
      $sketch.width($size.rem(22.0)),
      $sketch.flex_shrink(0.0),
      $sketch.border_radius($size.rem(0.8)),
      $sketch.box_shadow("0 4px 8px rgba(0,0,0,0.1)"),
      $sketch.display("flex"),
      $sketch.flex_direction("column"),
      $sketch.gap($size.rem(1.5)),
      $sketch.hover(toList([$sketch.box_shadow("0 6px 12px rgba(0,0,0,0.15)")])),
    ]),
  );
}

function task() {
  return $sketch.class$(
    toList([
      $sketch.text_align("center"),
      $sketch.font_size($size.rem(1.5)),
      $sketch.background_color("#F7F7F7"),
      $sketch.border("0.1rem solid #ddd"),
      $sketch.border_radius($size.rem(0.4)),
      $sketch.padding($size.rem(1.0)),
      $sketch.margin_("0.5rem 0"),
      $sketch.box_shadow("0 1px 3px rgba(0,0,0,0.1)"),
      $sketch.transition("transform 0.2s ease, box-shadow 0.2s ease"),
      $sketch.hover(
        toList([
          $sketch.transform("scale(1.02)"),
          $sketch.box_shadow("0 6px 12px rgba(0,0,0,0.2)"),
        ]),
      ),
      $sketch.overflow("hidden"),
      $sketch.text_overflow("ellipsis"),
      $sketch.white_space("normal"),
      $sketch.line_height("1.8rem"),
    ]),
  );
}

function add_task_input() {
  return $sketch.class$(
    toList([
      $sketch.background_color("#F7F7F7"),
      $sketch.border("0.1rem solid #ccc"),
      $sketch.border_radius($size.rem(0.4)),
      $sketch.padding($size.rem(0.8)),
      $sketch.margin_("0.5rem 0"),
      $sketch.box_shadow("0 1px 3px rgba(0,0,0,0.1)"),
      $sketch.font_size($size.rem(1.5)),
    ]),
  );
}

function add_task_button() {
  return $sketch.class$(
    toList([
      $sketch.background_color("#4B8F6A"),
      $sketch.font_size($size.rem(1.5)),
      $sketch.color("#fff"),
      $sketch.border("none"),
      $sketch.border_radius($size.rem(0.4)),
      $sketch.padding($size.rem(0.8)),
      $sketch.margin_("0.5rem 0"),
      $sketch.text_align("center"),
      $sketch.font_weight("bold"),
      $sketch.cursor("pointer"),
      $sketch.transition("transform 0.2s ease, background-color 0.2s ease"),
      $sketch.hover(
        toList([
          $sketch.background_color("#4B8F8C"),
          $sketch.transform("scale(1.05)"),
        ]),
      ),
    ]),
  );
}

function delete_task_button() {
  return $sketch.class$(
    toList([
      $sketch.display("inline-flex"),
      $sketch.align_items("center"),
      $sketch.justify_content("center"),
      $sketch.background_color("transparent"),
      $sketch.color("#FF5C5C"),
      $sketch.border("0.1rem solid #FF5C5C"),
      $sketch.border_radius($size.rem(0.5)),
      $sketch.padding_("0.3rem 0.6rem"),
      $sketch.margin_("0 0 0 0.5rem"),
      $sketch.cursor("pointer"),
      $sketch.font_size($size.rem(1.0)),
      $sketch.font_weight("bold"),
      $sketch.transition(
        "background-color 0.3s ease, color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease",
      ),
      $sketch.box_shadow("0 2px 4px rgba(0, 0, 0, 0.1)"),
      $sketch.hover(
        toList([
          $sketch.background_color("#FF5C5C"),
          $sketch.color("#FFFFFF"),
          $sketch.box_shadow("0 4px 8px rgba(0, 0, 0, 0.2)"),
          $sketch.transform("scale(1.1)"),
        ]),
      ),
      $sketch.focus(
        toList([
          $sketch.outline("none"),
          $sketch.box_shadow("0 0 0 0.2rem rgba(255, 92, 92, 0.5)"),
        ]),
      ),
    ]),
  );
}

function view(model) {
  return $html.div(
    container(),
    toList([]),
    toList([
      $html.div(
        kanban_board_container(),
        toList([]),
        toList([
          $html.div(
            kanban_board(),
            toList([]),
            toList([
              $html.div(
                kanban_block(),
                toList([]),
                toList([
                  $html.div(
                    block_title(),
                    toList([]),
                    toList([$html.text("To Do")]),
                  ),
                  $html.input(
                    add_task_input(),
                    toList([
                      $attribute.type_("text"),
                      $attribute.value(model.new_task_input),
                      $event.on_input(
                        (var0) => { return new UpdateNewTask(var0); },
                      ),
                    ]),
                  ),
                  $html.button(
                    add_task_button(),
                    toList([$event.on_click(new AddTask("todo"))]),
                    toList([$html.text("Add Task")]),
                  ),
                  $element.fragment(
                    (() => {
                      let _pipe = model.to_do;
                      let _pipe$1 = $option.lazy_unwrap(
                        _pipe,
                        () => { return toList([]); },
                      );
                      return $list.map(
                        _pipe$1,
                        (task_item) => {
                          return $html.div(
                            task(),
                            toList([]),
                            toList([
                              $html.text(task_item),
                              $html.button(
                                delete_task_button(),
                                toList([
                                  $event.on_click(
                                    new DeleteTask("todo", task_item),
                                  ),
                                ]),
                                toList([$html.text("X")]),
                              ),
                            ]),
                          );
                        },
                      );
                    })(),
                  ),
                ]),
              ),
              $html.div(
                kanban_block(),
                toList([]),
                toList([
                  $html.div(
                    block_title(),
                    toList([]),
                    toList([$html.text("In Progress")]),
                  ),
                  $html.input(
                    add_task_input(),
                    toList([
                      $attribute.type_("text"),
                      $attribute.value(model.new_task_input),
                      $event.on_input(
                        (var0) => { return new UpdateNewTask(var0); },
                      ),
                    ]),
                  ),
                  $html.button(
                    add_task_button(),
                    toList([$event.on_click(new AddTask("in_progress"))]),
                    toList([$html.text("Add Task")]),
                  ),
                  $element.fragment(
                    (() => {
                      let _pipe = model.in_progress;
                      let _pipe$1 = $option.lazy_unwrap(
                        _pipe,
                        () => { return toList([]); },
                      );
                      return $list.map(
                        _pipe$1,
                        (task_item) => {
                          return $html.div(
                            task(),
                            toList([]),
                            toList([
                              $html.text(task_item),
                              $html.button(
                                delete_task_button(),
                                toList([
                                  $event.on_click(
                                    new DeleteTask("in_progress", task_item),
                                  ),
                                ]),
                                toList([$html.text("X")]),
                              ),
                            ]),
                          );
                        },
                      );
                    })(),
                  ),
                ]),
              ),
              $html.div(
                kanban_block(),
                toList([]),
                toList([
                  $html.div(
                    block_title(),
                    toList([]),
                    toList([$html.text("Done")]),
                  ),
                  $html.input(
                    add_task_input(),
                    toList([
                      $attribute.type_("text"),
                      $attribute.value(model.new_task_input),
                      $event.on_input(
                        (var0) => { return new UpdateNewTask(var0); },
                      ),
                    ]),
                  ),
                  $html.button(
                    add_task_button(),
                    toList([$event.on_click(new AddTask("done"))]),
                    toList([$html.text("Add Task")]),
                  ),
                  $element.fragment(
                    (() => {
                      let _pipe = model.done;
                      let _pipe$1 = $option.lazy_unwrap(
                        _pipe,
                        () => { return toList([]); },
                      );
                      return $list.map(
                        _pipe$1,
                        (task_item) => {
                          return $html.div(
                            task(),
                            toList([]),
                            toList([
                              $html.text(task_item),
                              $html.button(
                                delete_task_button(),
                                toList([
                                  $event.on_click(
                                    new DeleteTask("done", task_item),
                                  ),
                                ]),
                                toList([$html.text("X")]),
                              ),
                            ]),
                          );
                        },
                      );
                    })(),
                  ),
                ]),
              ),
            ]),
          ),
        ]),
      ),
    ]),
  );
}

export function main() {
  let $ = $sketch.cache(new $sketch.Ephemeral());
  if (!$.isOk()) {
    throw makeError(
      "let_assert",
      "kemotvt",
      19,
      "main",
      "Pattern match failed, no pattern matched the value.",
      { value: $ }
    )
  }
  let cache = $[0];
  let _pipe = $sketch_lustre.node();
  let _pipe$1 = $sketch_lustre.compose(_pipe, view, cache);
  let _pipe$2 = ((_capture) => {
    return $lustre.application(init, update, _capture);
  })(_pipe$1);
  return $lustre.start(_pipe$2, "#app", undefined);
}
