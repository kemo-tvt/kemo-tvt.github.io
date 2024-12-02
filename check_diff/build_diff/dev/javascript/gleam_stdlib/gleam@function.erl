-module(gleam@function).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([compose/2, curry2/1, curry3/1, curry4/1, curry5/1, curry6/1, flip/1, identity/1, constant/1, tap/2, apply1/2, apply2/3, apply3/4]).

-file("/Users/louis/src/gleam/stdlib/src/gleam/function.gleam", 2).
-spec compose(fun((DPS) -> DPT), fun((DPT) -> DPU)) -> fun((DPS) -> DPU).
compose(Fun1, Fun2) ->
    fun(A) -> Fun2(Fun1(A)) end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/function.gleam", 7).
-spec curry2(fun((DPV, DPW) -> DPX)) -> fun((DPV) -> fun((DPW) -> DPX)).
curry2(Fun) ->
    fun(A) -> fun(B) -> Fun(A, B) end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/function.gleam", 12).
-spec curry3(fun((DPZ, DQA, DQB) -> DQC)) -> fun((DPZ) -> fun((DQA) -> fun((DQB) -> DQC))).
curry3(Fun) ->
    fun(A) -> fun(B) -> fun(C) -> Fun(A, B, C) end end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/function.gleam", 17).
-spec curry4(fun((DQE, DQF, DQG, DQH) -> DQI)) -> fun((DQE) -> fun((DQF) -> fun((DQG) -> fun((DQH) -> DQI)))).
curry4(Fun) ->
    fun(A) -> fun(B) -> fun(C) -> fun(D) -> Fun(A, B, C, D) end end end end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/function.gleam", 22).
-spec curry5(fun((DQK, DQL, DQM, DQN, DQO) -> DQP)) -> fun((DQK) -> fun((DQL) -> fun((DQM) -> fun((DQN) -> fun((DQO) -> DQP))))).
curry5(Fun) ->
    fun(A) ->
        fun(B) ->
            fun(C) -> fun(D) -> fun(E) -> Fun(A, B, C, D, E) end end end
        end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/function.gleam", 27).
-spec curry6(fun((DQR, DQS, DQT, DQU, DQV, DQW) -> DQX)) -> fun((DQR) -> fun((DQS) -> fun((DQT) -> fun((DQU) -> fun((DQV) -> fun((DQW) -> DQX)))))).
curry6(Fun) ->
    fun(A) ->
        fun(B) ->
            fun(C) ->
                fun(D) -> fun(E) -> fun(F) -> Fun(A, B, C, D, E, F) end end end
            end
        end
    end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/function.gleam", 36).
-spec flip(fun((DQZ, DRA) -> DRB)) -> fun((DRA, DQZ) -> DRB).
flip(Fun) ->
    fun(B, A) -> Fun(A, B) end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/function.gleam", 42).
-spec identity(DRC) -> DRC.
identity(X) ->
    X.

-file("/Users/louis/src/gleam/stdlib/src/gleam/function.gleam", 47).
-spec constant(DRD) -> fun((any()) -> DRD).
constant(Value) ->
    fun(_) -> Value end.

-file("/Users/louis/src/gleam/stdlib/src/gleam/function.gleam", 56).
-spec tap(DRF, fun((DRF) -> any())) -> DRF.
tap(Arg, Effect) ->
    Effect(Arg),
    Arg.

-file("/Users/louis/src/gleam/stdlib/src/gleam/function.gleam", 62).
-spec apply1(fun((DRH) -> DRI), DRH) -> DRI.
apply1(Fun, Arg1) ->
    Fun(Arg1).

-file("/Users/louis/src/gleam/stdlib/src/gleam/function.gleam", 67).
-spec apply2(fun((DRJ, DRK) -> DRL), DRJ, DRK) -> DRL.
apply2(Fun, Arg1, Arg2) ->
    Fun(Arg1, Arg2).

-file("/Users/louis/src/gleam/stdlib/src/gleam/function.gleam", 72).
-spec apply3(fun((DRM, DRN, DRO) -> DRP), DRM, DRN, DRO) -> DRP.
apply3(Fun, Arg1, Arg2, Arg3) ->
    Fun(Arg1, Arg2, Arg3).
