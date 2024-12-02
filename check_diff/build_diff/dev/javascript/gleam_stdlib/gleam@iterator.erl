-module(gleam@iterator).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([unfold/2, repeatedly/1, repeat/1, from_list/1, transform/3, fold/3, run/1, to_list/1, step/1, take/2, drop/2, map/2, map2/3, append/2, flatten/1, concat/1, flat_map/2, filter/2, filter_map/2, cycle/1, find/2, find_map/2, index/1, iterate/2, take_while/2, drop_while/2, scan/3, zip/2, chunk/2, sized_chunk/2, intersperse/2, any/2, all/2, group/2, reduce/2, last/1, empty/0, once/1, range/2, single/1, interleave/2, fold_until/3, try_fold/3, first/1, at/2, length/1, each/2, yield/2]).
-export_type([action/1, iterator/1, step/2, chunk/2, sized_chunk/1]).

-type action(DSZ) :: stop | {continue, DSZ, fun(() -> action(DSZ))}.

-opaque iterator(DTA) :: {iterator, fun(() -> action(DTA))}.

-type step(DTB, DTC) :: {next, DTB, DTC} | done.

-type chunk(DTD, DTE) :: {another_by,
        list(DTD),
        DTE,
        DTD,
        fun(() -> action(DTD))} |
    {last_by, list(DTD)}.

-type sized_chunk(DTF) :: {another, list(DTF), fun(() -> action(DTF))} |
    {last, list(DTF)} |
    no_more.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 37).
-spec stop() -> action(any()).
stop() ->
    stop.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 72).
-spec unfold_loop(DTN, fun((DTN) -> step(DTO, DTN))) -> fun(() -> action(DTO)).
unfold_loop(Initial, F) ->
    fun() -> case F(Initial) of
            {next, X, Acc} ->
                {continue, X, unfold_loop(Acc, F)};

            done ->
                stop
        end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 62).
-spec unfold(DTI, fun((DTI) -> step(DTJ, DTI))) -> iterator(DTJ).
unfold(Initial, F) ->
    _pipe = Initial,
    _pipe@1 = unfold_loop(_pipe, F),
    {iterator, _pipe@1}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 94).
-spec repeatedly(fun(() -> DTS)) -> iterator(DTS).
repeatedly(F) ->
    unfold(nil, fun(_) -> {next, F(), nil} end).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 109).
-spec repeat(DTU) -> iterator(DTU).
repeat(X) ->
    repeatedly(fun() -> X end).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 123).
-spec from_list(list(DTW)) -> iterator(DTW).
from_list(List) ->
    Yield = fun(Acc) -> case Acc of
            [] ->
                done;

            [Head | Tail] ->
                {next, Head, Tail}
        end end,
    unfold(List, Yield).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 134).
-spec transform_loop(
    fun(() -> action(DTZ)),
    DUB,
    fun((DUB, DTZ) -> step(DUC, DUB))
) -> fun(() -> action(DUC)).
transform_loop(Continuation, State, F) ->
    fun() -> case Continuation() of
            stop ->
                stop;

            {continue, El, Next} ->
                case F(State, El) of
                    done ->
                        stop;

                    {next, Yield, Next_state} ->
                        {continue, Yield, transform_loop(Next, Next_state, F)}
                end
        end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 169).
-spec transform(iterator(DUG), DUI, fun((DUI, DUG) -> step(DUJ, DUI))) -> iterator(DUJ).
transform(Iterator, Initial, F) ->
    _pipe = transform_loop(erlang:element(2, Iterator), Initial, F),
    {iterator, _pipe}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 204).
-spec fold_loop(fun(() -> action(DUQ)), fun((DUS, DUQ) -> DUS), DUS) -> DUS.
fold_loop(Continuation, F, Accumulator) ->
    case Continuation() of
        {continue, Elem, Next} ->
            fold_loop(Next, F, F(Accumulator, Elem));

        stop ->
            Accumulator
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 195).
-spec fold(iterator(DUN), DUP, fun((DUP, DUN) -> DUP)) -> DUP.
fold(Iterator, Initial, F) ->
    _pipe = erlang:element(2, Iterator),
    fold_loop(_pipe, F, Initial).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 220).
