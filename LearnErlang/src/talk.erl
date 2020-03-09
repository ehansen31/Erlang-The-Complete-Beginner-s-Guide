-module(talk).

%% API
-export([alice/0, bob/2, run/0, startAlice/0,
	 startBob/1]).

alice() ->
    receive
      {message, BobNode} ->
	  io:fwrite("Alice got a message\n"),
	  BobNode ! message,
	  alice();
      finished -> io:fwrite("Alice is finished\n")
    end.

bob(0, AliceNode) ->
    AliceNode ! finished, io:fwrite("Bob is finished\n");
bob(N, AliceNode) ->
    AliceNode ! {message, self()},
    receive message -> io:fwrite("Bob got a message\n") end,
    bob(N - 1, AliceNode).

run() ->
    PId = spawn(talk, alice, []),
    spawn(talk, bob, [3, PId]).

startAlice() -> register(alice, spawn(talk, alice, [])).

startBob(AliceNode) -> spawn(talk, bob, [3, AliceNode]).
