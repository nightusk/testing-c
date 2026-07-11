-module(prop_c).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_fibonacci_number_test() ->
    ?FORALL(N, choose(0, 40),
        begin
            c:fibonacci(N) =:= erl_fibonacci(N)
        end).

prop_fibonacci_badarg_test() ->
    ?FORALL(N, oneof([neg_integer(), large_int()]),
        begin
            try
                c:fibonacci(N),
                false
            catch
                error:badarg -> true;
                error:nif_library_not_loaded -> false
            end
        end).

%%%%%%%%%%%%%%%
%%% Helpers %%%
%%%%%%%%%%%%%%%
erl_fibonacci(0) -> 0;
erl_fibonacci(1) -> 1;
erl_fibonacci(N) when N > 1 -> erl_fibonacci(N - 2) + erl_fibonacci(N - 1).

%%%%%%%%%%%%%%%%%%
%%% Generators %%%
%%%%%%%%%%%%%%%%%%
large_int() ->
    ?LET(X, nat(), X + 1000).