-spec run(iterator(any())) -> nil.
run(Iterator) ->
    fold(Iterator, nil, fun(_, _) -> nil end).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 238).
-spec to_list(iterator(DUV)) -> list(DUV).
to_list(Iterator) ->
    _pipe = Iterator,
    _pipe@1 = fold(_pipe, [], fun(Acc, E) -> [E | Acc] end),
    lists:reverse(_pipe@1).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 266).
-spec step(iterator(DUY)) -> step(DUY, iterator(DUY)).
step(Iterator) ->
    case (erlang:element(2, Iterator))() of
        stop ->
            done;

        {continue, E, A} ->
            {next, E, {iterator, A}}
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 299).
-spec take_loop(fun(() -> action(DVG)), integer()) -> fun(() -> action(DVG)).
take_loop(Continuation, Desired) ->
    fun() -> case Desired > 0 of
            false ->
                stop;

            true ->
                case Continuation() of
                    stop ->
                        stop;

                    {continue, E, Next} ->
                        {continue, E, take_loop(Next, Desired - 1)}
                end
        end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 293).
-spec take(iterator(DVD), integer()) -> iterator(DVD).
take(Iterator, Desired) ->
    _pipe = erlang:element(2, Iterator),
    _pipe@1 = take_loop(_pipe, Desired),
    {iterator, _pipe@1}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 342).
-spec drop_loop(fun(() -> action(DVM)), integer()) -> action(DVM).
drop_loop(Continuation, Desired) ->
    case Continuation() of
        stop ->
            stop;

        {continue, E, Next} ->
            case Desired > 0 of
                true ->
                    drop_loop(Next, Desired - 1);

                false ->
                    {continue, E, Next}
            end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 337).
-spec drop(iterator(DVJ), integer()) -> iterator(DVJ).
drop(Iterator, Desired) ->
    _pipe = fun() -> drop_loop(erlang:element(2, Iterator), Desired) end,
    {iterator, _pipe}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 376).
-spec map_loop(fun(() -> action(DVT)), fun((DVT) -> DVV)) -> fun(() -> action(DVV)).
map_loop(Continuation, F) ->
    fun() -> case Continuation() of
            stop ->
                stop;

            {continue, E, Continuation@1} ->
                {continue, F(E), map_loop(Continuation@1, F)}
        end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 370).
-spec map(iterator(DVP), fun((DVP) -> DVR)) -> iterator(DVR).
map(Iterator, F) ->
    _pipe = erlang:element(2, Iterator),
    _pipe@1 = map_loop(_pipe, F),
    {iterator, _pipe@1}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 417).
-spec map2_loop(
    fun(() -> action(DWD)),
    fun(() -> action(DWF)),
    fun((DWD, DWF) -> DWH)
) -> fun(() -> action(DWH)).
map2_loop(Continuation1, Continuation2, Fun) ->
    fun() -> case Continuation1() of
            stop ->
                stop;

            {continue, A, Next_a} ->
                case Continuation2() of
                    stop ->
                        stop;

                    {continue, B, Next_b} ->
                        {continue, Fun(A, B), map2_loop(Next_a, Next_b, Fun)}
                end
        end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 408).
-spec map2(iterator(DVX), iterator(DVZ), fun((DVX, DVZ) -> DWB)) -> iterator(DWB).
map2(Iterator1, Iterator2, Fun) ->
    _pipe = map2_loop(
        erlang:element(2, Iterator1),
        erlang:element(2, Iterator2),
        Fun
    ),
    {iterator, _pipe}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 454).
