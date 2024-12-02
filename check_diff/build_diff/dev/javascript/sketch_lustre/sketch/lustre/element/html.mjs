import { toList } from "../../../gleam.mjs";
import * as $element from "../../../sketch/lustre/element.mjs";
import { element, element_, namespaced, namespaced_ } from "../../../sketch/lustre/element.mjs";

export function html(attributes, children) {
  return element_("html", attributes, children);
}

export function base(attributes) {
  return element_("base", attributes, toList([]));
}

export function head(attributes, children) {
  return element_("head", attributes, children);
}

export function link(attributes) {
  return element_("link", attributes, toList([]));
}

export function meta(attributes) {
  return element_("meta", attributes, toList([]));
}

export function text(content) {
  return $element.text(content);
}

export function style(attributes, child) {
  return element_("style", attributes, toList([text(child)]));
}

export function title(attributes, title) {
  return element_("title", attributes, toList([text(title)]));
}

export function a(class$, attributes, children) {
  return element("a", class$, attributes, children);
}

export function a_(attributes, children) {
  return element_("a", attributes, children);
}

export function abbr(class$, attributes, children) {
  return element("abbr", class$, attributes, children);
}

export function abbr_(attributes, children) {
  return element_("abbr", attributes, children);
}

export function address(class$, attributes, children) {
  return element("address", class$, attributes, children);
}

export function address_(attributes, children) {
  return element_("address", attributes, children);
}

export function area(class$, attributes) {
  return element("area", class$, attributes, toList([]));
}

export function area_(attributes) {
  return element_("area", attributes, toList([]));
}

export function article(class$, attributes, children) {
  return element("article", class$, attributes, children);
}

export function article_(attributes, children) {
  return element_("article", attributes, children);
}

export function aside(class$, attributes, children) {
  return element("aside", class$, attributes, children);
}

export function aside_(attributes, children) {
  return element_("aside", attributes, children);
}

export function audio(class$, attributes, children) {
  return element("audio", class$, attributes, children);
}

export function audio_(attributes, children) {
  return element_("audio", attributes, children);
}

export function b(class$, attributes, children) {
  return element("b", class$, attributes, children);
}

export function b_(attributes, children) {
  return element_("b", attributes, children);
}

export function bdi(class$, attributes, children) {
  return element("bdi", class$, attributes, children);
}

export function bdi_(attributes, children) {
  return element_("bdi", attributes, children);
}

export function bdo(class$, attributes, children) {
  return element("bdo", class$, attributes, children);
}

export function bdo_(attributes, children) {
  return element_("bdo", attributes, children);
}

export function blockquote(class$, attributes, children) {
  return element("blockquote", class$, attributes, children);
}

export function blockquote_(attributes, children) {
  return element_("blockquote", attributes, children);
}

export function body(class$, attributes, children) {
  return element("body", class$, attributes, children);
}

export function body_(attributes, children) {
  return element_("body", attributes, children);
}

export function br(class$, attributes) {
  return element("br", class$, attributes, toList([]));
}

export function br_(attributes) {
  return element_("br", attributes, toList([]));
}

export function button(class$, attributes, children) {
  return element("button", class$, attributes, children);
}

export function button_(attributes, children) {
  return element_("button", attributes, children);
}

export function canvas(class$, attributes, children) {
  return element("canvas", class$, attributes, children);
}

export function canvas_(attributes, children) {
  return element_("canvas", attributes, children);
}

export function caption(class$, attributes, children) {
  return element("caption", class$, attributes, children);
}

export function caption_(attributes, children) {
  return element_("caption", attributes, children);
}

export function cite(class$, attributes, children) {
  return element("cite", class$, attributes, children);
}

export function cite_(attributes, children) {
  return element_("cite", attributes, children);
}

export function code(class$, attributes, children) {
  return element("code", class$, attributes, children);
}

export function code_(attributes, children) {
  return element_("code", attributes, children);
}

export function col(class$, attributes) {
  return element("col", class$, attributes, toList([]));
}

export function col_(attributes) {
  return element_("col", attributes, toList([]));
}

export function colgroup(class$, attributes, children) {
  return element("colgroup", class$, attributes, children);
}

export function colgroup_(attributes, children) {
  return element_("colgroup", attributes, children);
}

export function data(class$, attributes, children) {
  return element("data", class$, attributes, children);
}

export function data_(attributes, children) {
  return element_("data", attributes, children);
}

export function datalist(class$, attributes, children) {
  return element("datalist", class$, attributes, children);
}

export function datalist_(attributes, children) {
  return element_("datalist", attributes, children);
}

export function dd(class$, attributes, children) {
  return element("dd", class$, attributes, children);
}

export function dd_(attributes, children) {
  return element_("dd", attributes, children);
}

