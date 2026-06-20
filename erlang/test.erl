-module(test).
-export([]).
-include_lib("eunit/include/eunit.hrl").

init() ->
    RootDir= case os:getenv("REBAR_ROOT_DIR") of
        false ->
            {ok, Cwd} = file:get_cwd(),
            Cwd;
        Dir ->
            Dir
    end,
    SoName = filename:join([RootDir, "erlang", "priv", "erlang"]),
    erlang:load_nif(SoName, 0).

fibonacci(_N) ->
    erlang:nif_error(nif_libary_not_loaded).

fibonacci_number_test() ->
    init(),
    ?assertEqual(8, fibonacci(5)).