-spec append_loop(fun(() -> action(DWN)), fun(() -> action(DWN))) -> action(DWN).
append_loop(First, Second) ->
    case First() of
        {continue, E, First@1} ->
            {continue, E, fun() -> append_loop(First@1, Second) end};

        stop ->
            Second()
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 449).
-spec append(iterator(DWJ), iterator(DWJ)) -> iterator(DWJ).
append(First, Second) ->
    _pipe = fun() ->
        append_loop(erlang:element(2, First), erlang:element(2, Second))
    end,
    {iterator, _pipe}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 481).
-spec flatten_loop(fun(() -> action(iterator(DWV)))) -> action(DWV).
flatten_loop(Flattened) ->
    case Flattened() of
        stop ->
            stop;

        {continue, It, Next_iterator} ->
            append_loop(
                erlang:element(2, It),
                fun() -> flatten_loop(Next_iterator) end
            )
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 476).
-spec flatten(iterator(iterator(DWR))) -> iterator(DWR).
flatten(Iterator) ->
    _pipe = fun() -> flatten_loop(erlang:element(2, Iterator)) end,
    {iterator, _pipe}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 504).
-spec concat(list(iterator(DWZ))) -> iterator(DWZ).
concat(Iterators) ->
    flatten(from_list(Iterators)).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 526).
-spec flat_map(iterator(DXD), fun((DXD) -> iterator(DXF))) -> iterator(DXF).
flat_map(Iterator, F) ->
    _pipe = Iterator,
    _pipe@1 = map(_pipe, F),
    flatten(_pipe@1).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 562).
-spec filter_loop(fun(() -> action(DXL)), fun((DXL) -> boolean())) -> action(DXL).
filter_loop(Continuation, Predicate) ->
    case Continuation() of
        stop ->
            stop;

        {continue, E, Iterator} ->
            case Predicate(E) of
                true ->
                    {continue, E, fun() -> filter_loop(Iterator, Predicate) end};

                false ->
                    filter_loop(Iterator, Predicate)
            end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 554).
-spec filter(iterator(DXI), fun((DXI) -> boolean())) -> iterator(DXI).
filter(Iterator, Predicate) ->
    _pipe = fun() -> filter_loop(erlang:element(2, Iterator), Predicate) end,
    {iterator, _pipe}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 606).
-spec filter_map_loop(
    fun(() -> action(DXV)),
    fun((DXV) -> {ok, DXX} | {error, any()})
) -> action(DXX).
filter_map_loop(Continuation, F) ->
    case Continuation() of
        stop ->
            stop;

        {continue, E, Next} ->
            case F(E) of
                {ok, E@1} ->
                    {continue, E@1, fun() -> filter_map_loop(Next, F) end};

                {error, _} ->
                    filter_map_loop(Next, F)
            end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 598).
-spec filter_map(iterator(DXO), fun((DXO) -> {ok, DXQ} | {error, any()})) -> iterator(DXQ).
filter_map(Iterator, F) ->
    _pipe = fun() -> filter_map_loop(erlang:element(2, Iterator), F) end,
    {iterator, _pipe}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 632).
-spec cycle(iterator(DYC)) -> iterator(DYC).
cycle(Iterator) ->
    _pipe = repeat(Iterator),
    flatten(_pipe).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 709).
-spec find_loop(fun(() -> action(DYK)), fun((DYK) -> boolean())) -> {ok, DYK} |
    {error, nil}.
find_loop(Continuation, F) ->
    case Continuation() of
        stop ->
            {error, nil};

        {continue, E, Next} ->
            case F(E) of
                true ->
                    {ok, E};

                false ->
                    find_loop(Next, F)
            end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 701).
-spec find(iterator(DYG), fun((DYG) -> boolean())) -> {ok, DYG} | {error, nil}.
find(Haystack, Is_desired) ->
    _pipe = erlang:element(2, Haystack),
    find_loop(_pipe, Is_desired).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 754).