export function del(class$, attributes, children) {
  return element("del", class$, attributes, children);
}

export function del_(attributes, children) {
  return element_("del", attributes, children);
}

export function details(class$, attributes, children) {
  return element("details", class$, attributes, children);
}

export function details_(attributes, children) {
  return element_("details", attributes, children);
}

export function dfn(class$, attributes, children) {
  return element("dfn", class$, attributes, children);
}

export function dfn_(attributes, children) {
  return element_("dfn", attributes, children);
}

export function dialog(class$, attributes, children) {
  return element("dialog", class$, attributes, children);
}

export function dialog_(attributes, children) {
  return element_("dialog", attributes, children);
}

export function div(class$, attributes, children) {
  return element("div", class$, attributes, children);
}

export function div_(attributes, children) {
  return element_("div", attributes, children);
}

export function dl(class$, attributes, children) {
  return element("dl", class$, attributes, children);
}

export function dl_(attributes, children) {
  return element_("dl", attributes, children);
}

export function dt(class$, attributes, children) {
  return element("dt", class$, attributes, children);
}

export function dt_(attributes, children) {
  return element_("dt", attributes, children);
}

export function em(class$, attributes, children) {
  return element("em", class$, attributes, children);
}

export function em_(attributes, children) {
  return element_("em", attributes, children);
}

export function embed(class$, attributes) {
  return element("embed", class$, attributes, toList([]));
}

export function embed_(attributes) {
  return element_("embed", attributes, toList([]));
}

export function fieldset(class$, attributes, children) {
  return element("fieldset", class$, attributes, children);
}

export function fieldset_(attributes, children) {
  return element_("fieldset", attributes, children);
}

export function figcaption(class$, attributes, children) {
  return element("figcaption", class$, attributes, children);
}

export function figcaption_(attributes, children) {
  return element_("figcaption", attributes, children);
}

export function figure(class$, attributes, children) {
  return element("figure", class$, attributes, children);
}

export function figure_(attributes, children) {
  return element_("figure", attributes, children);
}

export function footer(class$, attributes, children) {
  return element("footer", class$, attributes, children);
}

export function footer_(attributes, children) {
  return element_("footer", attributes, children);
}

export function form(class$, attributes, children) {
  return element("form", class$, attributes, children);
}

export function form_(attributes, children) {
  return element_("form", attributes, children);
}

export function h1(class$, attributes, children) {
  return element("h1", class$, attributes, children);
}

export function h1_(attributes, children) {
  return element_("h1", attributes, children);
}

export function h2(class$, attributes, children) {
  return element("h2", class$, attributes, children);
}

export function h2_(attributes, children) {
  return element_("h2", attributes, children);
}

export function h3(class$, attributes, children) {
  return element("h3", class$, attributes, children);
}

export function h3_(attributes, children) {
  return element_("h3", attributes, children);
}

export function h4(class$, attributes, children) {
  return element("h4", class$, attributes, children);
}

export function h4_(attributes, children) {
  return element_("h4", attributes, children);
}

export function h5(class$, attributes, children) {
  return element("h5", class$, attributes, children);
}

export function h5_(attributes, children) {
  return element_("h5", attributes, children);
}

export function h6(class$, attributes, children) {
  return element("h6", class$, attributes, children);
}

export function h6_(attributes, children) {
  return element_("h6", attributes, children);
}

export function header(class$, attributes, children) {
  return element("header", class$, attributes, children);
}

export function header_(attributes, children) {
  return element_("header", attributes, children);
}

export function hgroup(class$, attributes, children) {
  return element("hgroup", class$, attributes, children);
}

export function hgroup_(attributes, children) {
  return element_("hgroup", attributes, children);
}

export function hr(class$, attributes) {
  return element("hr", class$, attributes, toList([]));
}

export function hr_(attributes) {
  return element_("hr", attributes, toList([]));
}

export function i(class$, attributes, children) {
  return element("i", class$, attributes, children);
}

export function i_(attributes, children) {
  return element_("i", attributes, children);
}

export function iframe(class$, attributes, children) {
  return element("iframe", class$, attributes, children);
}

export function iframe_(attributes, children) {
  return element_("iframe", attributes, children);
}

export function img(class$, attributes) {
  return element("img", class$, attributes, toList([]));
}

export function img_(attributes) {
  return element_("img", attributes, toList([]));
}

export function input(class$, attributes) {
  return element("input", class$, attributes, toList([]));
}

export function input_(attributes) {
  return element_("input", attributes, toList([]));
}

export function ins(class$, attributes, children) {
  return element("ins", class$, attributes, children);
}

export function ins_(attributes, children) {
  return element_("ins", attributes, children);
}

