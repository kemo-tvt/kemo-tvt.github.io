-module(sketch@lustre@element@html).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([html/2, base/1, head/2, link/1, meta/1, text/1, style/2, title/2, a/3, a_/2, abbr/3, abbr_/2, address/3, address_/2, area/2, area_/1, article/3, article_/2, aside/3, aside_/2, audio/3, audio_/2, b/3, b_/2, bdi/3, bdi_/2, bdo/3, bdo_/2, blockquote/3, blockquote_/2, body/3, body_/2, br/2, br_/1, button/3, button_/2, canvas/3, canvas_/2, caption/3, caption_/2, cite/3, cite_/2, code/3, code_/2, col/2, col_/1, colgroup/3, colgroup_/2, data/3, data_/2, datalist/3, datalist_/2, dd/3, dd_/2, del/3, del_/2, details/3, details_/2, dfn/3, dfn_/2, dialog/3, dialog_/2, 'div'/3, div_/2, dl/3, dl_/2, dt/3, dt_/2, em/3, em_/2, embed/2, embed_/1, fieldset/3, fieldset_/2, figcaption/3, figcaption_/2, figure/3, figure_/2, footer/3, footer_/2, form/3, form_/2, h1/3, h1_/2, h2/3, h2_/2, h3/3, h3_/2, h4/3, h4_/2, h5/3, h5_/2, h6/3, h6_/2, header/3, header_/2, hgroup/3, hgroup_/2, hr/2, hr_/1, i/3, i_/2, iframe/3, iframe_/2, img/2, img_/1, input/2, input_/1, ins/3, ins_/2, kbd/3, kbd_/2, label/3, label_/2, legend/3, legend_/2, li/3, li_/2, main/3, main_/2, map/3, map_/2, mark/3, mark_/2, math/3, math_/2, menu/3, menu_/2, meter/3, meter_/2, nav/3, nav_/2, noscript/3, noscript_/2, object/3, object_/2, ol/3, ol_/2, optgroup/3, optgroup_/2, option/3, option_/2, output/3, output_/2, p/3, p_/2, picture/3, picture_/2, portal/3, portal_/2, pre/3, pre_/2, progress/3, progress_/2, q/3, q_/2, rp/3, rp_/2, rt/3, rt_/2, ruby/3, ruby_/2, s/3, s_/2, samp/3, samp_/2, script/3, script_/2, search/3, search_/2, section/3, section_/2, select/3, select_/2, slot/3, slot_/2, small/3, small_/2, source/2, source_/1, span/3, span_/2, strong/3, strong_/2, sub/3, sub_/2, summary/3, summary_/2, sup/3, sup_/2, svg/3, svg_/2, table/3, table_/2, tbody/3, tbody_/2, td/3, td_/2, template/3, template_/2, textarea/3, textarea_/2, tfoot/3, tfoot_/2, th/3, th_/2, thead/3, thead_/2, time/3, time_/2, tr/3, tr_/2, track/2, track_/1, u/3, u_/2, ul/3, ul_/2, var/3, var_/2, video/3, video_/2, wbr/2, wbr_/1]).

-spec html(
    list(lustre@internals@vdom:attribute(SMC)),
    list(sketch@lustre@element:element(SMC))
) -> sketch@lustre@element:element(SMC).
html(Attributes, Children) ->
    sketch@lustre@element:element_(<<"html"/utf8>>, Attributes, Children).

-spec base(list(lustre@internals@vdom:attribute(SMD))) -> sketch@lustre@element:element(SMD).
base(Attributes) ->
    sketch@lustre@element:element_(<<"base"/utf8>>, Attributes, []).

-spec head(
    list(lustre@internals@vdom:attribute(SMF)),
    list(sketch@lustre@element:element(SMF))
) -> sketch@lustre@element:element(SMF).
head(Attributes, Children) ->
    sketch@lustre@element:element_(<<"head"/utf8>>, Attributes, Children).

-spec link(list(lustre@internals@vdom:attribute(SMG))) -> sketch@lustre@element:element(SMG).
link(Attributes) ->
    sketch@lustre@element:element_(<<"link"/utf8>>, Attributes, []).

-spec meta(list(lustre@internals@vdom:attribute(SMI))) -> sketch@lustre@element:element(SMI).
meta(Attributes) ->
    sketch@lustre@element:element_(<<"meta"/utf8>>, Attributes, []).

-spec text(binary()) -> sketch@lustre@element:element(any()).
text(Content) ->
    sketch@lustre@element:text(Content).

-spec style(list(lustre@internals@vdom:attribute(SMO)), binary()) -> sketch@lustre@element:element(SMO).
style(Attributes, Child) ->
    sketch@lustre@element:element_(<<"style"/utf8>>, Attributes, [text(Child)]).

-spec title(list(lustre@internals@vdom:attribute(SMR)), binary()) -> sketch@lustre@element:element(SMR).
title(Attributes, Title) ->
    sketch@lustre@element:element_(<<"title"/utf8>>, Attributes, [text(Title)]).

-spec a(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SMS)),
    list(sketch@lustre@element:element(SMS))
) -> sketch@lustre@element:element(SMS).
a(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"a"/utf8>>, Class, Attributes, Children).

-spec a_(
    list(lustre@internals@vdom:attribute(SMT)),
    list(sketch@lustre@element:element(SMT))
) -> sketch@lustre@element:element(SMT).
a_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"a"/utf8>>, Attributes, Children).

-spec abbr(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SMU)),
    list(sketch@lustre@element:element(SMU))
) -> sketch@lustre@element:element(SMU).
abbr(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"abbr"/utf8>>, Class, Attributes, Children).

-spec abbr_(
    list(lustre@internals@vdom:attribute(SMV)),
    list(sketch@lustre@element:element(SMV))
) -> sketch@lustre@element:element(SMV).
abbr_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"abbr"/utf8>>, Attributes, Children).

-spec address(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SMW)),
    list(sketch@lustre@element:element(SMW))
) -> sketch@lustre@element:element(SMW).
address(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"address"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec address_(
    list(lustre@internals@vdom:attribute(SMX)),
    list(sketch@lustre@element:element(SMX))
) -> sketch@lustre@element:element(SMX).
address_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"address"/utf8>>, Attributes, Children).

-spec area(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SMY))
) -> sketch@lustre@element:element(SMY).
area(Class, Attributes) ->
    sketch@lustre@element:element(<<"area"/utf8>>, Class, Attributes, []).