-spec find_map_loop(
    fun(() -> action(DYW)),
    fun((DYW) -> {ok, DYY} | {error, any()})
) -> {ok, DYY} | {error, nil}.
find_map_loop(Continuation, F) ->
    case Continuation() of
        stop ->
            {error, nil};

        {continue, E, Next} ->
            case F(E) of
                {ok, E@1} ->
                    {ok, E@1};

                {error, _} ->
                    find_map_loop(Next, F)
            end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 746).
-spec find_map(iterator(DYO), fun((DYO) -> {ok, DYQ} | {error, any()})) -> {ok,
        DYQ} |
    {error, nil}.
find_map(Haystack, Is_desired) ->
    _pipe = erlang:element(2, Haystack),
    find_map_loop(_pipe, Is_desired).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 783).
-spec index_loop(fun(() -> action(DZH)), integer()) -> fun(() -> action({DZH,
    integer()})).
index_loop(Continuation, Next) ->
    fun() -> case Continuation() of
            stop ->
                stop;

            {continue, E, Continuation@1} ->
                {continue, {E, Next}, index_loop(Continuation@1, Next + 1)}
        end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 777).
-spec index(iterator(DZE)) -> iterator({DZE, integer()}).
index(Iterator) ->
    _pipe = erlang:element(2, Iterator),
    _pipe@1 = index_loop(_pipe, 0),
    {iterator, _pipe@1}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 805).
-spec iterate(DZK, fun((DZK) -> DZK)) -> iterator(DZK).
iterate(Initial, F) ->
    unfold(Initial, fun(Element) -> {next, Element, F(Element)} end).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 832).
-spec take_while_loop(fun(() -> action(DZP)), fun((DZP) -> boolean())) -> fun(() -> action(DZP)).
take_while_loop(Continuation, Predicate) ->
    fun() -> case Continuation() of
            stop ->
                stop;

            {continue, E, Next} ->
                case Predicate(E) of
                    false ->
                        stop;

                    true ->
                        {continue, E, take_while_loop(Next, Predicate)}
                end
        end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 823).
-spec take_while(iterator(DZM), fun((DZM) -> boolean())) -> iterator(DZM).
take_while(Iterator, Predicate) ->
    _pipe = erlang:element(2, Iterator),
    _pipe@1 = take_while_loop(_pipe, Predicate),
    {iterator, _pipe@1}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 868).
-spec drop_while_loop(fun(() -> action(DZV)), fun((DZV) -> boolean())) -> action(DZV).
drop_while_loop(Continuation, Predicate) ->
    case Continuation() of
        stop ->
            stop;

        {continue, E, Next} ->
            case Predicate(E) of
                false ->
                    {continue, E, Next};

                true ->
                    drop_while_loop(Next, Predicate)
            end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 860).
-spec drop_while(iterator(DZS), fun((DZS) -> boolean())) -> iterator(DZS).
drop_while(Iterator, Predicate) ->
    _pipe = fun() -> drop_while_loop(erlang:element(2, Iterator), Predicate) end,
    {iterator, _pipe}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 906).
-spec scan_loop(fun(() -> action(EAC)), fun((EAE, EAC) -> EAE), EAE) -> fun(() -> action(EAE)).
scan_loop(Continuation, F, Accumulator) ->
    fun() -> case Continuation() of
            stop ->
                stop;

            {continue, El, Next} ->
                Accumulated = F(Accumulator, El),
                {continue, Accumulated, scan_loop(Next, F, Accumulated)}
        end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 896).
-spec scan(iterator(DZY), EAA, fun((EAA, DZY) -> EAA)) -> iterator(EAA).
scan(Iterator, Initial, F) ->
    _pipe = erlang:element(2, Iterator),
    _pipe@1 = scan_loop(_pipe, F, Initial),
    {iterator, _pipe@1}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 939).
-spec zip_loop(fun(() -> action(EAL)), fun(() -> action(EAN))) -> fun(() -> action({EAL,
    EAN})).
