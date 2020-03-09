-module(speak).

-export([run/0, say/2]).

say(_What, 0) -> done;
say(What, Times) ->
    io:fwrite(What ++ "\n"), say(What, Times - 1).

run() ->
    spawn(speak, say, ["hi", 3]),
    spawn(speak, say, ["bye", 3]).