-spec area_(list(lustre@internals@vdom:attribute(SNA))) -> sketch@lustre@element:element(SNA).
area_(Attributes) ->
    sketch@lustre@element:element_(<<"area"/utf8>>, Attributes, []).

-spec article(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SNC)),
    list(sketch@lustre@element:element(SNC))
) -> sketch@lustre@element:element(SNC).
article(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"article"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec article_(
    list(lustre@internals@vdom:attribute(SND)),
    list(sketch@lustre@element:element(SND))
) -> sketch@lustre@element:element(SND).
article_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"article"/utf8>>, Attributes, Children).

-spec aside(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SNE)),
    list(sketch@lustre@element:element(SNE))
) -> sketch@lustre@element:element(SNE).
aside(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"aside"/utf8>>, Class, Attributes, Children).

-spec aside_(
    list(lustre@internals@vdom:attribute(SNF)),
    list(sketch@lustre@element:element(SNF))
) -> sketch@lustre@element:element(SNF).
aside_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"aside"/utf8>>, Attributes, Children).

-spec audio(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SNG)),
    list(sketch@lustre@element:element(SNG))
) -> sketch@lustre@element:element(SNG).
audio(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"audio"/utf8>>, Class, Attributes, Children).

-spec audio_(
    list(lustre@internals@vdom:attribute(SNH)),
    list(sketch@lustre@element:element(SNH))
) -> sketch@lustre@element:element(SNH).
audio_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"audio"/utf8>>, Attributes, Children).

-spec b(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SNI)),
    list(sketch@lustre@element:element(SNI))
) -> sketch@lustre@element:element(SNI).
b(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"b"/utf8>>, Class, Attributes, Children).

-spec b_(
    list(lustre@internals@vdom:attribute(SNJ)),
    list(sketch@lustre@element:element(SNJ))
) -> sketch@lustre@element:element(SNJ).
b_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"b"/utf8>>, Attributes, Children).

-spec bdi(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SNK)),
    list(sketch@lustre@element:element(SNK))
) -> sketch@lustre@element:element(SNK).
bdi(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"bdi"/utf8>>, Class, Attributes, Children).

-spec bdi_(
    list(lustre@internals@vdom:attribute(SNL)),
    list(sketch@lustre@element:element(SNL))
) -> sketch@lustre@element:element(SNL).
bdi_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"bdi"/utf8>>, Attributes, Children).

-spec bdo(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SNM)),
    list(sketch@lustre@element:element(SNM))
) -> sketch@lustre@element:element(SNM).
bdo(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"bdo"/utf8>>, Class, Attributes, Children).

-spec bdo_(
    list(lustre@internals@vdom:attribute(SNN)),
    list(sketch@lustre@element:element(SNN))
) -> sketch@lustre@element:element(SNN).
bdo_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"bdo"/utf8>>, Attributes, Children).

-spec blockquote(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SNO)),
    list(sketch@lustre@element:element(SNO))
) -> sketch@lustre@element:element(SNO).
blockquote(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"blockquote"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec blockquote_(
    list(lustre@internals@vdom:attribute(SNP)),
    list(sketch@lustre@element:element(SNP))
) -> sketch@lustre@element:element(SNP).
blockquote_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"blockquote"/utf8>>, Attributes, Children).

-spec body(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SNQ)),
    list(sketch@lustre@element:element(SNQ))
) -> sketch@lustre@element:element(SNQ).
body(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"body"/utf8>>, Class, Attributes, Children).

-spec body_(
    list(lustre@internals@vdom:attribute(SNR)),
    list(sketch@lustre@element:element(SNR))
) -> sketch@lustre@element:element(SNR).
body_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"body"/utf8>>, Attributes, Children).

-spec br(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SNS))
) -> sketch@lustre@element:element(SNS).
br(Class, Attributes) ->
    sketch@lustre@element:element(<<"br"/utf8>>, Class, Attributes, []).

-spec br_(list(lustre@internals@vdom:attribute(SNU))) -> sketch@lustre@element:element(SNU).
br_(Attributes) ->
    sketch@lustre@element:element_(<<"br"/utf8>>, Attributes, []).

-spec button(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SNW)),
    list(sketch@lustre@element:element(SNW))
) -> sketch@lustre@element:element(SNW).
button(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"button"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec button_(
    list(lustre@internals@vdom:attribute(SNX)),
    list(sketch@lustre@element:element(SNX))
) -> sketch@lustre@element:element(SNX).
button_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"button"/utf8>>, Attributes, Children).

-spec canvas(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SNY)),
    list(sketch@lustre@element:element(SNY))
) -> sketch@lustre@element:element(SNY).
canvas(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"canvas"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec canvas_(
    list(lustre@internals@vdom:attribute(SNZ)),
    list(sketch@lustre@element:element(SNZ))
) -> sketch@lustre@element:element(SNZ).
canvas_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"canvas"/utf8>>, Attributes, Children).

-spec caption(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SOA)),
    list(sketch@lustre@element:element(SOA))
) -> sketch@lustre@element:element(SOA).
caption(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"caption"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec caption_(
    list(lustre@internals@vdom:attribute(SOB)),
    list(sketch@lustre@element:element(SOB))
) -> sketch@lustre@element:element(SOB).
caption_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"caption"/utf8>>, Attributes, Children).

-spec cite(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SOC)),
    list(sketch@lustre@element:element(SOC))
) -> sketch@lustre@element:element(SOC).
cite(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"cite"/utf8>>, Class, Attributes, Children).

-spec cite_(
    list(lustre@internals@vdom:attribute(SOD)),
    list(sketch@lustre@element:element(SOD))
) -> sketch@lustre@element:element(SOD).
cite_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"cite"/utf8>>, Attributes, Children).

-spec code(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SOE)),
    list(sketch@lustre@element:element(SOE))
) -> sketch@lustre@element:element(SOE).
code(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"code"/utf8>>, Class, Attributes, Children).

-spec code_(
    list(lustre@internals@vdom:attribute(SOF)),
    list(sketch@lustre@element:element(SOF))
) -> sketch@lustre@element:element(SOF).
code_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"code"/utf8>>, Attributes, Children).

-spec col(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SOG))
) -> sketch@lustre@element:element(SOG).
col(Class, Attributes) ->
    sketch@lustre@element:element(<<"col"/utf8>>, Class, Attributes, []).

