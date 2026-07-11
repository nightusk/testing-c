-module(test).
-export([]).
-include_lib("eunit/include/eunit.hrl").

fibonacci_number_test() ->
    ?assertEqual(8, c:fibonacci(6)).