zip_loop(Left, Right) ->
    fun() -> case Left() of
            stop ->
                stop;

            {continue, El_left, Next_left} ->
                case Right() of
                    stop ->
                        stop;

                    {continue, El_right, Next_right} ->
                        {continue,
                            {El_left, El_right},
                            zip_loop(Next_left, Next_right)}
                end
        end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 934).
-spec zip(iterator(EAG), iterator(EAI)) -> iterator({EAG, EAI}).
zip(Left, Right) ->
    _pipe = zip_loop(erlang:element(2, Left), erlang:element(2, Right)),
    {iterator, _pipe}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1000).
-spec next_chunk(fun(() -> action(EBA)), fun((EBA) -> EBC), EBC, list(EBA)) -> chunk(EBA, EBC).
next_chunk(Continuation, F, Previous_key, Current_chunk) ->
    case Continuation() of
        stop ->
            {last_by, lists:reverse(Current_chunk)};

        {continue, E, Next} ->
            Key = F(E),
            case Key =:= Previous_key of
                true ->
                    next_chunk(Next, F, Key, [E | Current_chunk]);

                false ->
                    {another_by, lists:reverse(Current_chunk), Key, E, Next}
            end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 987).
-spec chunk_loop(fun(() -> action(EAV)), fun((EAV) -> EAX), EAX, EAV) -> action(list(EAV)).
chunk_loop(Continuation, F, Previous_key, Previous_element) ->
    case next_chunk(Continuation, F, Previous_key, [Previous_element]) of
        {last_by, Chunk} ->
            {continue, Chunk, fun stop/0};

        {another_by, Chunk@1, Key, El, Next} ->
            {continue, Chunk@1, fun() -> chunk_loop(Next, F, Key, El) end}
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 974).
-spec chunk(iterator(EAQ), fun((EAQ) -> any())) -> iterator(list(EAQ)).
chunk(Iterator, F) ->
    _pipe = fun() -> case (erlang:element(2, Iterator))() of
            stop ->
                stop;

            {continue, E, Next} ->
                chunk_loop(Next, F, F(E), E)
        end end,
    {iterator, _pipe}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1071).
-spec next_sized_chunk(fun(() -> action(EBO)), integer(), list(EBO)) -> sized_chunk(EBO).
next_sized_chunk(Continuation, Left, Current_chunk) ->
    case Continuation() of
        stop ->
            case Current_chunk of
                [] ->
                    no_more;

                Remaining ->
                    {last, lists:reverse(Remaining)}
            end;

        {continue, E, Next} ->
            Chunk = [E | Current_chunk],
            case Left > 1 of
                false ->
                    {another, lists:reverse(Chunk), Next};

                true ->
                    next_sized_chunk(Next, Left - 1, Chunk)
            end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1050).
-spec sized_chunk_loop(fun(() -> action(EBK)), integer()) -> fun(() -> action(list(EBK))).
sized_chunk_loop(Continuation, Count) ->
    fun() -> case next_sized_chunk(Continuation, Count, []) of
            no_more ->
                stop;

            {last, Chunk} ->
                {continue, Chunk, fun stop/0};

            {another, Chunk@1, Next_element} ->
                {continue, Chunk@1, sized_chunk_loop(Next_element, Count)}
        end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1041).
-spec sized_chunk(iterator(EBG), integer()) -> iterator(list(EBG)).
sized_chunk(Iterator, Count) ->
    _pipe = erlang:element(2, Iterator),
    _pipe@1 = sized_chunk_loop(_pipe, Count),
    {iterator, _pipe@1}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1131).
-spec intersperse_loop(fun(() -> action(EBV)), EBV) -> action(EBV).
intersperse_loop(Continuation, Separator) ->
    case Continuation() of
        stop ->
            stop;

        {continue, E, Next} ->
            Next_interspersed = fun() -> intersperse_loop(Next, Separator) end,
            {continue, Separator, fun() -> {continue, E, Next_interspersed} end}
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1118).
-spec intersperse(iterator(EBS), EBS) -> iterator(EBS).
intersperse(Iterator, Elem) ->
    _pipe = fun() -> case (erlang:element(2, Iterator))() of
            stop ->
                stop;

            {continue, E, Next} ->
                {continue, E, fun() -> intersperse_loop(Next, Elem) end}
        end end,
    {iterator, _pipe}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1179).
