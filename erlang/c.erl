-module(c).
-export([
    fibonacci/1
]).
-on_load(init/0).

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
    erlang:nif_error(nif_library_not_loaded).