-spec col_(list(lustre@internals@vdom:attribute(SOI))) -> sketch@lustre@element:element(SOI).
col_(Attributes) ->
    sketch@lustre@element:element_(<<"col"/utf8>>, Attributes, []).

-spec colgroup(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SOK)),
    list(sketch@lustre@element:element(SOK))
) -> sketch@lustre@element:element(SOK).
colgroup(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"colgroup"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec colgroup_(
    list(lustre@internals@vdom:attribute(SOL)),
    list(sketch@lustre@element:element(SOL))
) -> sketch@lustre@element:element(SOL).
colgroup_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"colgroup"/utf8>>, Attributes, Children).

-spec data(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SOM)),
    list(sketch@lustre@element:element(SOM))
) -> sketch@lustre@element:element(SOM).
data(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"data"/utf8>>, Class, Attributes, Children).

-spec data_(
    list(lustre@internals@vdom:attribute(SON)),
    list(sketch@lustre@element:element(SON))
) -> sketch@lustre@element:element(SON).
data_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"data"/utf8>>, Attributes, Children).

-spec datalist(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SOO)),
    list(sketch@lustre@element:element(SOO))
) -> sketch@lustre@element:element(SOO).
datalist(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"datalist"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec datalist_(
    list(lustre@internals@vdom:attribute(SOP)),
    list(sketch@lustre@element:element(SOP))
) -> sketch@lustre@element:element(SOP).
datalist_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"datalist"/utf8>>, Attributes, Children).

-spec dd(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SOQ)),
    list(sketch@lustre@element:element(SOQ))
) -> sketch@lustre@element:element(SOQ).
dd(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"dd"/utf8>>, Class, Attributes, Children).

-spec dd_(
    list(lustre@internals@vdom:attribute(SOR)),
    list(sketch@lustre@element:element(SOR))
) -> sketch@lustre@element:element(SOR).
dd_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"dd"/utf8>>, Attributes, Children).

-spec del(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SOS)),
    list(sketch@lustre@element:element(SOS))
) -> sketch@lustre@element:element(SOS).
del(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"del"/utf8>>, Class, Attributes, Children).

-spec del_(
    list(lustre@internals@vdom:attribute(SOT)),
    list(sketch@lustre@element:element(SOT))
) -> sketch@lustre@element:element(SOT).
del_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"del"/utf8>>, Attributes, Children).

-spec details(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SOU)),
    list(sketch@lustre@element:element(SOU))
) -> sketch@lustre@element:element(SOU).
details(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"details"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec details_(
    list(lustre@internals@vdom:attribute(SOV)),
    list(sketch@lustre@element:element(SOV))
) -> sketch@lustre@element:element(SOV).
details_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"details"/utf8>>, Attributes, Children).

-spec dfn(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SOW)),
    list(sketch@lustre@element:element(SOW))
) -> sketch@lustre@element:element(SOW).
dfn(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"dfn"/utf8>>, Class, Attributes, Children).

-spec dfn_(
    list(lustre@internals@vdom:attribute(SOX)),
    list(sketch@lustre@element:element(SOX))
) -> sketch@lustre@element:element(SOX).
dfn_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"dfn"/utf8>>, Attributes, Children).

-spec dialog(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SOY)),
    list(sketch@lustre@element:element(SOY))
) -> sketch@lustre@element:element(SOY).
dialog(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"dialog"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec dialog_(
    list(lustre@internals@vdom:attribute(SOZ)),
    list(sketch@lustre@element:element(SOZ))
) -> sketch@lustre@element:element(SOZ).
dialog_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"dialog"/utf8>>, Attributes, Children).

-spec 'div'(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SPA)),
    list(sketch@lustre@element:element(SPA))
) -> sketch@lustre@element:element(SPA).
'div'(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"div"/utf8>>, Class, Attributes, Children).

-spec div_(
    list(lustre@internals@vdom:attribute(SPB)),
    list(sketch@lustre@element:element(SPB))
) -> sketch@lustre@element:element(SPB).
div_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"div"/utf8>>, Attributes, Children).

-spec dl(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SPC)),
    list(sketch@lustre@element:element(SPC))
) -> sketch@lustre@element:element(SPC).
dl(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"dl"/utf8>>, Class, Attributes, Children).

-spec dl_(
    list(lustre@internals@vdom:attribute(SPD)),
    list(sketch@lustre@element:element(SPD))
) -> sketch@lustre@element:element(SPD).
dl_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"dl"/utf8>>, Attributes, Children).

-spec dt(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SPE)),
    list(sketch@lustre@element:element(SPE))
) -> sketch@lustre@element:element(SPE).
dt(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"dt"/utf8>>, Class, Attributes, Children).

-spec dt_(
    list(lustre@internals@vdom:attribute(SPF)),
    list(sketch@lustre@element:element(SPF))
) -> sketch@lustre@element:element(SPF).
dt_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"dt"/utf8>>, Attributes, Children).

-spec em(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SPG)),
    list(sketch@lustre@element:element(SPG))
) -> sketch@lustre@element:element(SPG).
em(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"em"/utf8>>, Class, Attributes, Children).

-spec em_(
    list(lustre@internals@vdom:attribute(SPH)),
    list(sketch@lustre@element:element(SPH))
) -> sketch@lustre@element:element(SPH).
em_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"em"/utf8>>, Attributes, Children).

-spec embed(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SPI))
) -> sketch@lustre@element:element(SPI).
embed(Class, Attributes) ->
    sketch@lustre@element:element(<<"embed"/utf8>>, Class, Attributes, []).

-spec embed_(list(lustre@internals@vdom:attribute(SPK))) -> sketch@lustre@element:element(SPK).
embed_(Attributes) ->
    sketch@lustre@element:element_(<<"embed"/utf8>>, Attributes, []).

-spec fieldset(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SPM)),
    list(sketch@lustre@element:element(SPM))
) -> sketch@lustre@element:element(SPM).
fieldset(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"fieldset"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec fieldset_(
    list(lustre@internals@vdom:attribute(SPN)),
    list(sketch@lustre@element:element(SPN))
) -> sketch@lustre@element:element(SPN).
fieldset_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"fieldset"/utf8>>, Attributes, Children).