-spec any_loop(fun(() -> action(ECA)), fun((ECA) -> boolean())) -> boolean().
any_loop(Continuation, Predicate) ->
    case Continuation() of
        stop ->
            false;

        {continue, E, Next} ->
            case Predicate(E) of
                true ->
                    true;

                false ->
                    any_loop(Next, Predicate)
            end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1171).
-spec any(iterator(EBY), fun((EBY) -> boolean())) -> boolean().
any(Iterator, Predicate) ->
    _pipe = erlang:element(2, Iterator),
    any_loop(_pipe, Predicate).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1228).
-spec all_loop(fun(() -> action(ECE)), fun((ECE) -> boolean())) -> boolean().
all_loop(Continuation, Predicate) ->
    case Continuation() of
        stop ->
            true;

        {continue, E, Next} ->
            case Predicate(E) of
                true ->
                    all_loop(Next, Predicate);

                false ->
                    false
            end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1220).
-spec all(iterator(ECC), fun((ECC) -> boolean())) -> boolean().
all(Iterator, Predicate) ->
    _pipe = erlang:element(2, Iterator),
    all_loop(_pipe, Predicate).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1273).
-spec update_group_with(ECU) -> fun((gleam@option:option(list(ECU))) -> list(ECU)).
update_group_with(El) ->
    fun(Maybe_group) -> case Maybe_group of
            {some, Group} ->
                [El | Group];

            none ->
                [El]
        end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1264).
-spec group_updater(fun((ECM) -> ECN)) -> fun((gleam@dict:dict(ECN, list(ECM)), ECM) -> gleam@dict:dict(ECN, list(ECM))).
group_updater(F) ->
    fun(Groups, Elem) -> _pipe = Groups,
        gleam@dict:upsert(_pipe, F(Elem), update_group_with(Elem)) end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1255).
-spec group(iterator(ECG), fun((ECG) -> ECI)) -> gleam@dict:dict(ECI, list(ECG)).
group(Iterator, Key) ->
    _pipe = Iterator,
    _pipe@1 = fold(_pipe, gleam@dict:new(), group_updater(Key)),
    gleam@dict:map_values(_pipe@1, fun(_, Group) -> lists:reverse(Group) end).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1303).
-spec reduce(iterator(ECY), fun((ECY, ECY) -> ECY)) -> {ok, ECY} | {error, nil}.
reduce(Iterator, F) ->
    case (erlang:element(2, Iterator))() of
        stop ->
            {error, nil};

        {continue, E, Next} ->
            _pipe = fold_loop(Next, F, E),
            {ok, _pipe}
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1333).
-spec last(iterator(EDC)) -> {ok, EDC} | {error, nil}.
last(Iterator) ->
    _pipe = Iterator,
    reduce(_pipe, fun(_, Elem) -> Elem end).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1347).
-spec empty() -> iterator(any()).
empty() ->
    {iterator, fun stop/0}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1360).
-spec once(fun(() -> EDI)) -> iterator(EDI).
once(F) ->
    _pipe = fun() -> {continue, F(), fun stop/0} end,
    {iterator, _pipe}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 657).
-spec range(integer(), integer()) -> iterator(integer()).
range(Start, Stop) ->
    case gleam@int:compare(Start, Stop) of
        eq ->
            once(fun() -> Start end);

        gt ->
            unfold(Start, fun(Current) -> case Current < Stop of
                        false ->
                            {next, Current, Current - 1};

                        true ->
                            done
                    end end);

        lt ->
            unfold(Start, fun(Current@1) -> case Current@1 > Stop of
                        false ->
                            {next, Current@1, Current@1 + 1};

                        true ->
                            done
                    end end)
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1374).
-spec single(EDK) -> iterator(EDK).
single(Elem) ->
    once(fun() -> Elem end).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1405).
