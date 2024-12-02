-module(gleam@json).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([decode_bits/2, decode/2, to_string/1, to_string_tree/1, to_string_builder/1, string/1, bool/1, int/1, float/1, null/0, nullable/2, object/1, preprocessed_array/1, array/2]).
-export_type([json/0, decode_error/0]).

-type json() :: any().

-type decode_error() :: unexpected_end_of_input |
    {unexpected_byte, binary()} |
    {unexpected_sequence, binary()} |
    {unexpected_format, list(gleam@dynamic:decode_error())}.

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 86).
-spec decode_bits(
    bitstring(),
    fun((gleam@dynamic:dynamic_()) -> {ok, FWW} |
        {error, list(gleam@dynamic:decode_error())})
) -> {ok, FWW} | {error, decode_error()}.
decode_bits(Json, Decoder) ->
    gleam@result:then(
        gleam_json_ffi:decode(Json),
        fun(Dynamic_value) -> _pipe = Decoder(Dynamic_value),
            gleam@result:map_error(
                _pipe,
                fun(Field@0) -> {unexpected_format, Field@0} end
            ) end
    ).

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 45).
-spec do_decode(
    binary(),
    fun((gleam@dynamic:dynamic_()) -> {ok, FWQ} |
        {error, list(gleam@dynamic:decode_error())})
) -> {ok, FWQ} | {error, decode_error()}.
do_decode(Json, Decoder) ->
    Bits = gleam_stdlib:identity(Json),
    decode_bits(Bits, Decoder).

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 37).
-spec decode(
    binary(),
    fun((gleam@dynamic:dynamic_()) -> {ok, FWM} |
        {error, list(gleam@dynamic:decode_error())})
) -> {ok, FWM} | {error, decode_error()}.
decode(Json, Decoder) ->
    do_decode(Json, Decoder).

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 115).
-spec to_string(json()) -> binary().
to_string(Json) ->
    gleam_json_ffi:json_to_string(Json).

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 156).
-spec to_string_tree(json()) -> gleam@string_tree:string_tree().
to_string_tree(Json) ->
    gleam_json_ffi:json_to_iodata(Json).

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 137).
-spec to_string_builder(json()) -> gleam@string_tree:string_tree().
to_string_builder(Json) ->
    gleam_json_ffi:json_to_iodata(Json).

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 167).
-spec string(binary()) -> json().
string(Input) ->
    gleam_json_ffi:string(Input).

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 184).
-spec bool(boolean()) -> json().
bool(Input) ->
    gleam_json_ffi:bool(Input).

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 201).
-spec int(integer()) -> json().
int(Input) ->
    gleam_json_ffi:int(Input).

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 218).
-spec float(float()) -> json().
float(Input) ->
    gleam_json_ffi:float(Input).

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 235).
-spec null() -> json().
null() ->
    gleam_json_ffi:null().

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 257).
-spec nullable(gleam@option:option(FXC), fun((FXC) -> json())) -> json().
nullable(Input, Inner_type) ->
    case Input of
        {some, Value} ->
            Inner_type(Value);

        none ->
            null()
    end.

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 276).
-spec object(list({binary(), json()})) -> json().
object(Entries) ->
    gleam_json_ffi:object(Entries).

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 308).
-spec preprocessed_array(list(json())) -> json().
preprocessed_array(From) ->
    gleam_json_ffi:array(From).

-file("/Users/louis/src/gleam/json/src/gleam/json.gleam", 293).
-spec array(list(FXG), fun((FXG) -> json())) -> json().
array(Entries, Inner_type) ->
    _pipe = Entries,
    _pipe@1 = gleam@list:map(_pipe, Inner_type),
    preprocessed_array(_pipe@1).