-spec figcaption(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SPO)),
    list(sketch@lustre@element:element(SPO))
) -> sketch@lustre@element:element(SPO).
figcaption(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"figcaption"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec figcaption_(
    list(lustre@internals@vdom:attribute(SPP)),
    list(sketch@lustre@element:element(SPP))
) -> sketch@lustre@element:element(SPP).
figcaption_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"figcaption"/utf8>>, Attributes, Children).

-spec figure(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SPQ)),
    list(sketch@lustre@element:element(SPQ))
) -> sketch@lustre@element:element(SPQ).
figure(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"figure"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec figure_(
    list(lustre@internals@vdom:attribute(SPR)),
    list(sketch@lustre@element:element(SPR))
) -> sketch@lustre@element:element(SPR).
figure_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"figure"/utf8>>, Attributes, Children).

-spec footer(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SPS)),
    list(sketch@lustre@element:element(SPS))
) -> sketch@lustre@element:element(SPS).
footer(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"footer"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec footer_(
    list(lustre@internals@vdom:attribute(SPT)),
    list(sketch@lustre@element:element(SPT))
) -> sketch@lustre@element:element(SPT).
footer_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"footer"/utf8>>, Attributes, Children).

-spec form(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SPU)),
    list(sketch@lustre@element:element(SPU))
) -> sketch@lustre@element:element(SPU).
form(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"form"/utf8>>, Class, Attributes, Children).

-spec form_(
    list(lustre@internals@vdom:attribute(SPV)),
    list(sketch@lustre@element:element(SPV))
) -> sketch@lustre@element:element(SPV).
form_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"form"/utf8>>, Attributes, Children).

-spec h1(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SPW)),
    list(sketch@lustre@element:element(SPW))
) -> sketch@lustre@element:element(SPW).
h1(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"h1"/utf8>>, Class, Attributes, Children).

-spec h1_(
    list(lustre@internals@vdom:attribute(SPX)),
    list(sketch@lustre@element:element(SPX))
) -> sketch@lustre@element:element(SPX).
h1_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"h1"/utf8>>, Attributes, Children).

-spec h2(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SPY)),
    list(sketch@lustre@element:element(SPY))
) -> sketch@lustre@element:element(SPY).
h2(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"h2"/utf8>>, Class, Attributes, Children).

-spec h2_(
    list(lustre@internals@vdom:attribute(SPZ)),
    list(sketch@lustre@element:element(SPZ))
) -> sketch@lustre@element:element(SPZ).
h2_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"h2"/utf8>>, Attributes, Children).

-spec h3(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SQA)),
    list(sketch@lustre@element:element(SQA))
) -> sketch@lustre@element:element(SQA).
h3(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"h3"/utf8>>, Class, Attributes, Children).

-spec h3_(
    list(lustre@internals@vdom:attribute(SQB)),
    list(sketch@lustre@element:element(SQB))
) -> sketch@lustre@element:element(SQB).
h3_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"h3"/utf8>>, Attributes, Children).

-spec h4(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SQC)),
    list(sketch@lustre@element:element(SQC))
) -> sketch@lustre@element:element(SQC).
h4(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"h4"/utf8>>, Class, Attributes, Children).

-spec h4_(
    list(lustre@internals@vdom:attribute(SQD)),
    list(sketch@lustre@element:element(SQD))
) -> sketch@lustre@element:element(SQD).
h4_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"h4"/utf8>>, Attributes, Children).

-spec h5(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SQE)),
    list(sketch@lustre@element:element(SQE))
) -> sketch@lustre@element:element(SQE).
h5(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"h5"/utf8>>, Class, Attributes, Children).

-spec h5_(
    list(lustre@internals@vdom:attribute(SQF)),
    list(sketch@lustre@element:element(SQF))
) -> sketch@lustre@element:element(SQF).
h5_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"h5"/utf8>>, Attributes, Children).

-spec h6(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SQG)),
    list(sketch@lustre@element:element(SQG))
) -> sketch@lustre@element:element(SQG).
h6(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"h6"/utf8>>, Class, Attributes, Children).

-spec h6_(
    list(lustre@internals@vdom:attribute(SQH)),
    list(sketch@lustre@element:element(SQH))
) -> sketch@lustre@element:element(SQH).
h6_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"h6"/utf8>>, Attributes, Children).

-spec header(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SQI)),
    list(sketch@lustre@element:element(SQI))
) -> sketch@lustre@element:element(SQI).
header(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"header"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec header_(
    list(lustre@internals@vdom:attribute(SQJ)),
    list(sketch@lustre@element:element(SQJ))
) -> sketch@lustre@element:element(SQJ).
header_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"header"/utf8>>, Attributes, Children).

-spec hgroup(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SQK)),
    list(sketch@lustre@element:element(SQK))
) -> sketch@lustre@element:element(SQK).
hgroup(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"hgroup"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec hgroup_(
    list(lustre@internals@vdom:attribute(SQL)),
    list(sketch@lustre@element:element(SQL))
) -> sketch@lustre@element:element(SQL).
hgroup_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"hgroup"/utf8>>, Attributes, Children).

-spec hr(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SQM))
) -> sketch@lustre@element:element(SQM).
hr(Class, Attributes) ->
    sketch@lustre@element:element(<<"hr"/utf8>>, Class, Attributes, []).

-spec hr_(list(lustre@internals@vdom:attribute(SQO))) -> sketch@lustre@element:element(SQO).
hr_(Attributes) ->
    sketch@lustre@element:element_(<<"hr"/utf8>>, Attributes, []).

-spec i(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SQQ)),
    list(sketch@lustre@element:element(SQQ))
) -> sketch@lustre@element:element(SQQ).
i(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"i"/utf8>>, Class, Attributes, Children).

-spec i_(
    list(lustre@internals@vdom:attribute(SQR)),
    list(sketch@lustre@element:element(SQR))
) -> sketch@lustre@element:element(SQR).
i_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"i"/utf8>>, Attributes, Children).

-spec iframe(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SQS)),
    list(sketch@lustre@element:element(SQS))
) -> sketch@lustre@element:element(SQS).
iframe(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"iframe"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec iframe_(
    list(lustre@internals@vdom:attribute(SQT)),
    list(sketch@lustre@element:element(SQT))
) -> sketch@lustre@element:element(SQT).
iframe_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"iframe"/utf8>>, Attributes, Children).

-spec img(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SQU))
) -> sketch@lustre@element:element(SQU).
img(Class, Attributes) ->
    sketch@lustre@element:element(<<"img"/utf8>>, Class, Attributes, []).

