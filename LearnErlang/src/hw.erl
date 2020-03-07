-module(hw).

-export([helloworld/0, helloworld/1]).

% run with: erl => c(hw). => hw:helloworld().
helloworld() -> "hello world".

helloworld(X) -> "hello " ++ X.