-spec interleave_loop(fun(() -> action(EDQ)), fun(() -> action(EDQ))) -> action(EDQ).
interleave_loop(Current, Next) ->
    case Current() of
        stop ->
            Next();

        {continue, E, Next_other} ->
            {continue, E, fun() -> interleave_loop(Next, Next_other) end}
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1397).
-spec interleave(iterator(EDM), iterator(EDM)) -> iterator(EDM).
interleave(Left, Right) ->
    _pipe = fun() ->
        interleave_loop(erlang:element(2, Left), erlang:element(2, Right))
    end,
    {iterator, _pipe}.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1449).
-spec fold_until_loop(
    fun(() -> action(EDY)),
    fun((EEA, EDY) -> gleam@list:continue_or_stop(EEA)),
    EEA
) -> EEA.
fold_until_loop(Continuation, F, Accumulator) ->
    case Continuation() of
        stop ->
            Accumulator;

        {continue, Elem, Next} ->
            case F(Accumulator, Elem) of
                {continue, Accumulator@1} ->
                    fold_until_loop(Next, F, Accumulator@1);

                {stop, Accumulator@2} ->
                    Accumulator@2
            end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1440).
-spec fold_until(
    iterator(EDU),
    EDW,
    fun((EDW, EDU) -> gleam@list:continue_or_stop(EDW))
) -> EDW.
fold_until(Iterator, Initial, F) ->
    _pipe = erlang:element(2, Iterator),
    fold_until_loop(_pipe, F, Initial).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1492).
-spec try_fold_loop(
    fun(() -> action(EEK)),
    fun((EEM, EEK) -> {ok, EEM} | {error, EEN}),
    EEM
) -> {ok, EEM} | {error, EEN}.
try_fold_loop(Continuation, F, Accumulator) ->
    case Continuation() of
        stop ->
            {ok, Accumulator};

        {continue, Elem, Next} ->
            case F(Accumulator, Elem) of
                {ok, Result} ->
                    try_fold_loop(Next, F, Result);

                {error, _} = Error ->
                    Error
            end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1483).
-spec try_fold(iterator(EEC), EEE, fun((EEE, EEC) -> {ok, EEE} | {error, EEF})) -> {ok,
        EEE} |
    {error, EEF}.
try_fold(Iterator, Initial, F) ->
    _pipe = erlang:element(2, Iterator),
    try_fold_loop(_pipe, F, Initial).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1522).
-spec first(iterator(EES)) -> {ok, EES} | {error, nil}.
first(Iterator) ->
    case (erlang:element(2, Iterator))() of
        stop ->
            {error, nil};

        {continue, E, _} ->
            {ok, E}
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1552).
-spec at(iterator(EEW), integer()) -> {ok, EEW} | {error, nil}.
at(Iterator, Index) ->
    _pipe = Iterator,
    _pipe@1 = drop(_pipe, Index),
    first(_pipe@1).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1580).
-spec length_loop(fun(() -> action(any())), integer()) -> integer().
length_loop(Continuation, Length) ->
    case Continuation() of
        stop ->
            Length;

        {continue, _, Next} ->
            length_loop(Next, Length + 1)
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1575).
-spec length(iterator(any())) -> integer().
length(Iterator) ->
    _pipe = erlang:element(2, Iterator),
    length_loop(_pipe, 0).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1604).
-spec each(iterator(EFE), fun((EFE) -> any())) -> nil.
each(Iterator, F) ->
    _pipe = Iterator,
    _pipe@1 = map(_pipe, F),
    run(_pipe@1).

-file("/Users/louis/src/gleam/stdlib/src/gleam/iterator.gleam", 1629).
-spec yield(EFH, fun(() -> iterator(EFH))) -> iterator(EFH).
yield(Element, Next) ->
    {iterator,
        fun() ->
            {continue, Element, fun() -> (erlang:element(2, Next()))() end}
        end}.