-spec img_(list(lustre@internals@vdom:attribute(SQW))) -> sketch@lustre@element:element(SQW).
img_(Attributes) ->
    sketch@lustre@element:element_(<<"img"/utf8>>, Attributes, []).

-spec input(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SQY))
) -> sketch@lustre@element:element(SQY).
input(Class, Attributes) ->
    sketch@lustre@element:element(<<"input"/utf8>>, Class, Attributes, []).

-spec input_(list(lustre@internals@vdom:attribute(SRA))) -> sketch@lustre@element:element(SRA).
input_(Attributes) ->
    sketch@lustre@element:element_(<<"input"/utf8>>, Attributes, []).

-spec ins(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SRC)),
    list(sketch@lustre@element:element(SRC))
) -> sketch@lustre@element:element(SRC).
ins(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"ins"/utf8>>, Class, Attributes, Children).

-spec ins_(
    list(lustre@internals@vdom:attribute(SRD)),
    list(sketch@lustre@element:element(SRD))
) -> sketch@lustre@element:element(SRD).
ins_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"ins"/utf8>>, Attributes, Children).

-spec kbd(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SRE)),
    list(sketch@lustre@element:element(SRE))
) -> sketch@lustre@element:element(SRE).
kbd(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"kbd"/utf8>>, Class, Attributes, Children).

-spec kbd_(
    list(lustre@internals@vdom:attribute(SRF)),
    list(sketch@lustre@element:element(SRF))
) -> sketch@lustre@element:element(SRF).
kbd_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"kbd"/utf8>>, Attributes, Children).

-spec label(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SRG)),
    list(sketch@lustre@element:element(SRG))
) -> sketch@lustre@element:element(SRG).
label(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"label"/utf8>>, Class, Attributes, Children).

-spec label_(
    list(lustre@internals@vdom:attribute(SRH)),
    list(sketch@lustre@element:element(SRH))
) -> sketch@lustre@element:element(SRH).
label_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"label"/utf8>>, Attributes, Children).

-spec legend(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SRI)),
    list(sketch@lustre@element:element(SRI))
) -> sketch@lustre@element:element(SRI).
legend(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"legend"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec legend_(
    list(lustre@internals@vdom:attribute(SRJ)),
    list(sketch@lustre@element:element(SRJ))
) -> sketch@lustre@element:element(SRJ).
legend_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"legend"/utf8>>, Attributes, Children).

-spec li(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SRK)),
    list(sketch@lustre@element:element(SRK))
) -> sketch@lustre@element:element(SRK).
li(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"li"/utf8>>, Class, Attributes, Children).

-spec li_(
    list(lustre@internals@vdom:attribute(SRL)),
    list(sketch@lustre@element:element(SRL))
) -> sketch@lustre@element:element(SRL).
li_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"li"/utf8>>, Attributes, Children).

-spec main(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SRM)),
    list(sketch@lustre@element:element(SRM))
) -> sketch@lustre@element:element(SRM).
main(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"main"/utf8>>, Class, Attributes, Children).

-spec main_(
    list(lustre@internals@vdom:attribute(SRN)),
    list(sketch@lustre@element:element(SRN))
) -> sketch@lustre@element:element(SRN).
main_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"main"/utf8>>, Attributes, Children).

-spec map(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SRO)),
    list(sketch@lustre@element:element(SRO))
) -> sketch@lustre@element:element(SRO).
map(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"map"/utf8>>, Class, Attributes, Children).

-spec map_(
    list(lustre@internals@vdom:attribute(SRP)),
    list(sketch@lustre@element:element(SRP))
) -> sketch@lustre@element:element(SRP).
map_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"map"/utf8>>, Attributes, Children).

-spec mark(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SRQ)),
    list(sketch@lustre@element:element(SRQ))
) -> sketch@lustre@element:element(SRQ).
mark(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"mark"/utf8>>, Class, Attributes, Children).

-spec mark_(
    list(lustre@internals@vdom:attribute(SRR)),
    list(sketch@lustre@element:element(SRR))
) -> sketch@lustre@element:element(SRR).
mark_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"mark"/utf8>>, Attributes, Children).

-spec math(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SRS)),
    list(sketch@lustre@element:element(SRS))
) -> sketch@lustre@element:element(SRS).
math(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"math"/utf8>>, Class, Attributes, Children).

-spec math_(
    list(lustre@internals@vdom:attribute(SRT)),
    list(sketch@lustre@element:element(SRT))
) -> sketch@lustre@element:element(SRT).
math_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"math"/utf8>>, Attributes, Children).

-spec menu(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SRU)),
    list(sketch@lustre@element:element(SRU))
) -> sketch@lustre@element:element(SRU).
menu(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"menu"/utf8>>, Class, Attributes, Children).

-spec menu_(
    list(lustre@internals@vdom:attribute(SRV)),
    list(sketch@lustre@element:element(SRV))
) -> sketch@lustre@element:element(SRV).
menu_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"menu"/utf8>>, Attributes, Children).

-spec meter(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SRW)),
    list(sketch@lustre@element:element(SRW))
) -> sketch@lustre@element:element(SRW).
meter(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"meter"/utf8>>, Class, Attributes, Children).

-spec meter_(
    list(lustre@internals@vdom:attribute(SRX)),
    list(sketch@lustre@element:element(SRX))
) -> sketch@lustre@element:element(SRX).
meter_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"meter"/utf8>>, Attributes, Children).

-spec nav(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SRY)),
    list(sketch@lustre@element:element(SRY))
) -> sketch@lustre@element:element(SRY).
nav(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"nav"/utf8>>, Class, Attributes, Children).

-spec nav_(
    list(lustre@internals@vdom:attribute(SRZ)),
    list(sketch@lustre@element:element(SRZ))
) -> sketch@lustre@element:element(SRZ).
nav_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"nav"/utf8>>, Attributes, Children).

-spec noscript(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SSA)),
    list(sketch@lustre@element:element(SSA))
) -> sketch@lustre@element:element(SSA).
noscript(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"noscript"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec noscript_(
    list(lustre@internals@vdom:attribute(SSB)),
    list(sketch@lustre@element:element(SSB))
) -> sketch@lustre@element:element(SSB).
noscript_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"noscript"/utf8>>, Attributes, Children).