export function kbd(class$, attributes, children) {
  return element("kbd", class$, attributes, children);
}

export function kbd_(attributes, children) {
  return element_("kbd", attributes, children);
}

export function label(class$, attributes, children) {
  return element("label", class$, attributes, children);
}

export function label_(attributes, children) {
  return element_("label", attributes, children);
}

export function legend(class$, attributes, children) {
  return element("legend", class$, attributes, children);
}

export function legend_(attributes, children) {
  return element_("legend", attributes, children);
}

export function li(class$, attributes, children) {
  return element("li", class$, attributes, children);
}

export function li_(attributes, children) {
  return element_("li", attributes, children);
}

export function main(class$, attributes, children) {
  return element("main", class$, attributes, children);
}

export function main_(attributes, children) {
  return element_("main", attributes, children);
}

export function map(class$, attributes, children) {
  return element("map", class$, attributes, children);
}

export function map_(attributes, children) {
  return element_("map", attributes, children);
}

export function mark(class$, attributes, children) {
  return element("mark", class$, attributes, children);
}

export function mark_(attributes, children) {
  return element_("mark", attributes, children);
}

export function math(class$, attributes, children) {
  return element("math", class$, attributes, children);
}

export function math_(attributes, children) {
  return element_("math", attributes, children);
}

export function menu(class$, attributes, children) {
  return element("menu", class$, attributes, children);
}

export function menu_(attributes, children) {
  return element_("menu", attributes, children);
}

export function meter(class$, attributes, children) {
  return element("meter", class$, attributes, children);
}

export function meter_(attributes, children) {
  return element_("meter", attributes, children);
}

export function nav(class$, attributes, children) {
  return element("nav", class$, attributes, children);
}

export function nav_(attributes, children) {
  return element_("nav", attributes, children);
}

export function noscript(class$, attributes, children) {
  return element("noscript", class$, attributes, children);
}

export function noscript_(attributes, children) {
  return element_("noscript", attributes, children);
}

export function object(class$, attributes, children) {
  return element("object", class$, attributes, children);
}

export function object_(attributes, children) {
  return element_("object", attributes, children);
}

export function ol(class$, attributes, children) {
  return element("ol", class$, attributes, children);
}

export function ol_(attributes, children) {
  return element_("ol", attributes, children);
}

export function optgroup(class$, attributes, children) {
  return element("optgroup", class$, attributes, children);
}

export function optgroup_(attributes, children) {
  return element_("optgroup", attributes, children);
}

export function option(class$, attributes, children) {
  return element("option", class$, attributes, children);
}

export function option_(attributes, children) {
  return element_("option", attributes, children);
}

export function output(class$, attributes, children) {
  return element("output", class$, attributes, children);
}

export function output_(attributes, children) {
  return element_("output", attributes, children);
}

export function p(class$, attributes, children) {
  return element("p", class$, attributes, children);
}

export function p_(attributes, children) {
  return element_("p", attributes, children);
}

export function picture(class$, attributes, children) {
  return element("picture", class$, attributes, children);
}

export function picture_(attributes, children) {
  return element_("picture", attributes, children);
}

export function portal(class$, attributes, children) {
  return element("portal", class$, attributes, children);
}

export function portal_(attributes, children) {
  return element_("portal", attributes, children);
}

export function pre(class$, attributes, children) {
  return element("pre", class$, attributes, children);
}

export function pre_(attributes, children) {
  return element_("pre", attributes, children);
}

export function progress(class$, attributes, children) {
  return element("progress", class$, attributes, children);
}

export function progress_(attributes, children) {
  return element_("progress", attributes, children);
}

export function q(class$, attributes, children) {
  return element("q", class$, attributes, children);
}

export function q_(attributes, children) {
  return element_("q", attributes, children);
}

export function rp(class$, attributes, children) {
  return element("rp", class$, attributes, children);
}

export function rp_(attributes, children) {
  return element_("rp", attributes, children);
}

export function rt(class$, attributes, children) {
  return element("rt", class$, attributes, children);
}

export function rt_(attributes, children) {
  return element_("rt", attributes, children);
}

export function ruby(class$, attributes, children) {
  return element("ruby", class$, attributes, children);
}

export function ruby_(attributes, children) {
  return element_("ruby", attributes, children);
}

export function s(class$, attributes, children) {
  return element("s", class$, attributes, children);
}

export function s_(attributes, children) {
  return element_("s", attributes, children);
}

export function samp(class$, attributes, children) {
  return element("samp", class$, attributes, children);
}

export function samp_(attributes, children) {
  return element_("samp", attributes, children);
}

export function script(class$, attributes, children) {
  return element("script", class$, attributes, children);
}

export function script_(attributes, children) {
  return element_("script", attributes, children);
}

