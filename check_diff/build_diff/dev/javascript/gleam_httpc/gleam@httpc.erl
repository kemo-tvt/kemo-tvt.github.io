-module(gleam@httpc).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([configure/0, verify_tls/2, dispatch_bits/2, send_bits/1, dispatch/2, send/1]).
-export_type([erl_http_option/0, body_format/0, erl_option/0, socket_opt/0, inet6fb4/0, erl_ssl_option/0, erl_verify_option/0, configuration/0]).

-type erl_http_option() :: {ssl, list(erl_ssl_option())} |
    {autoredirect, boolean()}.

-type body_format() :: binary.

-type erl_option() :: {body_format, body_format()} |
    {socket_opts, list(socket_opt())}.

-type socket_opt() :: {ipfamily, inet6fb4()}.

-type inet6fb4() :: inet6fb4.

-type erl_ssl_option() :: {verify, erl_verify_option()}.

-type erl_verify_option() :: verify_none.

-opaque configuration() :: {builder, boolean()}.

-file("/Users/louis/src/gleam/httpc/src/gleam/httpc.gleam", 66).
-spec string_header(
    {gleam@erlang@charlist:charlist(), gleam@erlang@charlist:charlist()}
) -> {binary(), binary()}.
string_header(Header) ->
    {K, V} = Header,
    {unicode:characters_to_binary(K), unicode:characters_to_binary(V)}.

-file("/Users/louis/src/gleam/httpc/src/gleam/httpc.gleam", 142).
-spec configure() -> configuration().
configure() ->
    {builder, true}.

-file("/Users/louis/src/gleam/httpc/src/gleam/httpc.gleam", 155).
-spec verify_tls(configuration(), boolean()) -> configuration().
verify_tls(_, Which) ->
    {builder, Which}.

-file("/Users/louis/src/gleam/httpc/src/gleam/httpc.gleam", 190).
-spec prepare_headers_loop(
    list({binary(), binary()}),
    list({gleam@erlang@charlist:charlist(), gleam@erlang@charlist:charlist()}),
    boolean()
) -> list({gleam@erlang@charlist:charlist(), gleam@erlang@charlist:charlist()}).
prepare_headers_loop(In, Out, User_agent_set) ->
    case In of
        [] when User_agent_set ->
            Out;

        [] ->
            [gleam_httpc_ffi:default_user_agent() | Out];

        [{K, V} | In@1] ->
            User_agent_set@1 = User_agent_set orelse (K =:= <<"user-agent"/utf8>>),
            Out@1 = [{unicode:characters_to_list(K),
                    unicode:characters_to_list(V)} |
                Out],
            prepare_headers_loop(In@1, Out@1, User_agent_set@1)
    end.

-file("/Users/louis/src/gleam/httpc/src/gleam/httpc.gleam", 184).
-spec prepare_headers(list({binary(), binary()})) -> list({gleam@erlang@charlist:charlist(),
    gleam@erlang@charlist:charlist()}).
prepare_headers(Headers) ->
    prepare_headers_loop(Headers, [], false).

-file("/Users/louis/src/gleam/httpc/src/gleam/httpc.gleam", 84).
-spec dispatch_bits(configuration(), gleam@http@request:request(bitstring())) -> {ok,
        gleam@http@response:response(bitstring())} |
    {error, gleam@dynamic:dynamic_()}.
dispatch_bits(Config, Req) ->
    Erl_url = begin
        _pipe = Req,
        _pipe@1 = gleam@http@request:to_uri(_pipe),
        _pipe@2 = gleam@uri:to_string(_pipe@1),
        unicode:characters_to_list(_pipe@2)
    end,
    Erl_headers = prepare_headers(erlang:element(3, Req)),
    Erl_http_options = [{autoredirect, false}],
    Erl_http_options@1 = case erlang:element(2, Config) of
        true ->
            Erl_http_options;

        false ->
            [{ssl, [{verify, verify_none}]} | Erl_http_options]
    end,
    Erl_options = [{body_format, binary}, {socket_opts, [{ipfamily, inet6fb4}]}],
    gleam@result:then(case erlang:element(2, Req) of
            options ->
                Erl_req = {Erl_url, Erl_headers},
                httpc:request(
                    erlang:element(2, Req),
                    Erl_req,
                    Erl_http_options@1,
                    Erl_options
                );

            head ->
                Erl_req = {Erl_url, Erl_headers},
                httpc:request(
                    erlang:element(2, Req),
                    Erl_req,
                    Erl_http_options@1,
                    Erl_options
                );

            get ->
                Erl_req = {Erl_url, Erl_headers},
                httpc:request(
                    erlang:element(2, Req),
                    Erl_req,
                    Erl_http_options@1,
                    Erl_options
                );

            _ ->
                Erl_content_type = begin
                    _pipe@3 = Req,
                    _pipe@4 = gleam@http@request:get_header(
                        _pipe@3,
                        <<"content-type"/utf8>>
                    ),
                    _pipe@5 = gleam@result:unwrap(
                        _pipe@4,
                        <<"application/octet-stream"/utf8>>
                    ),
                    unicode:characters_to_list(_pipe@5)
                end,
                Erl_req@1 = {Erl_url,
                    Erl_headers,
                    Erl_content_type,
                    erlang:element(4, Req)},
                httpc:request(
                    erlang:element(2, Req),
                    Erl_req@1,
                    Erl_http_options@1,
                    Erl_options
                )
        end, fun(Response) ->
            {{_, Status, _}, Headers, Resp_body} = Response,
            {ok,
                {response,
                    Status,
                    gleam@list:map(Headers, fun string_header/1),
                    Resp_body}}
        end).

-file("/Users/louis/src/gleam/httpc/src/gleam/httpc.gleam", 76).
-spec send_bits(gleam@http@request:request(bitstring())) -> {ok,
        gleam@http@response:response(bitstring())} |
    {error, gleam@dynamic:dynamic_()}.
send_bits(Req) ->
    _pipe = configure(),
    dispatch_bits(_pipe, Req).

-file("/Users/louis/src/gleam/httpc/src/gleam/httpc.gleam", 161).
-spec dispatch(configuration(), gleam@http@request:request(binary())) -> {ok,
        gleam@http@response:response(binary())} |
    {error, gleam@dynamic:dynamic_()}.
dispatch(Config, Request) ->
    Request@1 = gleam@http@request:map(Request, fun gleam_stdlib:identity/1),
    gleam@result:'try'(
        dispatch_bits(Config, Request@1),
        fun(Resp) -> case gleam@bit_array:to_string(erlang:element(4, Resp)) of
                {ok, Body} ->
                    {ok, gleam@http@response:set_body(Resp, Body)};

                {error, _} ->
                    {error,
                        gleam@dynamic:from(
                            <<"Response body was not valid UTF-8"/utf8>>
                        )}
            end end
    ).

-file("/Users/louis/src/gleam/httpc/src/gleam/httpc.gleam", 179).
-spec send(gleam@http@request:request(binary())) -> {ok,
        gleam@http@response:response(binary())} |
    {error, gleam@dynamic:dynamic_()}.
send(Req) ->
    _pipe = configure(),
    dispatch(_pipe, Req).