-spec object(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SSC)),
    list(sketch@lustre@element:element(SSC))
) -> sketch@lustre@element:element(SSC).
object(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"object"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec object_(
    list(lustre@internals@vdom:attribute(SSD)),
    list(sketch@lustre@element:element(SSD))
) -> sketch@lustre@element:element(SSD).
object_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"object"/utf8>>, Attributes, Children).

-spec ol(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SSE)),
    list(sketch@lustre@element:element(SSE))
) -> sketch@lustre@element:element(SSE).
ol(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"ol"/utf8>>, Class, Attributes, Children).

-spec ol_(
    list(lustre@internals@vdom:attribute(SSF)),
    list(sketch@lustre@element:element(SSF))
) -> sketch@lustre@element:element(SSF).
ol_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"ol"/utf8>>, Attributes, Children).

-spec optgroup(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SSG)),
    list(sketch@lustre@element:element(SSG))
) -> sketch@lustre@element:element(SSG).
optgroup(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"optgroup"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec optgroup_(
    list(lustre@internals@vdom:attribute(SSH)),
    list(sketch@lustre@element:element(SSH))
) -> sketch@lustre@element:element(SSH).
optgroup_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"optgroup"/utf8>>, Attributes, Children).

-spec option(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SSI)),
    list(sketch@lustre@element:element(SSI))
) -> sketch@lustre@element:element(SSI).
option(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"option"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec option_(
    list(lustre@internals@vdom:attribute(SSJ)),
    list(sketch@lustre@element:element(SSJ))
) -> sketch@lustre@element:element(SSJ).
option_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"option"/utf8>>, Attributes, Children).

-spec output(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SSK)),
    list(sketch@lustre@element:element(SSK))
) -> sketch@lustre@element:element(SSK).
output(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"output"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec output_(
    list(lustre@internals@vdom:attribute(SSL)),
    list(sketch@lustre@element:element(SSL))
) -> sketch@lustre@element:element(SSL).
output_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"output"/utf8>>, Attributes, Children).

-spec p(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SSM)),
    list(sketch@lustre@element:element(SSM))
) -> sketch@lustre@element:element(SSM).
p(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"p"/utf8>>, Class, Attributes, Children).

-spec p_(
    list(lustre@internals@vdom:attribute(SSN)),
    list(sketch@lustre@element:element(SSN))
) -> sketch@lustre@element:element(SSN).
p_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"p"/utf8>>, Attributes, Children).

-spec picture(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SSO)),
    list(sketch@lustre@element:element(SSO))
) -> sketch@lustre@element:element(SSO).
picture(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"picture"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec picture_(
    list(lustre@internals@vdom:attribute(SSP)),
    list(sketch@lustre@element:element(SSP))
) -> sketch@lustre@element:element(SSP).
picture_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"picture"/utf8>>, Attributes, Children).

-spec portal(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SSQ)),
    list(sketch@lustre@element:element(SSQ))
) -> sketch@lustre@element:element(SSQ).
portal(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"portal"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec portal_(
    list(lustre@internals@vdom:attribute(SSR)),
    list(sketch@lustre@element:element(SSR))
) -> sketch@lustre@element:element(SSR).
portal_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"portal"/utf8>>, Attributes, Children).

-spec pre(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SSS)),
    list(sketch@lustre@element:element(SSS))
) -> sketch@lustre@element:element(SSS).
pre(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"pre"/utf8>>, Class, Attributes, Children).

-spec pre_(
    list(lustre@internals@vdom:attribute(SST)),
    list(sketch@lustre@element:element(SST))
) -> sketch@lustre@element:element(SST).
pre_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"pre"/utf8>>, Attributes, Children).

-spec progress(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SSU)),
    list(sketch@lustre@element:element(SSU))
) -> sketch@lustre@element:element(SSU).
progress(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"progress"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec progress_(
    list(lustre@internals@vdom:attribute(SSV)),
    list(sketch@lustre@element:element(SSV))
) -> sketch@lustre@element:element(SSV).
progress_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"progress"/utf8>>, Attributes, Children).

-spec q(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SSW)),
    list(sketch@lustre@element:element(SSW))
) -> sketch@lustre@element:element(SSW).
q(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"q"/utf8>>, Class, Attributes, Children).

-spec q_(
    list(lustre@internals@vdom:attribute(SSX)),
    list(sketch@lustre@element:element(SSX))
) -> sketch@lustre@element:element(SSX).
q_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"q"/utf8>>, Attributes, Children).

-spec rp(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SSY)),
    list(sketch@lustre@element:element(SSY))
) -> sketch@lustre@element:element(SSY).
rp(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"rp"/utf8>>, Class, Attributes, Children).

-spec rp_(
    list(lustre@internals@vdom:attribute(SSZ)),
    list(sketch@lustre@element:element(SSZ))
) -> sketch@lustre@element:element(SSZ).
rp_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"rp"/utf8>>, Attributes, Children).

-spec rt(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(STA)),
    list(sketch@lustre@element:element(STA))
) -> sketch@lustre@element:element(STA).
rt(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"rt"/utf8>>, Class, Attributes, Children).

-spec rt_(
    list(lustre@internals@vdom:attribute(STB)),
    list(sketch@lustre@element:element(STB))
) -> sketch@lustre@element:element(STB).
rt_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"rt"/utf8>>, Attributes, Children).

-spec ruby(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(STC)),
    list(sketch@lustre@element:element(STC))
) -> sketch@lustre@element:element(STC).
ruby(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"ruby"/utf8>>, Class, Attributes, Children).

-spec ruby_(
    list(lustre@internals@vdom:attribute(STD)),
    list(sketch@lustre@element:element(STD))
) -> sketch@lustre@element:element(STD).
ruby_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"ruby"/utf8>>, Attributes, Children).

-spec s(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(STE)),
    list(sketch@lustre@element:element(STE))
) -> sketch@lustre@element:element(STE).
s(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"s"/utf8>>, Class, Attributes, Children).

-spec s_(
    list(lustre@internals@vdom:attribute(STF)),
    list(sketch@lustre@element:element(STF))
) -> sketch@lustre@element:element(STF).
s_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"s"/utf8>>, Attributes, Children).

-spec samp(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(STG)),
    list(sketch@lustre@element:element(STG))
) -> sketch@lustre@element:element(STG).
samp(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"samp"/utf8>>, Class, Attributes, Children).