export function search(class$, attributes, children) {
  return element("search", class$, attributes, children);
}

export function search_(attributes, children) {
  return element_("search", attributes, children);
}

export function section(class$, attributes, children) {
  return element("section", class$, attributes, children);
}

export function section_(attributes, children) {
  return element_("section", attributes, children);
}

export function select(class$, attributes, children) {
  return element("select", class$, attributes, children);
}

export function select_(attributes, children) {
  return element_("select", attributes, children);
}

export function slot(class$, attributes, children) {
  return element("slot", class$, attributes, children);
}

export function slot_(attributes, children) {
  return element_("slot", attributes, children);
}

export function small(class$, attributes, children) {
  return element("small", class$, attributes, children);
}

export function small_(attributes, children) {
  return element_("small", attributes, children);
}

export function source(class$, attributes) {
  return element("source", class$, attributes, toList([]));
}

export function source_(attributes) {
  return element_("source", attributes, toList([]));
}

export function span(class$, attributes, children) {
  return element("span", class$, attributes, children);
}

export function span_(attributes, children) {
  return element_("span", attributes, children);
}

export function strong(class$, attributes, children) {
  return element("strong", class$, attributes, children);
}

export function strong_(attributes, children) {
  return element_("strong", attributes, children);
}

export function sub(class$, attributes, children) {
  return element("sub", class$, attributes, children);
}

export function sub_(attributes, children) {
  return element_("sub", attributes, children);
}

export function summary(class$, attributes, children) {
  return element("summary", class$, attributes, children);
}

export function summary_(attributes, children) {
  return element_("summary", attributes, children);
}

export function sup(class$, attributes, children) {
  return element("sup", class$, attributes, children);
}

export function sup_(attributes, children) {
  return element_("sup", attributes, children);
}

export function svg(class$, attributes, children) {
  return namespaced(
    "http://www.w3.org/2000/svg",
    "svg",
    class$,
    attributes,
    children,
  );
}

export function svg_(attributes, children) {
  return namespaced_("http://www.w3.org/2000/svg", "svg", attributes, children);
}

export function table(class$, attributes, children) {
  return element("table", class$, attributes, children);
}

export function table_(attributes, children) {
  return element_("table", attributes, children);
}

export function tbody(class$, attributes, children) {
  return element("tbody", class$, attributes, children);
}

export function tbody_(attributes, children) {
  return element_("tbody", attributes, children);
}

export function td(class$, attributes, children) {
  return element("td", class$, attributes, children);
}

export function td_(attributes, children) {
  return element_("td", attributes, children);
}

export function template(class$, attributes, children) {
  return element("template", class$, attributes, children);
}

export function template_(attributes, children) {
  return element_("template", attributes, children);
}

export function textarea(class$, attributes, children) {
  return element("textarea", class$, attributes, children);
}

export function textarea_(attributes, children) {
  return element_("textarea", attributes, children);
}

export function tfoot(class$, attributes, children) {
  return element("tfoot", class$, attributes, children);
}

export function tfoot_(attributes, children) {
  return element_("tfoot", attributes, children);
}

export function th(class$, attributes, children) {
  return element("th", class$, attributes, children);
}

export function th_(attributes, children) {
  return element_("th", attributes, children);
}

export function thead(class$, attributes, children) {
  return element("thead", class$, attributes, children);
}

export function thead_(attributes, children) {
  return element_("thead", attributes, children);
}

export function time(class$, attributes, children) {
  return element("time", class$, attributes, children);
}

export function time_(attributes, children) {
  return element_("time", attributes, children);
}

export function tr(class$, attributes, children) {
  return element("tr", class$, attributes, children);
}

export function tr_(attributes, children) {
  return element_("tr", attributes, children);
}

export function track(class$, attributes) {
  return element("track", class$, attributes, toList([]));
}

export function track_(attributes) {
  return element_("track", attributes, toList([]));
}

export function u(class$, attributes, children) {
  return element("u", class$, attributes, children);
}

export function u_(attributes, children) {
  return element_("u", attributes, children);
}

export function ul(class$, attributes, children) {
  return element("ul", class$, attributes, children);
}

export function ul_(attributes, children) {
  return element_("ul", attributes, children);
}

export function var$(class$, attributes, children) {
  return element("var", class$, attributes, children);
}

export function var_(attributes, children) {
  return element_("var", attributes, children);
}

export function video(class$, attributes, children) {
  return element("video", class$, attributes, children);
}

export function video_(attributes, children) {
  return element_("video", attributes, children);
}

export function wbr(class$, attributes) {
  return element("wbr", class$, attributes, toList([]));
}

export function wbr_(attributes) {
  return element_("wbr", attributes, toList([]));
}