-spec samp_(
    list(lustre@internals@vdom:attribute(STH)),
    list(sketch@lustre@element:element(STH))
) -> sketch@lustre@element:element(STH).
samp_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"samp"/utf8>>, Attributes, Children).

-spec script(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(STI)),
    list(sketch@lustre@element:element(STI))
) -> sketch@lustre@element:element(STI).
script(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"script"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec script_(
    list(lustre@internals@vdom:attribute(STJ)),
    list(sketch@lustre@element:element(STJ))
) -> sketch@lustre@element:element(STJ).
script_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"script"/utf8>>, Attributes, Children).

-spec search(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(STK)),
    list(sketch@lustre@element:element(STK))
) -> sketch@lustre@element:element(STK).
search(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"search"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec search_(
    list(lustre@internals@vdom:attribute(STL)),
    list(sketch@lustre@element:element(STL))
) -> sketch@lustre@element:element(STL).
search_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"search"/utf8>>, Attributes, Children).

-spec section(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(STM)),
    list(sketch@lustre@element:element(STM))
) -> sketch@lustre@element:element(STM).
section(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"section"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec section_(
    list(lustre@internals@vdom:attribute(STN)),
    list(sketch@lustre@element:element(STN))
) -> sketch@lustre@element:element(STN).
section_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"section"/utf8>>, Attributes, Children).

-spec select(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(STO)),
    list(sketch@lustre@element:element(STO))
) -> sketch@lustre@element:element(STO).
select(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"select"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec select_(
    list(lustre@internals@vdom:attribute(STP)),
    list(sketch@lustre@element:element(STP))
) -> sketch@lustre@element:element(STP).
select_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"select"/utf8>>, Attributes, Children).

-spec slot(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(STQ)),
    list(sketch@lustre@element:element(STQ))
) -> sketch@lustre@element:element(STQ).
slot(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"slot"/utf8>>, Class, Attributes, Children).

-spec slot_(
    list(lustre@internals@vdom:attribute(STR)),
    list(sketch@lustre@element:element(STR))
) -> sketch@lustre@element:element(STR).
slot_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"slot"/utf8>>, Attributes, Children).

-spec small(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(STS)),
    list(sketch@lustre@element:element(STS))
) -> sketch@lustre@element:element(STS).
small(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"small"/utf8>>, Class, Attributes, Children).

-spec small_(
    list(lustre@internals@vdom:attribute(STT)),
    list(sketch@lustre@element:element(STT))
) -> sketch@lustre@element:element(STT).
small_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"small"/utf8>>, Attributes, Children).

-spec source(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(STU))
) -> sketch@lustre@element:element(STU).
source(Class, Attributes) ->
    sketch@lustre@element:element(<<"source"/utf8>>, Class, Attributes, []).

-spec source_(list(lustre@internals@vdom:attribute(STW))) -> sketch@lustre@element:element(STW).
source_(Attributes) ->
    sketch@lustre@element:element_(<<"source"/utf8>>, Attributes, []).

-spec span(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(STY)),
    list(sketch@lustre@element:element(STY))
) -> sketch@lustre@element:element(STY).
span(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"span"/utf8>>, Class, Attributes, Children).

-spec span_(
    list(lustre@internals@vdom:attribute(STZ)),
    list(sketch@lustre@element:element(STZ))
) -> sketch@lustre@element:element(STZ).
span_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"span"/utf8>>, Attributes, Children).

-spec strong(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SUA)),
    list(sketch@lustre@element:element(SUA))
) -> sketch@lustre@element:element(SUA).
strong(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"strong"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec strong_(
    list(lustre@internals@vdom:attribute(SUB)),
    list(sketch@lustre@element:element(SUB))
) -> sketch@lustre@element:element(SUB).
strong_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"strong"/utf8>>, Attributes, Children).

-spec sub(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SUC)),
    list(sketch@lustre@element:element(SUC))
) -> sketch@lustre@element:element(SUC).
sub(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"sub"/utf8>>, Class, Attributes, Children).

-spec sub_(
    list(lustre@internals@vdom:attribute(SUD)),
    list(sketch@lustre@element:element(SUD))
) -> sketch@lustre@element:element(SUD).
sub_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"sub"/utf8>>, Attributes, Children).

-spec summary(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SUE)),
    list(sketch@lustre@element:element(SUE))
) -> sketch@lustre@element:element(SUE).
summary(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"summary"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec summary_(
    list(lustre@internals@vdom:attribute(SUF)),
    list(sketch@lustre@element:element(SUF))
) -> sketch@lustre@element:element(SUF).
summary_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"summary"/utf8>>, Attributes, Children).

-spec sup(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SUG)),
    list(sketch@lustre@element:element(SUG))
) -> sketch@lustre@element:element(SUG).
sup(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"sup"/utf8>>, Class, Attributes, Children).

-spec sup_(
    list(lustre@internals@vdom:attribute(SUH)),
    list(sketch@lustre@element:element(SUH))
) -> sketch@lustre@element:element(SUH).
sup_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"sup"/utf8>>, Attributes, Children).

-spec svg(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SUI)),
    list(sketch@lustre@element:element(SUI))
) -> sketch@lustre@element:element(SUI).
svg(Class, Attributes, Children) ->
    sketch@lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"svg"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec svg_(
    list(lustre@internals@vdom:attribute(SUJ)),
    list(sketch@lustre@element:element(SUJ))
) -> sketch@lustre@element:element(SUJ).
svg_(Attributes, Children) ->
    sketch@lustre@element:namespaced_(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"svg"/utf8>>,
        Attributes,
        Children
    ).

-spec table(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SUK)),
    list(sketch@lustre@element:element(SUK))
) -> sketch@lustre@element:element(SUK).
table(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"table"/utf8>>, Class, Attributes, Children).

-spec table_(
    list(lustre@internals@vdom:attribute(SUL)),
    list(sketch@lustre@element:element(SUL))
) -> sketch@lustre@element:element(SUL).
table_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"table"/utf8>>, Attributes, Children).

-spec tbody(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SUM)),
    list(sketch@lustre@element:element(SUM))
) -> sketch@lustre@element:element(SUM).
tbody(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"tbody"/utf8>>, Class, Attributes, Children).

-spec tbody_(
    list(lustre@internals@vdom:attribute(SUN)),
    list(sketch@lustre@element:element(SUN))
) -> sketch@lustre@element:element(SUN).
tbody_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"tbody"/utf8>>, Attributes, Children).

-spec td(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SUO)),
    list(sketch@lustre@element:element(SUO))
) -> sketch@lustre@element:element(SUO).
td(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"td"/utf8>>, Class, Attributes, Children).

-spec td_(
    list(lustre@internals@vdom:attribute(SUP)),
    list(sketch@lustre@element:element(SUP))
) -> sketch@lustre@element:element(SUP).
td_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"td"/utf8>>, Attributes, Children).

-spec template(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SUQ)),
    list(sketch@lustre@element:element(SUQ))
) -> sketch@lustre@element:element(SUQ).
template(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"template"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec template_(
    list(lustre@internals@vdom:attribute(SUR)),
    list(sketch@lustre@element:element(SUR))
) -> sketch@lustre@element:element(SUR).
template_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"template"/utf8>>, Attributes, Children).

-spec textarea(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SUS)),
    list(sketch@lustre@element:element(SUS))
) -> sketch@lustre@element:element(SUS).
textarea(Class, Attributes, Children) ->
    sketch@lustre@element:element(
        <<"textarea"/utf8>>,
        Class,
        Attributes,
        Children
    ).

-spec textarea_(
    list(lustre@internals@vdom:attribute(SUT)),
    list(sketch@lustre@element:element(SUT))
) -> sketch@lustre@element:element(SUT).
textarea_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"textarea"/utf8>>, Attributes, Children).

-spec tfoot(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SUU)),
    list(sketch@lustre@element:element(SUU))
) -> sketch@lustre@element:element(SUU).
tfoot(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"tfoot"/utf8>>, Class, Attributes, Children).

-spec tfoot_(
    list(lustre@internals@vdom:attribute(SUV)),
    list(sketch@lustre@element:element(SUV))
) -> sketch@lustre@element:element(SUV).
tfoot_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"tfoot"/utf8>>, Attributes, Children).

-spec th(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SUW)),
    list(sketch@lustre@element:element(SUW))
) -> sketch@lustre@element:element(SUW).
th(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"th"/utf8>>, Class, Attributes, Children).

-spec th_(
    list(lustre@internals@vdom:attribute(SUX)),
    list(sketch@lustre@element:element(SUX))
) -> sketch@lustre@element:element(SUX).
th_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"th"/utf8>>, Attributes, Children).

-spec thead(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SUY)),
    list(sketch@lustre@element:element(SUY))
) -> sketch@lustre@element:element(SUY).
thead(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"thead"/utf8>>, Class, Attributes, Children).

-spec thead_(
    list(lustre@internals@vdom:attribute(SUZ)),
    list(sketch@lustre@element:element(SUZ))
) -> sketch@lustre@element:element(SUZ).
thead_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"thead"/utf8>>, Attributes, Children).

-spec time(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SVA)),
    list(sketch@lustre@element:element(SVA))
) -> sketch@lustre@element:element(SVA).
time(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"time"/utf8>>, Class, Attributes, Children).

-spec time_(
    list(lustre@internals@vdom:attribute(SVB)),
    list(sketch@lustre@element:element(SVB))
) -> sketch@lustre@element:element(SVB).
time_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"time"/utf8>>, Attributes, Children).

-spec tr(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SVC)),
    list(sketch@lustre@element:element(SVC))
) -> sketch@lustre@element:element(SVC).
tr(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"tr"/utf8>>, Class, Attributes, Children).

-spec tr_(
    list(lustre@internals@vdom:attribute(SVD)),
    list(sketch@lustre@element:element(SVD))
) -> sketch@lustre@element:element(SVD).
tr_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"tr"/utf8>>, Attributes, Children).

-spec track(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SVE))
) -> sketch@lustre@element:element(SVE).
track(Class, Attributes) ->
    sketch@lustre@element:element(<<"track"/utf8>>, Class, Attributes, []).

-spec track_(list(lustre@internals@vdom:attribute(SVG))) -> sketch@lustre@element:element(SVG).
track_(Attributes) ->
    sketch@lustre@element:element_(<<"track"/utf8>>, Attributes, []).

-spec u(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SVI)),
    list(sketch@lustre@element:element(SVI))
) -> sketch@lustre@element:element(SVI).
u(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"u"/utf8>>, Class, Attributes, Children).

-spec u_(
    list(lustre@internals@vdom:attribute(SVJ)),
    list(sketch@lustre@element:element(SVJ))
) -> sketch@lustre@element:element(SVJ).
u_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"u"/utf8>>, Attributes, Children).

-spec ul(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SVK)),
    list(sketch@lustre@element:element(SVK))
) -> sketch@lustre@element:element(SVK).
ul(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"ul"/utf8>>, Class, Attributes, Children).

-spec ul_(
    list(lustre@internals@vdom:attribute(SVL)),
    list(sketch@lustre@element:element(SVL))
) -> sketch@lustre@element:element(SVL).
ul_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"ul"/utf8>>, Attributes, Children).

-spec var(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SVM)),
    list(sketch@lustre@element:element(SVM))
) -> sketch@lustre@element:element(SVM).
var(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"var"/utf8>>, Class, Attributes, Children).

-spec var_(
    list(lustre@internals@vdom:attribute(SVN)),
    list(sketch@lustre@element:element(SVN))
) -> sketch@lustre@element:element(SVN).
var_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"var"/utf8>>, Attributes, Children).

-spec video(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SVO)),
    list(sketch@lustre@element:element(SVO))
) -> sketch@lustre@element:element(SVO).
video(Class, Attributes, Children) ->
    sketch@lustre@element:element(<<"video"/utf8>>, Class, Attributes, Children).

-spec video_(
    list(lustre@internals@vdom:attribute(SVP)),
    list(sketch@lustre@element:element(SVP))
) -> sketch@lustre@element:element(SVP).
video_(Attributes, Children) ->
    sketch@lustre@element:element_(<<"video"/utf8>>, Attributes, Children).

-spec wbr(
    sketch@internals@style:class(),
    list(lustre@internals@vdom:attribute(SVQ))
) -> sketch@lustre@element:element(SVQ).
wbr(Class, Attributes) ->
    sketch@lustre@element:element(<<"wbr"/utf8>>, Class, Attributes, []).

-spec wbr_(list(lustre@internals@vdom:attribute(SVS))) -> sketch@lustre@element:element(SVS).
wbr_(Attributes) ->
    sketch@lustre@element:element_(<<"wbr"/utf8>>, Attributes, []).
